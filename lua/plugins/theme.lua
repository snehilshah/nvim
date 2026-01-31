return {
  {
    "sainnhe/gruvbox-material",
    enabled = true,
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

  -- Lush: colorscheme creation helper
  {
    "rktjmp/lush.nvim",
    -- if you wish to use your own colorscheme:
    -- { dir = '/absolute/path/to/colorscheme', lazy = true },
  },
}
