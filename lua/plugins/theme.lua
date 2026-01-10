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
    "oskarnurm/koda.nvim",
    lazy = false, -- make sure we load this during startup if it is your main colorscheme
    enabled = false,
    priority = 1000, -- make sure to load this before all the other start plugins
    config = function()
      -- require("koda").setup({ transparent = true })
      vim.cmd("colorscheme koda")
    end,
  },
}
