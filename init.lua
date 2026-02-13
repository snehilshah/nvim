-- Set leader keys before loading lazy.nvim
vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.g.have_nerd_font = true
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

require("config.options")
require("config.neovide")
require("core.lazy")
require("core.autocmds")
require("core.utils")
require("config.keymaps")
-- require('utils.cmdline')

if vim.fn.has("wsl") == 1 then
  require("config.win")
end
