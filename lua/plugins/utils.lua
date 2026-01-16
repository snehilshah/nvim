return {
  --  automatically inserts matching pairs of characters when you type the opening one.
  {
    "saghen/blink.pairs",
    version = "*", -- (recommended) only required with prebuilt binaries
    dependencies = "saghen/blink.download",
    init = function()
      pcall(function()
        vim._extui.enable({})
      end)
    end,
    opts = {
      mappings = {
        enabled = true,
        cmdline = true,
        disabled_filetypes = {
          "TelescopePrompt",
          "lazy",
          "mason",
          "help",
          "qf",
          "notify",
        },
        pairs = {},
      },
      highlights = {
        enabled = true,
        -- requires require('vim._extui').enable({}), otherwise has no effect
        cmdline = true,
        groups = {
          "BlinkPairsOrange",
          "BlinkPairsPurple",
          "BlinkPairsBlue",
        },
        unmatched_group = "BlinkPairsUnmatched",

        -- highlights matching pairs under the cursor
        matchparen = {
          enabled = true,
          -- known issue where typing won't update matchparen highlight, disabled by default
          cmdline = false,
          -- also include pairs not on top of the cursor, but surrounding the cursor
          include_surrounding = true,
          group = "BlinkPairsMatchParen",
          priority = 250,
        },
      },
      debug = false,
    },
  },
  -- displays a popup with possible keybindings of the command you started typing.
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    opts = {
      -- your configuration comes here
      -- or leave it empty to use the default settings
      -- refer to the configuration section below
    },
    keys = {
      {
        "<leader>?",
        function()
          require("which-key").show({ global = false })
        end,
        desc = "Buffer Local Keymaps (which-key)",
      },
    },
  },
  -- automatically detects and sets the appropriate 'shiftwidth' and 'expandtab' options
  { "tpope/vim-sleuth" },
  -- provides motions for navigating and operating on CamelCase and snake_case words
  {
    "bkad/CamelCaseMotion",
    init = function()
      vim.g.camelcasemotion_key = "<leader>"
    end,
  },
  -- clipboard manager
  {
    "AckslD/nvim-neoclip.lua",
    event = "VeryLazy",
    dependencies = {
      { "kkharji/sqlite.lua", module = "sqlite" },
      { "ibhagwan/fzf-lua" },
    },
    config = function()
      require("neoclip").setup({
        enable_persistent_history = true,
        db_path = vim.fn.stdpath("data") .. "/databases/neoclip.sqlite3",
      })
    end,
    keys = {
      {
        "<leader>y",
        "<cmd>lua require('neoclip.fzf')()<cr>",
        desc = "Open Neoclip (Clipboard History)",
      },
    },
  },
  -- color highlighter for color codes (including Tailwind)
  {
    "norcalli/nvim-colorizer.lua",
    event = "VeryLazy",
    config = function()
      require("colorizer").setup({
        "*",
        css = { css = true },
        scss = { css = true },
        html = { css = true },
        javascript = { css = true },
        javascriptreact = { css = true },
        typescript = { css = true },
        typescriptreact = { css = true },
      }, {
        RGB = true, -- #RGB hex codes
        RRGGBB = true, -- #RRGGBB hex codes
        names = false, -- "Name" codes like Blue
        RRGGBBAA = true, -- #RRGGBBAA hex codes
        rgb_fn = true, -- CSS rgb() and rgba() functions
        hsl_fn = true, -- CSS hsl() and hsla() functions
        css = true, -- Enable all CSS features: rgb_fn, hsl_fn, names, RGB, RRGGBB
        css_fn = true, -- Enable all CSS *functions*: rgb_fn, hsl_fn
        mode = "background", -- "foreground", "background", "virtualtext"
      })
    end,
  },
  -- encourages best practices
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
  -- just comfy line numbers
  {
    "snehilshah/comfy-line-numbers.nvim",
    opts = {
      up_key = "k",
      down_key = "j",

      hidden_file_types = { "undotree" },
      hidden_buffer_types = { "terminal", "nofile" },
      hide_in_insert_mode = true,
    },
  },
  -- a simple timer plugin for Neovim
  {
    "nvzone/timerly",
    lazy = true,
    cmd = "TimerlyToggle",
    dependencies = "nvzone/volt",
    opts = {},
  },
  {
    "kevinhwang91/nvim-ufo",
    dependencies = { "kevinhwang91/promise-async" },
    event = "BufReadPost", -- Load immediately when opening a file
    config = true, -- Runs require('ufo').setup() with default settings
  },
  -- ════════════════════════════════════════════════════════════════════════════
  -- Comments (with JSX/TSX context-aware support)
  -- ════════════════════════════════════════════════════════════════════════════
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

  {
    "MagicDuck/grug-far.nvim",
    opts = {
      -- engines, default is "ripgrep", but "astgrep" can be specified
      engine = "ripgrep",
      -- whether to start in insert mode
      startInInsertMode = true,
      -- debounce time for search (in ms)
      debounceMs = 500,
      -- minimum number of characters to start search
      minSearchChars = 2,
      -- max number of parallel replacements tasks
      maxWorkers = 4,
      -- specifies the command to run for the rg search
      rgOptions = { "--smart-case", "--hidden", "--glob=!.git/" },
      -- folding related options
      folding = {
        enabled = true,
        foldcolumn = "1",
      },
      -- history settings
      history = {
        autoSave = { enabled = true },
      },
      -- result location settings (with context)
      resultLocation = {
        showNumberLabel = true,
        numberLabelFormat = " [%d] ",
      },
    },
    cmd = "GrugFar",
    keys = {
      {
        "<leader>sS",
        function()
          require("grug-far").open()
        end,
        mode = { "n", "v" },
        desc = "Search & Replace",
      },
      {
        "<leader>sW",
        function()
          require("grug-far").open({ prefills = { search = vim.fn.expand("<cword>") } })
        end,
        desc = "Replace Word Under Cursor",
      },
      {
        "<leader>sF",
        function()
          require("grug-far").open({ prefills = { paths = vim.fn.expand("%") } })
        end,
        desc = "Replace in Current File",
      },
      {
        "<leader>sv",
        function()
          require("grug-far").with_visual_selection()
        end,
        mode = "v",
        desc = "Replace Visual Selection",
      },
    },
  },
  {
    "mcauley-penney/visual-whitespace.nvim",
    init = function()
      vim.keymap.set({ "n", "v" }, "<leader>tw", require("visual-whitespace").toggle, {})
      vim.api.nvim_set_hl(0, "VisualNonText", { fg = "#5D5F71", bg = "#24282d" })
    end,
    event = "ModeChanged *:[vV\22]", -- optionally, lazy load on entering visual mode
    opts = {
      list_chars = {
        space = "·",
        tab = " ",
        nbsp = "󱁐 ",
        lead = "‹",
        trail = "›",
      },
      fileformat_chars = {
        unix = " 󰌑 ",
        mac = " 󰌑 ",
        dos = " 󰌑 ",
      },
    },
  },
  -- ════════════════════════════════════════════════════════════════════════════
  -- Autotags for HTML/JSX
  -- ════════════════════════════════════════════════════════════════════════════
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
  {
    "rktjmp/lush.nvim",
    -- if you wish to use your own colorscheme:
    -- { dir = '/absolute/path/to/colorscheme', lazy = true },
  },
}
