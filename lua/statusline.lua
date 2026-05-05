local icons = require("icons")

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

        progress_status = {
            client = vim.lsp.get_client_by_id(args.data.client_id).name,
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
    local devicons = require("nvim-web-devicons")

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
        local buf_name = vim.api.nvim_buf_get_name(0)
        local name, ext = vim.fn.fnamemodify(buf_name, ":t"), vim.fn.fnamemodify(buf_name, ":e")

        icon = devicons.get_icon(name, ext)
        if not icon then
            icon = devicons.get_icon_by_filetype(filetype, { default = true })
        end
    end
    icon = icon or icons.misc.file

    return string.format("%s %s", icon, stl_escape(filetype))
end

--- Active LSP clients for the current buffer.
---@return string
function M.lsp_clients_component()
    local clients = vim.lsp.get_clients({ bufnr = 0 })
    if #clients == 0 then
        return ""
    end

    local client = clients[1].name
    if #clients > 1 then
        client = string.format("%s[+%d]", client, #clients - 1)
    end

    return stl_escape(client)
end

--- Diagnostic counts for the current buffer.
---@return string
function M.diagnostics_component()
    local diagnostic_counts = vim.diagnostic.count(0)
    local severities = {
        { severity = vim.diagnostic.severity.ERROR, icon = icons.diagnostics.ERROR },
        { severity = vim.diagnostic.severity.WARN, icon = icons.diagnostics.WARN },
        { severity = vim.diagnostic.severity.INFO, icon = icons.diagnostics.INFO },
        { severity = vim.diagnostic.severity.HINT, icon = icons.diagnostics.HINT },
    }

    local parts = {}
    for _, item in ipairs(severities) do
        local count = diagnostic_counts[item.severity]
        if count and count > 0 then
            table.insert(parts, string.format("%s:%d", item.icon, count))
        end
    end

    return table.concat(parts, " ")
end

--- The current line, total line count, and column position.
---@return string
function M.position_component()
    local line = vim.fn.line(".")
    local line_count = vim.api.nvim_buf_line_count(0)
    local col = vim.fn.virtcol(".")

    return string.format("l: %d/%d c: %d", line, line_count, col)
end

--- Renders the statusline.
---@param component string
---@param hl string?
---@param mode_hl string
---@return string
local function wrap_component(component, hl, mode_hl)
    if #component == 0 then
        return ""
    end

    hl = hl or mode_hl
    return table.concat({
        string.format("%%#StatuslineModeSeparator%s#", hl),
        string.format("%%#StatuslineMode%s#", hl),
        component,
        string.format("%%#StatuslineModeSeparator%s#", hl),
    })
end

---@param components { component: string, hl: string? }[]
---@param mode_hl string
---@return string
local function concat_components(components, mode_hl)
    local acc = ""
    for _, component in ipairs(components) do
        local rendered = wrap_component(component.component, component.hl, mode_hl)
        if #rendered > 0 then
            if #acc == 0 then
                acc = rendered
            else
                acc = string.format("%s %s", acc, rendered)
            end
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
            { component = M.relative_path_component() },
            { component = M.git_component() },
            { component = M.lsp_progress_component() },
        }, mode_hl),
        "%#StatusLine#%=",
        concat_components({
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
