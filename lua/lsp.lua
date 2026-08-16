---@diagnostic disable: undefined-doc-name
local diagnostic_icons = require("icons").diagnostics

local M = {}

-- Disable inlay hints initially (and enable if needed with my ToggleInlayHints command).
vim.g.inlay_hints = false

--- Sets up LSP keymaps and autocommands for the given buffer.
---@param client vim.lsp.Client
---@param bufnr integer
local function on_attach(client, bufnr)
    ---@param lhs string
    ---@param rhs string|function
    ---@param opts string|vim.keymap.set.Opts
    ---@param mode? string|string[]
    local function keymap(lhs, rhs, opts, mode)
        mode = mode or "n"
        ---@cast opts vim.keymap.set.Opts
        opts = type(opts) == "string" and { desc = opts } or opts
        opts.buffer = bufnr
        vim.keymap.set(mode, lhs, rhs, opts)
    end

    keymap("[e", function()
        vim.diagnostic.jump({ count = -1, severity = { min = vim.diagnostic.severity.WARN } })
    end, "Previous error/warning")
    keymap("]e", function()
        vim.diagnostic.jump({ count = 1, severity = { min = vim.diagnostic.severity.WARN } })
    end, "Next error/warning")

    if client:supports_method("textDocument/hover") then
        keymap("K", function()
            vim.lsp.buf.hover({
                max_height = math.floor(vim.o.lines * 0.5),
                max_width = math.floor(vim.o.columns * 0.4),
            })
        end, "Hover documentation")
    end

    if client:supports_method("textDocument/codeAction") then
        require("lightbulb").attach_lightbulb(bufnr, client)
    end

    if client:supports_method("textDocument/documentColor") then
        keymap("grc", function()
            vim.lsp.document_color.color_presentation()
        end, "vim.lsp.document_color.color_presentation()", { "n", "x" })
    end

    if client:supports_method("textDocument/references") then
        keymap("grp", function()
            require("fzf-lua").lsp_references({
                jump1 = false,
                includeDeclaration = false,
                ignore_current_line = false,
            })
        end, "Find references")
    end

    if client:supports_method("textDocument/typeDefinition") then
        keymap("gy", "<cmd>FzfLua lsp_typedefs<cr>", "Go to type definition")
    end

    if client:supports_method("textDocument/documentSymbol") then
        keymap("<leader>fs", "<cmd>FzfLua lsp_document_symbols<cr>", "Document symbols")
    end

    if client:supports_method("workspace/symbol") then
        keymap("<leader>fS", "<cmd>FzfLua lsp_live_workspace_symbols<cr>", "Workspace symbols")
    end

    if client:supports_method("textDocument/definition") then
        keymap("gd", function()
            require("fzf-lua").lsp_definitions({ jump1 = true })
        end, "Go to definition")
    end

    if client:supports_method("textDocument/declaration") then
        keymap("gD", vim.lsp.buf.declaration, "Go to declaration")
    end

    if client:supports_method("textDocument/implementation") then
        keymap("gri", "<cmd>FzfLua lsp_implementations<cr>", "Go to implementation")
    end

    if client:supports_method("textDocument/codeAction") then
        keymap("gra", function()
            require("tiny-code-action").code_action()
        end, "Code action (tiny)", { "n", "x" })
    end

    if client:supports_method("textDocument/rename") then
        keymap("<leader>rn", function()
            local cword = vim.fn.expand("<cword>")
            vim.ui.input({ prompt = "Rename: ", default = cword }, function(new_name)
                if not new_name or new_name == "" or new_name == cword then
                    return
                end
                vim.lsp.buf.rename(new_name)
            end)
        end, "Rename symbol")
        -- nvim 0.11 default `grn` also calls vim.lsp.buf.rename(); leader keeps a memorable alias.
    end

    -- Blink owns insert-mode signature help. It applies its buffer-local <C-k>
    -- mapping on InsertEnter, after LspAttach.

    if client:supports_method("textDocument/documentHighlight") then
        local under_cursor_highlights_group =
            vim.api.nvim_create_augroup("mariasolos/cursor_highlights", { clear = false })
        -- on_attach may run again for this buffer (dynamic capability registration),
        -- so drop this buffer's previous autocmds instead of stacking duplicates.
        vim.api.nvim_clear_autocmds({ group = under_cursor_highlights_group, buffer = bufnr })
        vim.api.nvim_create_autocmd({ "CursorHold", "InsertLeave" }, {
            group = under_cursor_highlights_group,
            desc = "Highlight references under the cursor",
            buffer = bufnr,
            callback = vim.lsp.buf.document_highlight,
        })
        vim.api.nvim_create_autocmd({ "CursorMoved", "InsertEnter", "BufLeave" }, {
            group = under_cursor_highlights_group,
            desc = "Clear highlight references",
            buffer = bufnr,
            callback = vim.lsp.buf.clear_references,
        })
    end

    if client:supports_method("textDocument/codeLens") then
        keymap("<leader>cc", vim.lsp.codelens.run, "Run code lens action")
        vim.lsp.codelens.enable(true, { bufnr = bufnr })
    end

    if client:supports_method("textDocument/inlayHint") then
        local inlay_hints_group =
            vim.api.nvim_create_augroup("mariasolos/toggle_inlay_hints", { clear = false })
        -- Same reasoning as the cursor-highlight group: clear this buffer's entries
        -- so a re-run of on_attach cannot stack duplicate autocmds.
        vim.api.nvim_clear_autocmds({ group = inlay_hints_group, buffer = bufnr })

        if vim.g.inlay_hints then
            -- Initial inlay hint display.
            -- Idk why but without the delay inlay hints aren't displayed at the very start.
            vim.defer_fn(function()
                local mode = vim.api.nvim_get_mode().mode
                vim.lsp.inlay_hint.enable(mode == "n" or mode == "v", { bufnr = bufnr })
            end, 500)
        end

        vim.api.nvim_create_autocmd("InsertEnter", {
            group = inlay_hints_group,
            desc = "Enable inlay hints",
            buffer = bufnr,
            callback = function()
                if vim.g.inlay_hints then
                    vim.lsp.inlay_hint.enable(false, { bufnr = bufnr })
                end
            end,
        })

        vim.api.nvim_create_autocmd("InsertLeave", {
            group = inlay_hints_group,
            desc = "Disable inlay hints",
            buffer = bufnr,
            callback = function()
                if vim.g.inlay_hints then
                    vim.lsp.inlay_hint.enable(true, { bufnr = bufnr })
                end
            end,
        })
    end
