-- ============================================================================
-- EXPERIMENTAL: Dynamic Command Line Height
-- ============================================================================
-- This module dynamically adjusts cmdheight to show cmdline with statusbar.
-- Currently disabled in init.lua - enable with: require('utils.cmdline')
-- May conflict with noice.nvim or other cmdline UI plugins.
-- ============================================================================

-- dynamically change the height of the command line so that we can see the cmdline with the status bar
local cmdGrp = vim.api.nvim_create_augroup("cmdline_height", { clear = true })
local function set_cmdheight(val)
  if vim.opt.cmdheight:get() ~= val then
    vim.opt.cmdheight = val
    vim.cmd.redrawstatus()
  end
end

vim.api.nvim_create_autocmd("CmdlineEnter", {
  group = cmdGrp,
  callback = function()
    set_cmdheight(1)
  end,
})

vim.api.nvim_create_autocmd("CmdlineLeave", {
  group = cmdGrp,
  callback = function()
    set_cmdheight(0)
  end,
})
