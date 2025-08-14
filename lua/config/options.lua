vim.opt.number = true
vim.opt.relativenumber = true

vim.opt.splitbelow = true
vim.opt.splitright = true

vim.opt.wrap = false

vim.opt.expandtab = true;
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4

vim.o.showmode = false

vim.schedule(function()
	vim.o.clipboard = 'unnamedplus'
end)

-- vim.o.list = true
-- vim.opt.listchars = { tab = '',trail = '·', nbsp = '␣' }
-- vim.opt.listchars = { trail = '·', nbsp = '␣' }

vim.opt.virtualedit = "block"
vim.o.inccommand = 'split'

vim.opt.ignorecase = true

vim.opt.termguicolors = true
vim.o.background = "dark"

vim.o.cursorline = true

vim.o.confirm = true
