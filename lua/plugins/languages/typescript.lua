return {
  {
    "dmmulroy/ts-error-translator.nvim",
    enabled = true,
    opts = {
      auto_attach = true,
      servers = {
        -- "tsgo",  -- Uncomment if switching to tsgo
        "ts_ls",
      },
    },
  },
  -- ARCHIVED: pretty-ts-errors.nvim
  -- Good plugin but requires additional CLI tool and does not integrate
  -- with nvim diagnostics. Also not compatible with ts-error-translator.nvim.
  -- Keeping for reference in case ts-error-translator doesn't fit needs.
  -- {
  --   "youyoumu/pretty-ts-errors.nvim",
  --   opts = {},
  -- },
}
