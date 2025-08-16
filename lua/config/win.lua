-- Fix flickering line numbers on windows terminal
vim.api.nvim_create_autocmd({ "CursorMoved", "CursorMovedI" }, {
    group = "ui_enhancements",
    callback = function()
        vim.o.cursorline = false
        vim.o.cursorline = true
    end,
})

if vim.fn.has("wsl") == 1 then
    local win32yank = "win32yank.exe"
    if vim.fn.getftype(vim.fn.exepath(win32yank)) == "link" then
        win32yank = vim.fn.resolve(vim.fn.exepath(win32yank))
    end

    vim.g.clipboard = {
        name = "win32yank",
        copy = {
            ["+"] = { win32yank, "-i", "--crlf" },
            ["*"] = { win32yank, "-i", "--crlf" },
        },
        paste = {
            ["+"] = { win32yank, "-o", "--lf" },
            ["*"] = { win32yank, "-o", "--lf" },
        },
        cache_enabled = 1, -- cache fixes del lag
    }
end
