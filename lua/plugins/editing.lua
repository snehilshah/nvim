-- ============================================================================
-- Editing Helpers
-- ============================================================================
-- Autopairs, auto-tags, comments, indentation detection, and motions

return {
  -- Autopairs with full language support (Go/Rust/C/JS/TS/React)
  {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
      "saghen/blink.cmp",
    },
    config = function()
      local npairs = require("nvim-autopairs")
      local Rule = require("nvim-autopairs.rule")
      local cond = require("nvim-autopairs.conds")

      npairs.setup({
        check_ts = true, -- Use treesitter for smarter pairing
        ts_config = {
          lua = { "string", "source" }, -- Don't add pairs in lua string/source nodes
          javascript = { "template_string" },
          typescript = { "template_string" },
          javascriptreact = { "template_string", "jsx_attribute" },
          typescriptreact = { "template_string", "jsx_attribute" },
        },
        disable_filetype = { "TelescopePrompt", "vim", "lazy", "mason" },
        enable_check_bracket_line = true, -- Don't add pair if close bracket is in same line
        enable_bracket_in_quote = true,
        enable_abbr = false,
        break_undo = true, -- Make autopairs break undo sequence
        map_cr = true, -- Map <CR> for pair completion (handles JSX Enter!)
        map_bs = true, -- Map <BS> for pair deletion
        map_c_h = false,
        map_c_w = false,
      })

      -- JSX/HTML: Add space padding for braces in JSX expressions
      local brackets = { { "(", ")" }, { "[", "]" }, { "{", "}" } }
      npairs.add_rules({
        -- Add spaces between brackets: ( | ) -> (  |  )
        Rule(" ", " ")
          :with_pair(function(opts)
            local pair = opts.line:sub(opts.col - 1, opts.col)
            return vim.tbl_contains({
              brackets[1][1] .. brackets[1][2],
              brackets[2][1] .. brackets[2][2],
              brackets[3][1] .. brackets[3][2],
            }, pair)
          end)
          :with_move(cond.none())
          :with_cr(cond.none())
          :with_del(function(opts)
            local col = vim.api.nvim_win_get_cursor(0)[2]
            local context = opts.line:sub(col - 1, col + 2)
            return vim.tbl_contains({
              brackets[1][1] .. "  " .. brackets[1][2],
              brackets[2][1] .. "  " .. brackets[2][2],
              brackets[3][1] .. "  " .. brackets[3][2],
            }, context)
          end),
      })

      -- Rust: Add rules for lifetime annotations and turbofish
      npairs.add_rule(Rule("<", ">", { "rust" }):with_pair(cond.before_regex("%a+:?:?$", 3)))

      -- Go: Handle struct literals better
      npairs.add_rule(Rule("{", "}", { "go" }):with_pair(cond.not_after_regex("%s")))

      -- Integration with blink.cmp
      local blink_ok, blink = pcall(require, "blink.cmp")
      if blink_ok then
        -- blink.cmp doesn't need explicit autopairs integration
        -- autopairs' map_cr handles <CR> behavior automatically
      end
    end,
  },
  -- Autotags for HTML/JSX
  {
    "windwp/nvim-ts-autotag",
    event = { "BufReadPost", "BufNewFile" },
    opts = {
      opts = {
        enable_close = true, -- Auto close tags
        enable_rename = true, -- Auto rename pairs
        enable_close_on_slash = true, -- Auto close on trailing </
      },
    },
  },
  -- Comments (with JSX/TSX context-aware support)
  {
    "numToStr/Comment.nvim",
    lazy = false,
    dependencies = { "JoosepAlviste/nvim-ts-context-commentstring" },
    config = function()
      require("Comment").setup({
        pre_hook = require("ts_context_commentstring.integrations.comment_nvim").create_pre_hook(),
      })
    end,
  },
  {
    "JoosepAlviste/nvim-ts-context-commentstring",
    lazy = true,
    opts = {
      enable_autocmd = false, -- Handled by Comment.nvim pre_hook
    },
  },
  -- Automatically detects and sets the appropriate 'shiftwidth' and 'expandtab' options
  { "tpope/vim-sleuth" },
  -- Provides motions for navigating and operating on CamelCase and snake_case words
  {
    "bkad/CamelCaseMotion",
    init = function()
      vim.g.camelcasemotion_key = "<leader>"
    end,
  },
}
