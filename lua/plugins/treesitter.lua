return {
  {
    "nvim-treesitter/nvim-treesitter",
    branch = "main",
    lazy = false,
    build = ":TSUpdate",
    opts = {},
  },
  {
    "nvim-treesitter/nvim-treesitter-textobjects",
    branch = "main",
    dependencies = { "nvim-treesitter/nvim-treesitter" },
    config = function()
      require("nvim-treesitter-textobjects").setup({
        select = {
          -- Automatically jump forward to textobj, similar to targets.vim
          lookahead = true,
          -- You can choose the select mode (default is charwise 'v')
          --
          -- Can also be a function which gets passed a table with the keys
          -- * query_string: eg '@function.inner'
          -- * method: eg 'v' or 'o'
          -- and should return the mode ('v', 'V', or '<c-v>') or a table
          -- mapping query_strings to modes.
          selection_modes = {
            ["@parameter.outer"] = "v", -- charwise
            ["@function.outer"] = "V", -- linewise
            -- ['@class.outer'] = '<c-v>', -- blockwise
          },
          -- If you set this to `true` (default is `false`) then any textobject is
          -- extended to include preceding or succeeding whitespace. Succeeding
          -- whitespace has priority in order to act similarly to eg the built-in
          -- `ap`.
          --
          -- Can also be a function which gets passed a table with the keys
          -- * query_string: eg '@function.inner'
          -- * selection_mode: eg 'v'
          -- and should return true of false
          include_surrounding_whitespace = false,
        },
      })
      -- Selection keymaps (vaf, vif, vac, vic, etc.)
      local select = require("nvim-treesitter-textobjects.select")
      vim.keymap.set({ "x", "o" }, "af", function()
        select.select_textobject("@function.outer", "textobjects")
      end, { desc = "Select around function" })
      vim.keymap.set({ "x", "o" }, "if", function()
        select.select_textobject("@function.inner", "textobjects")
      end, { desc = "Select inside function" })
      vim.keymap.set({ "x", "o" }, "ac", function()
        select.select_textobject("@class.outer", "textobjects")
      end, { desc = "Select around class" })
      vim.keymap.set({ "x", "o" }, "ic", function()
        select.select_textobject("@class.inner", "textobjects")
      end, { desc = "Select inside class" })
      vim.keymap.set({ "x", "o" }, "aa", function()
        select.select_textobject("@parameter.outer", "textobjects")
      end, { desc = "Select around argument/parameter" })
      vim.keymap.set({ "x", "o" }, "ia", function()
        select.select_textobject("@parameter.inner", "textobjects")
      end, { desc = "Select inside argument/parameter" })
      vim.keymap.set({ "x", "o" }, "as", function()
        select.select_textobject("@local.scope", "locals")
      end, { desc = "Select language scope" })

      -- Swap keymaps
      local swap = require("nvim-treesitter-textobjects.swap")
      vim.keymap.set("n", "<leader>a", function()
        swap.swap_next("@parameter.inner")
      end, { desc = "Swap with next parameter" })
      vim.keymap.set("n", "<leader>A", function()
        swap.swap_previous("@parameter.inner")
      end, { desc = "Swap with previous parameter" })

      -- Move keymaps
      local move = require("nvim-treesitter-textobjects.move")
      vim.keymap.set({ "n", "x", "o" }, "]f", function()
        move.goto_next_start("@function.outer", "textobjects")
      end, { desc = "Next function start" })
      vim.keymap.set({ "n", "x", "o" }, "]F", function()
        move.goto_next_end("@function.outer", "textobjects")
      end, { desc = "Next function end" })
      vim.keymap.set({ "n", "x", "o" }, "[f", function()
        move.goto_previous_start("@function.outer", "textobjects")
      end, { desc = "Previous function start" })
      vim.keymap.set({ "n", "x", "o" }, "[F", function()
        move.goto_previous_end("@function.outer", "textobjects")
      end, { desc = "Previous function end" })
      vim.keymap.set({ "n", "x", "o" }, "]c", function()
        move.goto_next_start("@class.outer", "textobjects")
      end, { desc = "Next class start" })
      vim.keymap.set({ "n", "x", "o" }, "]C", function()
        move.goto_next_end("@class.outer", "textobjects")
      end, { desc = "Next class end" })
      vim.keymap.set({ "n", "x", "o" }, "[c", function()
        move.goto_previous_start("@class.outer", "textobjects")
      end, { desc = "Previous class start" })
      vim.keymap.set({ "n", "x", "o" }, "[C", function()
        move.goto_previous_end("@class.outer", "textobjects")
      end, { desc = "Previous class end" })
      vim.keymap.set({ "n", "x", "o" }, "]o", function()
        move.goto_next_start("@loop.outer", "textobjects")
      end, { desc = "Next loop start" })
      vim.keymap.set({ "n", "x", "o" }, "[o", function()
        move.goto_previous_start("@loop.outer", "textobjects")
      end, { desc = "Previous loop start" })
      vim.keymap.set({ "n", "x", "o" }, "]i", function()
        move.goto_next_start("@conditional.outer", "textobjects")
      end, { desc = "Next conditional (if)" })
      vim.keymap.set({ "n", "x", "o" }, "[i", function()
        move.goto_previous_start("@conditional.outer", "textobjects")
      end, { desc = "Previous conditional (if)" })
    end,
  },
  {
    "nvim-treesitter/nvim-treesitter-context",
    branch = "master", -- this plugin uses 'master' branch no port to main branch yet
    dependencies = { "nvim-treesitter/nvim-treesitter" },
    opts = {
      enable = true, -- Enable this plugin (Can be enabled/disabled later via commands)
      multiwindow = false, -- Disable multiwindow support for better performance
      max_lines = 4, -- Show up to 4 lines of context (optimal balance)
      min_window_height = 15, -- Only show context when window is at least 15 lines tall
      line_numbers = true, -- Show line numbers in context (helpful for navigation)
      multiline_threshold = 20, -- Show context for scopes with 20+ lines (more selective)
      trim_scope = "outer", -- Discard outer context lines when max_lines exceeded
      mode = "topline", -- Calculate context from top visible line (better for search)
      -- Visual separator makes context boundary clear
      separator = "─", -- Unicode horizontal line separator
      zindex = 20, -- Keep context above other floating windows
      on_attach = function(buf)
        -- Disable in very large files for performance
        local max_filesize = 200 * 1024 -- 200 KB
        local filename = vim.api.nvim_buf_get_name(buf)
        if filename == "" then
          return true
        end
        local ok, stats = pcall(vim.uv.fs_stat, filename)
        return not (ok and stats and stats.size > max_filesize)
      end,
    },
  },
  {
    "MeanderingProgrammer/treesitter-modules.nvim",
    dependencies = { "nvim-treesitter/nvim-treesitter" },
    opts = {
      ensure_installed = {
        "c",
        "lua",
        "vim",
        "vimdoc",
        "query",
        "markdown",
        "markdown_inline",
        "go",
        "gomod",
        "gosum",
        "jsdoc",
        "javascript",
        "typescript",
        "tsx",
      },
      auto_install = true,

      highlight = {
        enable = true,

        disable = function(lang, buf)
          -- buf may be nil or invalid in some contexts on the main branch
          if not buf or type(buf) ~= "number" then
            return false
          end
          local max_filesize = 100 * 1024 -- 100 KB
          local ok, stats = pcall(vim.uv.fs_stat, vim.api.nvim_buf_get_name(buf))
          if ok and stats and stats.size > max_filesize then
            return true
          end
        end,

        additional_vim_regex_highlighting = false,
      },
      indent = {
        enable = true,
      },
      incremental_selection = {
        enable = true,
        keymaps = {
          init_selection = "<leader>ss",
          node_incremental = "<leader>si",
          scope_incremental = "<leader>sc",
          node_decremental = "<leader>sn", -- Changed from <leader>sd to avoid conflict with Buffer Diagnostics
        },
      },
    },
  },
}
