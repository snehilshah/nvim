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
    opts = {
      -- Core settings
      max_history = 100,  -- Maximum number of items to keep in history
      items_per_page = 9, -- Number of items to show per page
      min_chars = 5,      -- Minimum characters required to store item

      -- Window appearance
      window = {
        relative = "editor",
        width = 70,         -- Width of the floating window
        height = 12,        -- Height of the floating window
        border = "rounded", -- Border style
      },

      -- Internal keymaps for the lazyclip window
      keymaps = {
        close_window = "q",      -- Close the clipboard window
        prev_page = "h",         -- Go to previous page
        next_page = "l",         -- Go to next page
        paste_selected = "<CR>", -- Paste the selected item
        move_up = "k",           -- Move selection up
        move_down = "j",         -- Move selection down
        delete_item = "d",       -- Delete selected item
      },
    },
    event = "VeryLazy",
  },
  -- Highlight and search TODO/FIXME/etc comments
  {
    "folke/todo-comments.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    keys = {
      { "]t", function() require("todo-comments").jump_next() end, desc = "Next todo comment" },
      { "[t", function() require("todo-comments").jump_prev() end, desc = "Previous todo comment" },
    },
    event = "VeryLazy",
    opts = {
      keywords = {
        FIX = {
          icon = " ", -- icon used for the sign, and in search results
          color = "error", -- can be a hex color, or a named color (see below)
          alt = { "FIXME", "BUG", "FIXIT", "ISSUE" }, -- a set of other keywords that all map to this FIX keywords
          -- signs = false, -- configure signs for some keywords individually
        },
        TODO = { icon = " ", color = "info" },
        HACK = { icon = " ", color = "warning" },
        WARN = { icon = " ", color = "warning", alt = { "WARNING", "XXX" } },
        PERF = { icon = " ", alt = { "OPTIM", "PERFORMANCE", "OPTIMIZE" } },
        NOTE = { icon = " ", color = "hint", alt = { "INFO" } },
        TEST = { icon = "⏲ ", color = "test", alt = { "TESTING", "PASSED", "FAILED" } },
      },
    },
  },
}
