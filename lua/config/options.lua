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

vim.opt.expandtab = true
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

-- time in ms for CursorHold to trigger (affects document highlight, swap file writes)
vim.opt.updatetime = 250

-- disable the vim cmd line until required, this will overwrite the statusline when cmd is required
vim.opt.cmdheight = 0

-- set the default border for all floating windows rounded
vim.opt.winborder = "rounded"

vim.schedule(function()
	vim.o.clipboard = "unnamedplus"
end)

vim.opt.virtualedit = "block"
vim.o.inccommand = "split"
-- searched terms get highlighted
vim.opt.hlsearch = true
-- Enable full terminal color support
vim.opt.termguicolors = true
vim.o.background = "dark"

-- Tell Neovim the terminal supports RGB colors (24-bit true color)
vim.env.COLORTERM = "truecolor"
vim.o.termguicolors = true

vim.o.cursorline = true
vim.opt.cursorlineopt = "both" -- Options: "both", "line", "number", "screenline"

vim.o.confirm = true
vim.opt.laststatus = 3

-- Treesitter-based code folding
vim.opt.foldenable = true
vim.opt.foldcolumn = "1"
vim.opt.foldexpr = "v:lua.vim.treesitter.foldexpr()"
vim.opt.foldlevel = 99 -- Start with all folds open
vim.opt.foldlevelstart = 99
vim.opt.foldmethod = "expr"

-- Configure diagnostic signs with icons
local signs = { Error = "󰅚 ", Warn = "󰀪 ", Hint = "󰌶 ", Info = " " }
for type, icon in pairs(signs) do
	local hl = "DiagnosticSign" .. type
	vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end

-- Listchars - only show when lines are selected (like VS Code)
vim.o.list = false -- disabled by default
vim.opt.listchars = { tab = "▸ ", trail = "·", nbsp = "␣", extends = "…", space = "·", lead = "·" }

-- Show listchars only in visual mode selection
local listchars_group = vim.api.nvim_create_augroup("ListcharsOnSelect", { clear = true })

vim.api.nvim_create_autocmd("ModeChanged", {
	group = listchars_group,
	pattern = { "*:v", "*:V", "*:\22" }, -- entering visual, visual-line, or visual-block mode
	callback = function()
		vim.o.list = true
	end,
})

vim.api.nvim_create_autocmd("ModeChanged", {
	group = listchars_group,
	pattern = { "v:*", "V:*", "\22:*" }, -- leaving visual modes
	callback = function()
		vim.o.list = false
	end,
})

-- Filetype detection
vim.filetype.add({
	extension = {
		mdx = "mdx",
	},
})
