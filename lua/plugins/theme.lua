return {
  {
    -- "snehilshah/cosmic-gleam.nvim",
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
  {
    "webhooked/kanso.nvim",
    lazy = false,
    priority = 1000,
  },
  {
    "everviolet/nvim",
    enabled = false,
    name = "evergarden",
    priority = 1000, -- Colorscheme plugin is loaded first before any other plugins
    init = function()
      vim.cmd.colorscheme("evergarden")
    end,
    opts = {
      theme = {
        variant = "winter", -- 'winter'|'fall'|'spring'|'summer'
        accent = "green",
      },
      editor = {
        transparent_background = false,
        sign = { color = "none" },
        float = {
          color = "mantle",
          solid_border = false,
        },
        completion = {
          color = "surface0",
        },
      },
    },
  },
}
