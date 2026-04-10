local arrows = require("icons").arrows
-- ============================================================================
-- Editor Behavior
-- ============================================================================
-- enable mouse support in all modes
vim.opt.mouse = "a"
vim.opt.clipboard = "unnamedplus"
-- save undos between sessions
vim.opt.undofile = true
vim.opt.undodir = vim.fn.stdpath("data") .. "/undo"
-- faster completion (default is 4000ms)
vim.opt.updatetime = 300
-- time to wait for a mapped sequence to complete (in milliseconds)
vim.opt.timeoutlen = 500
-- quick esc key
vim.o.ttimeoutlen = 10
-- confirm before exiting a modified buffer
vim.opt.confirm = true
-- automatically reload files changed outside of nvim
vim.opt.autoread = true

-- ============================================================================
-- UI/Display
-- ============================================================================
-- Tell Neovim the terminal supports RGB colors (8-bit true color)
-- note_to_self: your laptop and office laptop supports this
vim.opt.termguicolors = true
vim.env.COLORTERM = "truecolor"
vim.o.background = "dark"
-- relative line numbering
vim.opt.number = true
vim.opt.relativenumber = true
-- the number column on the left with the allowed width of 4
vim.opt.numberwidth = 1
-- the 2 is required in case of 3 digist relative numbers caused by easy motions
-- the sign column of the left with the width of 2
vim.opt.signcolumn = "yes"
-- the faded highlight line on the active line
vim.o.cursorline = true
-- here both signifies that highlight the text and the line number as well, number signifies only the number line
vim.opt.cursorlineopt = "number" -- Options: "both", "line", "number", "screenline"
vim.opt.wrap = true
-- Wrap long lines at words.
vim.o.linebreak = true
-- when a long line breaks it maintains the visual start position of the original line
vim.opt.breakindent = true
-- dont show the mode in the cmd since it is already there in the custom status line
vim.o.showmode = false
-- dont show the active command, and waiting for the motion like 3yj
vim.opt.showcmd = false
-- cant see it even if enabled, anyways configured in lualine so nvm
vim.opt.ruler = false
vim.opt.showtabline = 0
-- disable the vim cmd line until required, this will overwrite the statusline when cmd is required
vim.opt.cmdheight = 0
vim.opt.laststatus = 3 -- there is only 1 statusline for all windows
-- fill the last lines with empty lines instead of ~
vim.opt.fillchars = {
  eob = "~",
  fold = " ",
  foldclose = arrows.right,
  foldopen = arrows.down,
  foldsep = " ",
  foldinner = " ",
  msgsep = "─",
}
-- rounded floating windows
vim.o.winborder = "rounded"
vim.o.list = false -- handled by plugin mcauley-penney/visual-whitespace.nvim

-- ============================================================================
-- Search
-- ============================================================================
-- searched terms get highlighted
vim.opt.hlsearch = true
-- show the first search result while typing
vim.opt.incsearch = true
vim.opt.ignorecase = true
-- case doesnt matter unless I type a capital letter in the search term
vim.opt.smartcase = true

-- ============================================================================
-- Indentation
-- ============================================================================
-- replace tabs with spaces
vim.opt.expandtab = true
-- one Indentation level is 4 spaces
vim.opt.shiftwidth = 4
vim.opt.tabstop = 4
-- backspace also deletes 4 spaces
vim.opt.softtabstop = 4
vim.opt.smartindent = true
vim.opt.smarttab = true
vim.opt.autoindent = true

-- ============================================================================
-- Splits
-- ============================================================================
-- new splits will appear on the right/bottom for respective vertical/horizontal splits
vim.opt.splitbelow = true
vim.opt.splitright = true

-- ============================================================================
-- Files
-- ============================================================================
vim.opt.fileencoding = "utf-8"
vim.opt.backup = false
vim.opt.writebackup = false
vim.opt.swapfile = false

-- ============================================================================
-- Completion
-- ============================================================================
vim.opt.conceallevel = 0 -- Show all text (don't hide markdown syntax/quotes)
vim.opt.completeopt = { "menu", "menuone", "noselect" } -- Standard autocomplete options

-- ============================================================================
-- Other
-- ============================================================================
vim.opt.title = true -- set the terminal title
-- vim.opt.guifont = "monospace:h17" -- no need as we run in terminal, maybe useful in neovide
-- minimum number of screen lines to keep above and below the cursor, to have a context
vim.opt.scrolloff = 5
vim.opt.virtualedit = "block" -- in v-block mode allow to move cursor anywhere
vim.o.inccommand = "split" -- show a preview of replace commands with :%s/foo/bar/g

-- ============================================================================
-- Filetype Detection
-- ============================================================================
vim.filetype.add({
  extension = {
    env = "dotenv",
    mdx = "mdx",
  },
  filename = {
    [".env"] = "dotenv",
    ["env"] = "dotenv",
  },
  pattern = {
    ["[jt]sconfig.*.json"] = "jsonc",
    ["%.env%.[%w_.-]+"] = "dotenv",
  },
})

-- ============================================================================
-- Treesitter Folds
-- ============================================================================
vim.opt.foldenable = true
vim.opt.foldcolumn = "auto"
vim.opt.foldexpr = "v:lua.vim.treesitter.foldexpr()"
vim.opt.foldlevel = 99 -- Start with all folds open
vim.opt.foldlevelstart = 99
vim.opt.foldmethod = "expr"
vim.wo.foldtext = ""

-- NOTE: Diagnostic signs are configured in plugins/lsp/init.lua via vim.diagnostic.config()

vim.opt.path:append("**")
vim.opt.wildoptions:append("fuzzy")
-- pum box show all suggestions, dont select the first option
vim.o.completeopt = "menuone,noselect,noinsert"
-- Limit the Autocomplete Menu to 10 items
vim.opt.pumheight = 10
vim.o.pumborder = "rounded"
-- (Optional) Make the completion menu look like a modern dropdown popup
vim.opt.wildoptions:append("pum")
-- if nvim finds a local .nvim.lua file in the project directory it will run it on top
vim.o.exrc = true

-- Diff mode settings.
-- Setting the context to a very large number disables folding.
vim.opt.diffopt:append("vertical,context:99")

-- shorten the write and search messages
vim.opt.shortmess:append({
  w = true,
  s = true,
})
-- Show whitespace: disabled in favor of extension mcauley-penney/visual-whitespace.nvim
-- vim.opt.list = true
-- vim.opt.listchars = { space = "⋅", trail = "⋅", tab = "  ↦" }
