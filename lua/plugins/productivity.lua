-- ============================================================================
-- Productivity Tools
-- ============================================================================
-- Habits, timers, clipboard management, and TODO tracking

return {
  -- Encourages best practices and breaks bad habits
  {
    "m4xshen/hardtime.nvim",
    lazy = false,
    dependencies = { "MunifTanjim/nui.nvim" },
    opts = {
      max_count = 20,
      disable_mouse = false,
      restriction_mode = "hint",
      disabled_keys = {
        ["<Up>"] = { "", "i" },
        ["<Down>"] = { "", "i" },
        -- left and right are left enabled for navigating buffers see keymaps.lua
        -- anyways this keymap will not do what you are expecting to block here
        ["<Left>"] = {},
        ["<Right>"] = {},
      },
    },
  },
  -- Simple timer plugin for Neovim
  {
    "nvzone/timerly",
    lazy = true,
    cmd = "TimerlyToggle",
    dependencies = "nvzone/volt",
    opts = {},
  },
  -- Clipboard manager
  {
    "atiladefreitas/lazyclip",
    opts = {},
    keys = {
      { "Cw", desc = "Open Clipboard Manager" },
    },
    event = "VeryLazy",
  },
  -- Highlight and search TODO/FIXME/etc comments
  {
    "folke/todo-comments.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    opts = {},
  },
}
