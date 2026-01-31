-- ============================================================================
-- UI Enhancements
-- ============================================================================
-- Visual helpers: keymaps popup, color highlighting, line numbers, etc.

return {
  -- Displays a popup with possible keybindings of the command you started typing
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
  -- Color highlighter for color codes (including Tailwind)
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
  -- Comfy line numbers
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
  -- Visual whitespace display in visual mode
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
        tab = " ",
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
  -- Better folding with LSP/treesitter support
  {
    "kevinhwang91/nvim-ufo",
    dependencies = { "kevinhwang91/promise-async" },
    event = "BufReadPost", -- Load immediately when opening a file
    config = true, -- Runs require('ufo').setup() with default settings
  },
}
