local M = {}

local function tab_label(tabpage)
    local neogit = false

    for _, win in ipairs(vim.api.nvim_tabpage_list_wins(tabpage)) do
        local buf = vim.api.nvim_win_get_buf(win)
        local filetype = vim.bo[buf].filetype
        local name = vim.api.nvim_buf_get_name(buf)
        local basename = vim.fn.fnamemodify(name, ":t")

        if
            vim.startswith(filetype, "codediff")
            or vim.startswith(basename, "CodeDiff")
            or vim.startswith(name, "codediff://")
        then
            return "CODEDIFF"
        end

        if vim.startswith(filetype, "Neogit") then
            neogit = true
        end
    end

    return neogit and "NEOGIT" or "EDITING"
end

function M.current_label()
    return tab_label(vim.api.nvim_get_current_tabpage())
end

function M.component()
    return string.format(
        "%s · TAB %d/%d",
        M.current_label(),
        vim.fn.tabpagenr(),
        vim.fn.tabpagenr("$")
    )
end

function M.close_buffer()
    local label = M.current_label()
    if label == "EDITING" then
        vim.cmd.BufferClose()
        return
    end

    vim.notify(
        string.format("This is a %s tab. Press q to close it.", label),
        vim.log.levels.WARN,
        { title = "Tabs" }
    )
end

return M
