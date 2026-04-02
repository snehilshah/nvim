-- Set leader keys before loading lazy.nvim
vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.g.have_nerd_font = true
-- disable netrw
-- vim.g.loaded_netrw = 1
-- vim.g.loaded_netrwPlugin = 1

require("config.options")
require("core.lazy")
require("utils.autocmds")
require("core.utils")
require("config.keymaps")
-- require("utils.cmdline")
require("utils.commands")

if vim.g.neovide then
  require("config.neovide")
end

if vim.fn.has("wsl") == 1 then
  require("config.win")
end

vim.cmd.packadd("nvim.undotree")
