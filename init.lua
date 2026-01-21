-- Set leader keys before loading lazy.nvim
vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

require("config.options")
require("core.lazy")
require("core.lsp")
require("core.autocmds")
require("core.utils")
require("config.keymaps")
-- require('utils.cmdline')

vim.g.have_nerd_font = true
