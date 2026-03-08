return {
  {
    "snehilshah/cosmic-gleam.nvim",
    dir = vim.fn.expand("~/myCodes/cosmic-gleam.nvim"),
    enabled = true,
    priority = 1000,
    config = function()
      vim.cmd.colorscheme("cosmic_gleam")
    end,
  },
  {
    "sainnhe/gruvbox-material",
    enabled = true,
    lazy = true,
  },
  {
    "sainnhe/everforest",
    lazy = true,
    enabled = true,
    config = function()
      vim.o.background = "dark"
      vim.g.everforest_background = "hard"
      vim.g.everforest_enable_italic = true
      vim.g.everforest_better_performance = 1
      vim.cmd.colorscheme("everforest")
    end,
  },
}
