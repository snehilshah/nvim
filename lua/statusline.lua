local icons = require("icons")
local tabpages = require("tabpages")

local M = {}

-- Don't show the command that produced the quickfix list.
vim.g.qf_disable_statusline = 1

local function stl_escape(text)
    local escaped = text:gsub("%%", "%%%%")
    return escaped
end

--- Current mode.
---@return string component
---@return string hl
function M.mode_component()
    -- Note that: \19 = ^S and \22 = ^V.
    local mode_to_str = {
        ["n"] = "NORMAL",
        ["no"] = "OP-PENDING",
        ["nov"] = "OP-PENDING",
        ["noV"] = "OP-PENDING",
        ["no\22"] = "OP-PENDING",
        ["niI"] = "NORMAL",
        ["niR"] = "NORMAL",
        ["niV"] = "NORMAL",
        ["nt"] = "NORMAL",
        ["ntT"] = "NORMAL",
        ["v"] = "VISUAL",
        ["vs"] = "VISUAL",
        ["V"] = "VISUAL",
        ["Vs"] = "VISUAL",
        ["\22"] = "VISUAL",
        ["\22s"] = "VISUAL",
        ["s"] = "SELECT",
        ["S"] = "SELECT",
        ["\19"] = "SELECT",
        ["i"] = "INSERT",
        ["ic"] = "INSERT",
        ["ix"] = "INSERT",
        ["R"] = "REPLACE",
        ["Rc"] = "REPLACE",
        ["Rx"] = "REPLACE",
        ["Rv"] = "VIRT REPLACE",
        ["Rvc"] = "VIRT REPLACE",
        ["Rvx"] = "VIRT REPLACE",
        ["c"] = "COMMAND",
        ["cv"] = "VIM EX",
        ["ce"] = "EX",
        ["r"] = "PROMPT",
        ["rm"] = "MORE",
        ["r?"] = "CONFIRM",
        ["!"] = "SHELL",
        ["t"] = "TERMINAL",
    }

    -- Get the respective string to display.
    local mode = mode_to_str[vim.api.nvim_get_mode().mode] or "UNKNOWN"

    -- Set the highlight group.
    local hl = "Other"
    if mode:find("NORMAL") then
        hl = "Normal"
    elseif mode:find("PENDING") then
        hl = "Pending"
    elseif mode:find("VISUAL") then
        hl = "Visual"
    elseif mode:find("INSERT") or mode:find("SELECT") then
        hl = "Insert"
    elseif mode:find("COMMAND") or mode:find("TERMINAL") or mode:find("EX") then
        hl = "Command"
    end

    return mode, hl
end

--- Path relative to the current working directory.
---@return string
function M.relative_path_component()
    local buf_name = vim.api.nvim_buf_get_name(0)
    if buf_name == "" then
        return "[No Name]"
    end

    local path = vim.fn.fnamemodify(buf_name, ":~:.")
    return stl_escape(path)
end

--- Git status (if any).
---@return string
function M.git_component()
    local head = vim.b.gitsigns_head
    if not head or head == "" then
        return ""
    end

    local component = string.format(" %s", head)

    local num_hunks = #(require("gitsigns").get_hunks() or {})
    if num_hunks > 0 then
        component = component .. string.format(" (#Hunks: %d)", num_hunks)
    end

    return stl_escape(component)
end

---@type table<string, string?>
local progress_status = {
    client = nil,
    kind = nil,
    title = nil,
}

vim.api.nvim_create_autocmd("LspProgress", {
    group = vim.api.nvim_create_augroup("mariasolos/statusline", { clear = true }),
    desc = "Update LSP progress in statusline",
    pattern = { "begin", "end" },
    callback = function(args)
        -- This should in theory never happen, but I've seen weird errors.
        if not args.data then
            return
        end

        local client = vim.lsp.get_client_by_id(args.data.client_id)
        progress_status = {
            client = client and client.name or "LSP",
            kind = args.data.params.value.kind,
            title = args.data.params.value.title,
        }

        if progress_status.kind == "end" then
            progress_status.title = nil
            -- Wait a bit before clearing the status.
            vim.defer_fn(function()
                vim.cmd.redrawstatus()
            end, 3000)
        else
            vim.cmd.redrawstatus()
        end
    end,
})
--- The latest LSP progress message.
---@return string
function M.lsp_progress_component()
    if not progress_status.client or not progress_status.title then
        return ""
    end

    -- Avoid noisy messages while typing.
    if vim.startswith(vim.api.nvim_get_mode().mode, "i") then
        return ""
    end

    return string.format(
        "󱥸 %s  %s...",
        stl_escape(progress_status.client),
        stl_escape(progress_status.title)
    )