end

-- Severity-number → icon mapping, used by status.format.
local severity_icons = {
    [vim.diagnostic.severity.ERROR] = diagnostic_icons.ERROR,
    [vim.diagnostic.severity.WARN] = diagnostic_icons.WARN,
    [vim.diagnostic.severity.INFO] = diagnostic_icons.INFO,
    [vim.diagnostic.severity.HINT] = diagnostic_icons.HINT,
}

local diagnostic_severity_order = {
    vim.diagnostic.severity.ERROR,
    vim.diagnostic.severity.WARN,
    vim.diagnostic.severity.INFO,
    vim.diagnostic.severity.HINT,
}

---@param severity_counts table<vim.diagnostic.Severity, integer>
---@return string
local function diagnostic_status(severity_counts)
    local items = {}
    for _, severity in ipairs(diagnostic_severity_order) do
        local count = severity_counts[severity]
        if count and count > 0 then
            items[#items + 1] = string.format("%s:%d", severity_icons[severity], count)
        end
    end

    return table.concat(items, " ")
end

-- Diagnostic configuration.
-- tiny-inline-diagnostic.nvim owns inline rendering; native rendering disabled.
vim.diagnostic.config({
    status = { format = diagnostic_status },
    virtual_text = false,
    virtual_lines = false,
    signs = false,
    underline = false,
    float = {
        source = "if_many",
        prefix = function(diag)
            local level = vim.diagnostic.severity[diag.severity]
            local prefix = string.format(" %s ", diagnostic_icons[level])
            return prefix, "Diagnostic" .. level:gsub("^%l", string.upper)
        end,
    },
})

-- Re-apply buffer setup when a server registers a capability *after* attaching
-- (LSP dynamic registration). Without this, keymaps gated on `supports_method`
-- at attach time would never be created for late-arriving capabilities.
--
-- Differences from the old LazyVim-era version this replaces:
--   * the core handler runs FIRST, so `supports_method()` already sees the new
--     capability when on_attach re-runs (the old one ran on_attach first);
--   * it re-attaches to every buffer this client is actually attached to,
--     instead of `nvim_get_current_buf()`, which was often the wrong buffer;
--   * the autocmd groups in on_attach clear per buffer, so re-running cannot
--     stack duplicate document-highlight / inlay-hint autocmds.
local register_capability = vim.lsp.handlers["client/registerCapability"]
vim.lsp.handlers["client/registerCapability"] = function(err, res, ctx)
    local result = register_capability(err, res, ctx)

    local client = vim.lsp.get_client_by_id(ctx.client_id)
    if client then
        -- `attached_buffers` is keyed by bufnr (get_buffers_by_client_id is deprecated).
        for bufnr in pairs(client.attached_buffers or {}) do
            if vim.api.nvim_buf_is_loaded(bufnr) then
                on_attach(client, bufnr)
            end
        end
    end

    return result
end

vim.api.nvim_create_autocmd("LspAttach", {
    desc = "Configure LSP keymaps",
    callback = function(args)
        local client = vim.lsp.get_client_by_id(args.data.client_id)

        -- I don't think this can happen but it's a wild world out there.
        if not client then
            return
        end

        on_attach(client, args.buf)
    end,
})

-- Extend neovim's client capabilities with the completion ones.
-- Neovim disables LSP file watching on Linux by default. Enable it so servers
-- notice files created outside the current buffer without needing a restart.
local capabilities = require("blink.cmp").get_lsp_capabilities(nil, true)
capabilities.workspace.didChangeWatchedFiles.dynamicRegistration = true

vim.lsp.config("*", {
    capabilities = capabilities,
})
-- Exposed on M so :CheckTools can audit these against $PATH.
M.servers = {
    "lua_ls", -- Lua
    "vimdoc_ls", -- Vimdoc
    "buf_ls", -- Protobuf via Buf workspaces/modules
    "gopls", -- Go, you might see 2 processes, spawned for gopls, most likely one of them is just telemetry, check `pgrep -a gopls`
    "basedpyright", -- Python: LSP features and type checking
    "tsgo", -- TypeScript/JavaScript
    "angularls", -- Angular Language Service (template intelligence, requires @angular/language-server)
    "biome", -- Biome (linting/formatting for JS/TS/JSON - only activates with biome.json)
    "bashls", -- Bash/Shell
    "cssls", -- CSS/SCSS/Less
    "html", -- HTML
    "jsonls", -- JSON
    "yamlls", -- YAML
    "dockerls", -- Docker
    "clangd", -- C/C++
    "tailwindcss", -- Tailwind CSS
    "emmet_language_server", -- Emmet
    "astro",
    -- Inline completions and Next Edit Suggestions. Buffer gate in
    -- after/lsp/copilot.lua, wiring in lua/plugins/ai/sidekick.lua.
    "copilot",
}
vim.lsp.enable(M.servers)

return M
