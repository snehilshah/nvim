vim.api.nvim_create_autocmd('TextYankPost', {
	desc = 'Highlight when yanking (copying) text',
	group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
	callback = function()
		vim.highlight.on_yank()
	end,
})

require("config.lazy") -- find a file that has config/lazy

vim.opt.shiftwidth = 4
vim.opt.clipboard = "unnamedplus"
vim.keymap.set("n", "<space><space>x", "<cmd>source %<CR>")
vim.keymap.set("n", "<space>x", ":.lua<CR>")

vim.opt.number = true
vim.opt.relativenumber = true

vim.cmd [[hi @function.builtin guifg=pink]]
