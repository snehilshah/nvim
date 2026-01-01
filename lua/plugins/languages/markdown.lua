return {
  {
    "MeanderingProgrammer/render-markdown.nvim",
    ft = { "markdown", "mdx" },
    dependencies = { "nvim-treesitter/nvim-treesitter", "nvim-mini/mini.nvim" },
    opts = {
      file_types = { "markdown", "mdx" },
      html = {
        render_modes = true,
      },
    },
    config = function(_, opts)
      -- Ensure Treesitter uses the markdown parser for mdx buffers.
      -- This keeps render-markdown working even when the buffer filetype is `mdx`.
      pcall(vim.treesitter.language.register, "markdown", "mdx")
      require("render-markdown").setup(opts)
    end,
  },
  {
    "davidmh/mdx.nvim",
    -- This plugin provides MDX filetype + Treesitter highlight queries.
    -- It needs to be on the runtimepath early so .mdx files are detected.
    lazy = false,
    dependencies = { "nvim-treesitter/nvim-treesitter" },
  },
}
