-- Buf Language Server
-- Uses the Buf CLI's built-in LSP for workspace-aware protobuf support.
return {
    root_markers = { "buf.yaml", "buf.work.yaml", ".git" },
    on_attach = function(client)
        -- Conform handles formatting via `buf format`.
        client.server_capabilities.documentFormattingProvider = false
        client.server_capabilities.documentRangeFormattingProvider = false
    end,
}
