return {
  "EvWilson/spelunk.nvim",
  dependencies = {
    "nvim-treesitter/nvim-treesitter", -- For showing grammar context
    "folke/snacks.nvim", -- For fuzzy search integration
    "nvim-lualine/lualine.nvim",
  },
  event = "VeryLazy",
  opts = {
    enable_persist = true,
    -- Persist bookmarks per git branch (useful for feature branch workflows)
    persist_by_git_branch = true,
    -- Show bookmark index in sign column
    enable_status_col_display = true,
    -- Use snacks.nvim for fuzzy searching (integrates with your existing setup)
    fuzzy_search_provider = "snacks",
    -- UI orientation
    orientation = "vertical",

    -- Cursor indicator in UI (must be single ASCII character)
    cursor_character = ">",

    -- Statusline prefix (for lualine integration if needed)
    statusline_prefix = "📌",

    -- Keymaps using <leader>m prefix (m for marks/bookmarks)
    -- Avoids conflicts with existing mappings
    base_mappings = {
      -- Toggle the bookmark UI panel
      toggle = "<leader>mt",
      -- Add bookmark at current cursor position
      add = "<leader>ma",
      -- Delete bookmark on current line
      delete = "<leader>md",
      -- Navigate to next bookmark in stack
      next_bookmark = "<leader>mn",
      -- Navigate to previous bookmark in stack
      prev_bookmark = "<leader>mp",
      -- Fuzzy search all bookmarks across all stacks
      search_bookmarks = "<leader>mf",
      -- Fuzzy search bookmarks in current stack only
      search_current_bookmarks = "<leader>mc",
      -- Fuzzy search all stacks
      search_stacks = "<leader>ms",
      -- Change line of bookmark under cursor
      change_line = "<leader>ml",
    },

    -- Window-specific keymaps (when UI panel is open)
    window_mappings = {
      -- Navigation
      cursor_down = "j",
      cursor_up = "k",
      -- Reorder bookmarks in stack
      bookmark_down = "<C-j>",
      bookmark_up = "<C-k>",
      -- Jump to bookmark
      goto_bookmark = "<CR>",
      goto_bookmark_hsplit = "s",
      goto_bookmark_vsplit = "v",
      -- Edit bookmark
      change_line = "l",
      delete_bookmark = "d",
      -- Stack management
      next_stack = "<Tab>",
      previous_stack = "<S-Tab>",
      new_stack = "n",
      delete_stack = "D",
      edit_stack = "E",
      -- UI controls
      close = "q",
      help = "?",
    },
  },
  config = function(_, opts)
    require("spelunk").setup(opts)
    -- Additional keymaps for quick bookmark jumps (1-5)
    local spelunk = require("spelunk")
    for i = 1, 5 do
      vim.keymap.set("n", "<leader>m" .. i, function()
        spelunk.goto_bookmark(i)
      end, { desc = "Jump to bookmark " .. i })
    end
  end,
}
