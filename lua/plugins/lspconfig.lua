return {
  {
    "neovim/nvim-lspconfig",
    lazy = false,
    config = function()
      require("lsp")
    end,
  },
  {
    "folke/lazydev.nvim",
    ft = "lua",
    opts = {
      library = {
        { path = "nvim-lspconfig",     words = { "lspconfig" } },
        { path = "${3rd}/luv/library", words = { "vim%.uv" } },
      },
    },
  },
}
