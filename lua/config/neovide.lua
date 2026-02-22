-- ============================================================================
-- Neovide Settings (only applied when running in Neovide)
-- https://neovide.dev/configuration.html
-- ============================================================================
if not vim.g.neovide then
  return
end

-- Font size (adjust the number after 'h' to change size)
vim.opt.guifont = "Maple Mono NF:h11"

-- Hide window decorations (title bar, borders)
vim.g.neovide_window_decorations = false

-- Start in fullscreen mode
vim.g.neovide_fullscreen = true

-- Allow clipboard paste with Ctrl+Shift+V (Neovide doesn't have a terminal to handle this)
vim.keymap.set({ "n", "v", "s", "x", "o", "i", "l", "c", "t" }, "<C-S-v>", function()
  vim.api.nvim_paste(vim.fn.getreg("+"), true, -1)
end, { desc = "Paste from system clipboard" })
