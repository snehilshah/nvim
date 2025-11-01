return {
	cmd = { "biome", "lsp-proxy" },
	filetypes = {
		-- Enable for JS/TS to get diagnostics
		"javascript",
		"javascriptreact",
		"typescript",
		"typescriptreact",
		"json",
		"jsonc",
		"astro",
		"svelte",
		"vue",
		"css",
	},
	root_markers = {
		"biome.json",
		"biome.jsonc",
		".biomejs.json",
		".biomejs.jsonc",
		"package.json",
		".git",
	},
	single_file_support = false,
	settings = {},
	on_attach = function(client, bufnr)
		-- Enable diagnostics and code actions from Biome
		-- Disable formatting if you want conform.nvim to handle it exclusively
		-- client.server_capabilities.documentFormattingProvider = false
		-- client.server_capabilities.documentRangeFormattingProvider = false
	end,
}
