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
  -- {
  -- good plugin but requires additional cli and does not integrate with nvim diagnostics
  -- also not compatible with ts-error-translator.nvim
  --   "youyoumu/pretty-ts-errors.nvim",
  --   opts = {},
  -- },
}
