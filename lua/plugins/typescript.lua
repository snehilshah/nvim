return {
	{
		"pmizio/typescript-tools.nvim",
		dependencies = { "nvim-lua/plenary.nvim" },
		ft = { "javascript", "javascriptreact", "typescript", "typescriptreact" },
		-- keys = {
		-- 	{
		-- 		"<leader>gd",
		-- 		"<cmd>TSToolsGoToSourceDefinition<cr>",
		-- 		desc = "Go to source definition",
		-- 		ft = { "javascript", "javascriptreact", "typescript", "typescriptreact" },
		-- 	},
		-- },
		opts = {
			settings = {
				-- spawn additional tsserver instance to calculate diagnostics on it
				separate_diagnostic_server = true,
				-- "change"|"insert_leave" determine when the client asks the server about diagnostic
				publish_diagnostic_on = "insert_leave",
				-- array of strings("fix_all"|"add_missing_imports"|"remove_unused"|
				-- "remove_unused_imports"|"organize_imports") -- or string "all"
				-- to include all supported code actions
				-- specify commands exposed as code_actions
				expose_as_code_action = { "all" },
				-- string|nil - specify a custom path to `tsserver.js` file, if this is nil or file under path
				-- not exists then standard path resolution strategy is applied
				tsserver_path = nil,
				-- specify a list of plugins to load by tsserver, e.g., for support `styled-components`
				tsserver_plugins = {},
				-- this value is passed to: https://nodejs.org/api/cli.html#--max-old-space-sizesize-in-megabytes
				-- memory limit in megabytes or "auto"(basically no limit)
				tsserver_max_memory = "auto",
				complete_function_calls = true,
				include_completions_with_insert_text = true,
				code_lens = "all",
				disable_member_code_lens = true,
				jsx_close_tag = {
					enable = true,
					filetypes = { "javascriptreact", "typescriptreact" },
				},
				tsserver_file_preferences = {
					includeInlayParameterNameHints = "all",
					includeInlayParameterNameHintsWhenArgumentMatchesName = false,
					includeInlayFunctionParameterTypeHints = true,
					includeInlayVariableTypeHints = true,
					includeInlayPropertyDeclarationTypeHints = true,
					includeInlayFunctionLikeReturnTypeHints = true,
					includeInlayEnumMemberValueHints = true,
				},
			},
		},
	},
	{
		"dmmulroy/ts-error-translator.nvim",
		enabled = true,
		opts = {
			auto_attach = true,

			-- LSP server names to translate diagnostics for (default shown below)
			servers = {
				"svelte",
				"ts_ls",
				"tsserver", -- deprecated, use ts_ls
				"typescript-tools",
			},
		},
	},
}
