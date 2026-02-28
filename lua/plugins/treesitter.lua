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
          lookahead = true,
          selection_modes = {
            ["@parameter.outer"] = "v",
            ["@function.outer"] = "V",
          },
          include_surrounding_whitespace = false,
        },
      })

      local select = require("nvim-treesitter-textobjects.select")
      local swap = require("nvim-treesitter-textobjects.swap")
      local move = require("nvim-treesitter-textobjects.move")

      local map = vim.keymap.set

      local function textobj(key, query, group, desc)
        map({ "x", "o" }, key, function()
          select.select_textobject(query, group)
        end, { desc = desc })
      end

      local function jump(key, fn, query, desc)
        map({ "n", "x", "o" }, key, function()
          fn(query, "textobjects")
        end, { desc = desc })
      end

      -- ── Text Objects ────────────────────────────────────────────────────
      -- stylua: ignore start
      textobj("af", "@function.outer",    "textobjects", "Around function")
      textobj("if", "@function.inner",    "textobjects", "Inside function")
      textobj("ac", "@class.outer",       "textobjects", "Around class")
      textobj("ic", "@class.inner",       "textobjects", "Inside class")
      textobj("aa", "@parameter.outer",   "textobjects", "Around argument")
      textobj("ia", "@parameter.inner",   "textobjects", "Inside argument")
      textobj("ao", "@loop.outer",        "textobjects", "Around loop")
      textobj("io", "@loop.inner",        "textobjects", "Inside loop")
      textobj("ai", "@conditional.outer", "textobjects", "Around conditional")
      textobj("ii", "@conditional.inner", "textobjects", "Inside conditional")
      textobj("ar", "@return.outer",      "textobjects", "Around return")
      textobj("ir", "@return.inner",      "textobjects", "Inside return")
      textobj("as", "@local.scope",       "locals",      "Around scope")
      -- stylua: ignore end

      -- ── Swap ────────────────────────────────────────────────────────────
      map("n", "<leader>a", function()
        swap.swap_next("@parameter.inner")
      end, { desc = "Swap next parameter" })
      map("n", "<leader>A", function()
        swap.swap_previous("@parameter.inner")
      end, { desc = "Swap prev parameter" })

      -- ── Movement ────────────────────────────────────────────────────────
      -- stylua: ignore start
      jump("]f", move.goto_next_start,     "@function.outer",    "Next function start")
      jump("]F", move.goto_next_end,       "@function.outer",    "Next function end")
      jump("[f", move.goto_previous_start, "@function.outer",    "Prev function start")
      jump("[F", move.goto_previous_end,   "@function.outer",    "Prev function end")
      jump("]c", move.goto_next_start,     "@class.outer",       "Next class start")
      jump("]C", move.goto_next_end,       "@class.outer",       "Next class end")
      jump("[c", move.goto_previous_start, "@class.outer",       "Prev class start")
      jump("[C", move.goto_previous_end,   "@class.outer",       "Prev class end")
      jump("]o", move.goto_next_start,     "@loop.outer",        "Next loop")
      jump("[o", move.goto_previous_start, "@loop.outer",        "Prev loop")
      jump("]i", move.goto_next_start,     "@conditional.outer", "Next conditional")
      jump("[i", move.goto_previous_start, "@conditional.outer", "Prev conditional")
      -- stylua: ignore end
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
        "angular",
        "html",
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
