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
