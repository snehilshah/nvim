return {
  on_attach = function(client)
    -- Disable formatting from biome LSP since conform.nvim handles it via biome-check
    client.server_capabilities.documentFormattingProvider = false
    client.server_capabilities.documentRangeFormattingProvider = false
  end,
}