end

--- The buffer's filetype.
---@return string
function M.filetype_component()
    -- Special icons for some filetypes.
    local special_icons = {
        DiffviewFileHistory = { icons.misc.git, "Number" },
        DiffviewFiles = { icons.misc.git, "Number" },
        ["ccc-ui"] = { icons.misc.palette, "Comment" },
        ["dap-view"] = { icons.misc.bug, "Special" },
        ["grug-far"] = { icons.misc.search, "Constant" },
        fzf = { icons.misc.terminal, "Special" },
        gitcommit = { icons.misc.git, "Number" },
        gitrebase = { icons.misc.git, "Number" },
        lazy = { icons.symbol_kinds.Method, "Special" },
        lazyterm = { icons.misc.terminal, "Special" },
        minifiles = { icons.symbol_kinds.Folder, "Directory" },
        qf = { icons.misc.search, "Conditional" },
    }

    local filetype = vim.bo.filetype
    if filetype == "" then
        filetype = "[No Name]"
    end

    local icon
    if special_icons[filetype] then
        icon = special_icons[filetype][1]
    else
        local ok, devicons = pcall(require, "nvim-web-devicons")
        if ok then
            local buf_name = vim.api.nvim_buf_get_name(0)
            local name, ext = vim.fn.fnamemodify(buf_name, ":t"), vim.fn.fnamemodify(buf_name, ":e")

            icon = devicons.get_icon(name, ext)
            if not icon then
                icon = devicons.get_icon_by_filetype(filetype, { default = true })
            end
        end
    end
    icon = icon or icons.misc.file

    return string.format("%s %s", icon, stl_escape(filetype))
end

