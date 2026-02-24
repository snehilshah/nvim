return {
  {
    "sainnhe/gruvbox-material",
    enabled = true,
    lazy = false,
    priority = 1000,
    init = function()
      vim.cmd.colorscheme("gruvbox-material")
      vim.g.colors_name = "gruvbox-material"
    end,
  },

  {
    "https://gitlab.com/motaz-shokry/gruvbox.nvim",
    name = "gruvbox",
    priority = 1000,
    enabled = false,
    config = function()
      vim.cmd("colorscheme gruvbox")
    end,
    opts = {
      dark_variant = "hard",
      dim_inactive_windows = true,

      styles = {
        transparency = true,
      },
    },
  },
  {
    "comfysage/gruvboxed",
    priority = 1000,
    enabled = false,
    opts = {
      transparent_background = false,
      contrast_dark = "medium",
      override_terminal = true,
      style = {
        tabline = { reverse = true, color = "green" },
        search = { reverse = false, inc_reverse = true },
        types = { italic = true },
        keyword = { italic = true },
        comment = { italic = false },
      },
      overrides = {},
    },

    init = function()
      vim.cmd.colorscheme("gruvboxed")
      vim.g.colors_name = "gruvboxed"
    end,
  },

  -- Local theme development
  -- {
  --   "cosmic-gleam.nvim",
  --   dev = true,
  --   enabled = false,
  --   priority = 1000,
  --   enabled = true,
  --   config = function()
  --     vim.cmd.colorscheme("cosmic_gleam")
  --   end,
  -- },
  {
    "rktjmp/lush.nvim",
  },
}
