-- Set leader keys before loading lazy.nvim
vim.g.mapleader = " "
vim.g.maplocalleader = " "

require("config.options")
require("core.lazy")
require("config.keymaps")

vim.g.have_nerd_font = true
