local api = vim.api

api.nvim_create_autocmd("FileType", {
    group = vim.api.nvim_create_augroup("snehilshah/big_file", { clear = true }),
    desc = "Disable features in big files",
    pattern = "bigfile",
    callback = function(args)
        vim.schedule(function()
            vim.bo[args.buf].syntax = vim.filetype.match({ buf = args.buf }) or ""
        end)
    end,
})

api.nvim_create_autocmd("FileType", {
    group = api.nvim_create_augroup("snehilshah/close_with_q", { clear = true }),
    desc = "Close certain filetypes with <q>",
    pattern = {
        "git",
        "help",
        "man",
        "qf",
        "scratch",
        "PlenaryTestPopup",
        "lspinfo",
        "notify",
        "spectre_panel",
        "startuptime",
        "tsplayground",
        "neotest-output",
        "checkhealth",
        "neotest-summary",
        "neotest-output-panel",
        "codediff",
    },
    callback = function(args)
        if args.match ~= "help" or not vim.bo[args.buf].modifiable then
            vim.keymap.set("n", "q", "<cmd>quit<cr>", { buffer = args.buf })
        end
    end,
})

api.nvim_create_autocmd("BufEnter", {
    command = [[set formatoptions-=cro]],
    desc = "Don't auto comment new line",
})

api.nvim_create_autocmd("BufReadPost", {
    group = api.nvim_create_augroup("snehilshah/last_location", { clear = true }),
    desc = "Go to the last location when opening a buffer",
    callback = function(args)
        local mark = vim.api.nvim_buf_get_mark(args.buf, '"')
        local line_count = vim.api.nvim_buf_line_count(args.buf)
        if mark[1] > 0 and mark[1] <= line_count then
            vim.cmd('normal! g`"zz')
        end
    end,
})

-- Stop eslint_d daemon on exit (prevents orphaned processes)
api.nvim_create_autocmd("VimLeavePre", {
    callback = function()
        if vim.fn.executable("eslint_d") == 1 then
            vim.fn.system({ "eslint_d", "stop" })
        end
    end,
})

vim.api.nvim_create_autocmd("TextYankPost", {
    group = vim.api.nvim_create_augroup("snehilshah/yank_highlight", { clear = true }),
    desc = "Highlight on yank",
    callback = function()
        vim.hl.on_yank({ higroup = "Visual" })
    end,
})