--- Active LSP clients for the current buffer.
---@return string
function M.lsp_clients_component()
    -- Copilot is skipped: it has its own island (ai_component). Counting it here
    -- inflated every buffer to `lua_ls[+1]` and hid whichever real server came second.
    local clients = {}
    for _, client in ipairs(vim.lsp.get_clients({ bufnr = 0 })) do
        if client.name ~= "copilot" then
            clients[#clients + 1] = client.name
        end
    end

    if #clients == 0 then
        return ""
    end

    local client = clients[1]
    if #clients > 1 then
        client = string.format("%s[+%d]", client, #clients - 1)
    end

    return stl_escape(client)
end

--- Diagnostic counts for the current buffer.
--- Content and format come from vim.diagnostic.status(), configured once in
--- lua/lsp.lua. It deliberately contains no highlight switches, so it inherits the
--- mode pill's foreground and background and remains readable in every mode.
---@return string
function M.diagnostics_component()
    return vim.diagnostic.status()
end

local ai_spinner = { "⠋", "⠙", "⠹", "⠸", "⠼", "⠴", "⠦", "⠧", "⠇", "⠏" }
local ai_spinner_timer = nil

---@param active boolean
local function ai_tick(active)
    if active and not ai_spinner_timer then
        ai_spinner_timer = assert(vim.uv.new_timer())
        ai_spinner_timer:start(
            0,
            100,
            vim.schedule_wrap(function()
                vim.cmd.redrawstatus()
            end)
        )
    elseif not active and ai_spinner_timer then
        ai_spinner_timer:stop()
        ai_spinner_timer:close()
        ai_spinner_timer = nil
    end
end

local ai_group = vim.api.nvim_create_augroup("snehilshah/statusline_ai", { clear = true })

-- Ghost text lands asynchronously, after you have stopped typing, and core fires no
-- event when it does. Without a tick the island would sit a suggestion behind, and
-- the spinner would not spin. Insert mode is the only mode ghost text appears in, so
-- the timer is scoped to exactly that, on copilot buffers only.
vim.api.nvim_create_autocmd({ "InsertEnter", "InsertLeave" }, {
    group = ai_group,
    desc = "Drive Copilot island redraws",
    callback = function(args)
        ai_tick(
            args.event == "InsertEnter"
                and #vim.lsp.get_clients({ bufnr = args.buf, name = "copilot" }) > 0
        )
    end,
})

-- NES arrives in normal mode, outside the insert-mode tick above. sidekick announces
-- it, so a single redraw is enough -- no timer needed for this half.
vim.api.nvim_create_autocmd("User", {
    group = ai_group,
    pattern = "SidekickNesDone",
    desc = "Refresh Copilot island when a next edit suggestion lands",
    callback = function()
        vim.cmd.redrawstatus()
    end,
})

-- vim.lsp.inline_completion draws its ghost text into this namespace but exposes no
-- "is a suggestion showing?" API, so the extmark is the only honest signal. The name
-- follows core's `nvim.*` namespace convention and is stable across 0.12.
local inline_completion_ns = nil

--- Whether Copilot is currently showing ghost text in the given buffer.
---@param buf integer
---@return boolean
local function has_inline_suggestion(buf)
    inline_completion_ns = inline_completion_ns
        or vim.api.nvim_get_namespaces()["nvim.lsp.inline_completion"]
    if not inline_completion_ns then
        return false
    end

    local marks = vim.api.nvim_buf_get_extmarks(buf, inline_completion_ns, 0, -1, { limit = 1 })
    return #marks > 0
end

--- Copilot island for the current buffer.
---
--- Present whenever Copilot is attached, so its absence is itself information
--- (denied buffer, or the client failed to start).
---
--- Sidekick also draws the NES diff in the buffer; this island makes the pending
--- state visible even when the edit is outside the current viewport.
---
---           attached, nothing pending
---    ✓      ghost text on screen, <M-l> takes it
---    NES    a next edit is waiting, <M-l> jumps to or applies it
---    ⠹      request in flight
---           client errored
---
--- State rides on a trailing glyph rather than colour. Tinting was tried and cannot
--- be made theme-proof: the pill background follows the *mode*, so any semantic
--- foreground eventually lands on a mode that shares it. gruvbox-material is exactly
--- that case -- DiagnosticSignInfo and StatuslineModeInsert are both #7daea3, so the
--- "suggestion ready" state, which only ever occurs in insert mode, drew itself
--- invisible. The pill's own foreground is the one colour a theme guarantees is
--- readable here.
---@return string
function M.ai_component()
    local buf = vim.api.nvim_get_current_buf()
    if #vim.lsp.get_clients({ bufnr = buf, name = "copilot" }) == 0 then
        return ""
    end

    -- render() runs on every redraw, so this must never require() sidekick --
    -- that would drag the plugin in at startup and undo its lazy loading.
    local sidekick_status = package.loaded["sidekick.status"]
    local status = sidekick_status and sidekick_status.get()

    local icon, state = icons.copilots.pilot, ""
    if status and status.kind == "Error" then
        icon = icons.copilots.pilot_error
    elseif status and status.busy then
        state = ai_spinner[math.floor(vim.uv.now() / 100) % #ai_spinner + 1]
    else
        local nes = package.loaded["sidekick.nes"]
        if nes and nes.have() then
            icon, state = icons.copilots.pilot_warning, "NES"
        elseif has_inline_suggestion(buf) then
            state = "✓"
        end
    end

    local content = state == "" and icon or string.format("%s %s", icon, state)
    return content .. " "
end

--- The current line, total line count, and column position.
---@return string
function M.position_component()
    local line = vim.fn.line(".")
    local line_count = vim.api.nvim_buf_line_count(0)
    local col = vim.fn.virtcol(".")

    return string.format("l: %d/%d c:%-3d", line, line_count, col)
end

--- The current tab's purpose and position among real tabpages.
---@return string
function M.tabpage_component()
    return tabpages.component()
end

--- Renders the statusline.
---@param component string
---@param default_hl string
---@param hl string?
---@return string
local function wrap_component(component, default_hl, hl)
    if #component == 0 then
        return ""
    end

    hl = hl or default_hl
    return table.concat({
        string.format("%%#StatuslineModeSeparator%s#", hl),
        string.format("%%#StatuslineMode%s#", hl),
        component,
        string.format("%%#StatuslineModeSeparator%s#", hl),
    })
end

---@param components { component: string, hl: string? }[]
---@param default_hl string
---@return string
local function concat_components(components, default_hl)
    local acc = ""
    for _, component in ipairs(components) do
        local rendered = wrap_component(component.component, default_hl, component.hl)
        if #rendered > 0 then
            acc = #acc == 0 and rendered or string.format("%s %s", acc, rendered)
        end
    end
    return acc
end

--- Renders the statusline.
---@return string
function M.render()
    local mode, mode_hl = M.mode_component()

    return table.concat({
        concat_components({
            { component = mode, hl = mode_hl },
            { component = M.tabpage_component() },
            { component = M.relative_path_component() },
            { component = M.git_component() },
            { component = M.lsp_progress_component() },
        }, mode_hl),
        "%#StatusLine#%=",
        concat_components({
            { component = M.ai_component() },
            { component = M.diagnostics_component() },
            { component = M.filetype_component() },
            { component = M.lsp_clients_component() },
            { component = M.position_component() },
        }, mode_hl),
        " ",
    })
end
vim.o.statusline = "%!v:lua.require'statusline'.render()"

return M
