return {
	cmd = { "biome", "lsp-proxy" },
	filetypes = {
		"javascript",
		"javascriptreact",
		"json",
		"jsonc",
		"typescript",
		"typescriptreact",
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
	init_options = {
		-- Enable import sorting and formatting capabilities
		capabilities = {
			textDocument = {
				codeAction = {
					dynamicRegistration = false,
					codeActionLiteralSupport = {
						codeActionKind = {
							valueSet = {
								"quickfix",
								"refactor",
								"refactor.extract",
								"refactor.inline",
								"refactor.rewrite",
								"source",
								"source.organizeImports",
								"source.fixAll",
							},
						},
					},
				},
			},
		},
	},
}
