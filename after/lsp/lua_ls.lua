return {
  settings = {
    Lua = {
      diagnostics = {
        globals = { "vim" },
        disable = { "inject-field", "undefined-field", "missing-fields" },
      },
      runtime = { version = "LuaJIT" },
      workspace = {
        library = { vim.env.VIMRUNTIME },
        checkThirdParty = false,
      },
      telemetry = { enable = false },
    },
  },
}
