-- Formatter Configuration (conform.nvim)
-- All formatters should be installed globally.
-- See docs/install.md for installation instructions.
return {
  "stevearc/conform.nvim",
  event = "BufWritePre",
  opts = {
    -- Leave me alone.
    notify_no_formatters = false,
    notify_on_error = false,
    formatters_by_ft = {
      c = { name = 'clangd', timeout_ms = 500, lsp_format = 'prefer' },
      cpp = { name = 'clangd', timeout_ms = 500, lsp_format = 'prefer' },

      javascript = { 'prettier', name = 'biome-check', timeout_ms = 500, lsp_format = 'fallback' },
      javascriptreact = { 'prettier', name = 'biome-check', timeout_ms = 500, lsp_format = 'fallback' },
      typescript = { 'prettier', name = 'biome-check', timeout_ms = 500, lsp_format = 'fallback' },
      typescriptreact = { 'prettier', name = 'biome-check', timeout_ms = 500, lsp_format = 'fallback' },
      astro = { 'prettier', name = 'biome-check', timeout_ms = 500, lsp_format = 'fallback' },

      json = { 'prettier', name = 'biome-check', timeout_ms = 500, lsp_format = 'fallback' },
      jsonc = { 'prettier', name = 'biome-check', timeout_ms = 500, lsp_format = 'fallback' },

      html = { 'prettier', name = 'biome-check', timeout_ms = 500, lsp_format = 'fallback' },
      css = { 'prettier', name = 'biome-check', timeout_ms = 500, lsp_format = 'fallback' },
      scss = { 'prettier', name = 'biome-check', timeout_ms = 500, lsp_format = 'fallback' },

      yaml = { "yamlfmt", stop_after_first = true },
      yml = { "yamlfmt", stop_after_first = true },
      toml = { "tombi", stop_after_first = true },

      go = { "goimports", "gofumpt" },
      proto = { "buf" },

      sh = { "shfmt" },
      bash = { "shfmt" },
      zsh = { "shfmt" },

      lua = { "stylua" },
      dockerfile = { "dockerfmt" },
      markdown = { "markdownlint-cli2", stop_after_first = true },
      -- python = { "isort", "black" },
    },
    format_on_save = function()
      if not vim.g.autoformat then
        return nil
      end
    end
  },
  init = function()
    vim.g.autoformat = true
    vim.o.formatexpr = "v:lua.require'conform'.formatexpr()"
  end,
}
