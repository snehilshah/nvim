-- relative line numbering
vim.opt.number = true
vim.opt.relativenumber = true

-- save undos between sessions
vim.opt.undofile = true

-- new splits will appear on the right/bottom for respective vertical/horizontal splits
vim.opt.splitbelow = true
vim.opt.splitright = true

vim.opt.wrap = false

-- Case-incesitive searching, unless \C or one or more capital letters in the search term
vim.opt.ignorecase = true
vim.opt.smartcase = true

vim.opt.expandtab = true;
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4

vim.opt.smarttab = true
vim.opt.smartindent = true
vim.opt.autoindent = true

vim.opt.mouse = "a"

-- dont show the mode in the cmd since it is already there in the custom status line
vim.o.showmode = false

-- show the gurret bar next to the number line
vim.opt.signcolumn = "yes"

-- minimum number of screen lines to keep above and below the cursor, to have a context
vim.opt.scrolloff = 5

-- disable the vim cmd line until required, this will overwrite the statusline when cmd is required
vim.opt.cmdheight = 0

-- set the default border for all floating windows rounded
vim.opt.winborder = "rounded"

vim.schedule(function()
	vim.o.clipboard = 'unnamedplus'
end)

-- vim.o.list = true
-- vim.opt.listchars = { tab = '',trail = '·', nbsp = '␣' }
-- vim.opt.listchars = { trail = '·', nbsp = '␣' }

vim.opt.virtualedit = "block"
vim.o.inccommand = 'split'


vim.opt.termguicolors = true
vim.o.background = "dark"

vim.o.cursorline = true

vim.o.confirm = true
