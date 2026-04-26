-- Set leader keys before loading lazy.nvim
vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.g.have_nerd_font = true

-- disable netrw
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
vim.g.auto_format = true

vim.cmd.colorscheme("miss-dracula")

require("config.options")
require("config.keymaps")
require("statusline")
require("autocmds")
require("commands")
require("filetype")
require("utils")
require("lazyplug")

if vim.g.neovide then
    require("config.neovide")
end

if vim.fn.has("wsl") == 1 then
    require("config.win")
end
