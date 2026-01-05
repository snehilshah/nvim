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
    opts = {},
  },
  {
    "nvim-treesitter/nvim-treesitter-context",
    -- branch = "main",
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
        local ok, stats = pcall(vim.loop.fs_stat, filename)
        return not (ok and stats and stats.size > max_filesize)
      end,
    },
  },
  {
    "MeanderingProgrammer/treesitter-modules.nvim",
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
          local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
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
          node_decremental = "<leader>sd",
        },
      },
      textobjects = {
        select = {
          enable = true,
          lookahead = true,
          keymaps = {
            ["af"] = "@function.outer",
            ["if"] = "@function.inner",
            ["ac"] = "@class.outer",
            ["ic"] = { query = "@class.inner", desc = "Select inner part of a class region" },
            ["as"] = {
              query = "@local.scope",
              query_group = "locals",
              desc = "Select language scope",
            },
          },
          selection_modes = {
            ["@parameter.outer"] = "v",
            ["@function.outer"] = "v",
            ["@class.outer"] = "<c-v>",
          },
          include_surrounding_whitespace = true,
        },
        swap = {
          enable = true,
          swap_next = {
            ["<leader>a"] = "@parameter.inner",
          },
          swap_previous = {
            ["<leader>A"] = "@parameter.inner",
          },
        },
        move = {
          enable = true,
          set_jumps = true, -- whether to set jumps in the jumplist
          goto_next_start = {
            ["]m"] = "@function.outer",
            ["]c"] = { query = "@class.outer", desc = "Next class start" },
            --
            -- You can use regex matching (i.e. lua pattern) and/or pass a list in a "query" key to group multiple queries.
            ["]o"] = "@loop.*",
            -- ["]o"] = { query = { "@loop.inner", "@loop.outer" } }
            --
            -- You can pass a query group to use query from `queries/<lang>/<query_group>.scm file in your runtime path.
            -- Below example nvim-treesitter's `locals.scm` and `folds.scm`. They also provide highlights.scm and indent.scm.
            ["]s"] = { query = "@local.scope", query_group = "locals", desc = "Next scope" },
            ["]z"] = { query = "@fold", query_group = "folds", desc = "Next fold" },
          },
          goto_next_end = {
            ["]M"] = "@function.outer",
            ["]C"] = "@class.outer",
          },
          goto_previous_start = {
            ["[m"] = "@function.outer",
            ["[c"] = "@class.outer",
          },
          goto_previous_end = {
            ["[M"] = "@function.outer",
            ["[C"] = "@class.outer",
          },
          -- Below will go to either the start or the end, whichever is closer.
          -- Use if you want more granular movements
          -- Make it even more gradual by adding multiple queries and regex.
          goto_next = {
            ["]d"] = "@conditional.outer",
          },
          goto_previous = {
            ["[d"] = "@conditional.outer",
          },
        },
      },
    },
  },
}
