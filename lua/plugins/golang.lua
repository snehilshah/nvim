return {
	{
		"ray-x/go.nvim",
		enabled = true,
		dependencies = {
			"ray-x/guihua.lua",
			"nvim-treesitter/nvim-treesitter",
			"neovim/nvim-lspconfig",
			"saghen/blink.cmp",
		},
		config = function(_, opts)
			local capabilities = require("blink.cmp").get_lsp_capabilities()
			require("go").setup({
				lsp_keymaps = true,
				lsp_codelens = true,
				lsp_on_attach = true,
				lsp_gofumpt = true,
				lsp_inlay_hints = {
					enable = true,
				},
				lsp_semantic_highlights = true,
				lsp_cfg = {
					capabilities = capabilities,
					settings = {
						gopls = {
							gofumpt = true,
							codelenses = {
								gc_details = true,
								generate = true,
								regenerate_cgo = false,
								run_govulncheck = true,
								test = true,
								tidy = true,
								upgrade_dependency = true,
								vendor = true,
							},
							hints = {
								assignVariableTypes = true,
								compositeLiteralFields = true,
								compositeLiteralTypes = true,
								constantValues = true,
								functionTypeParameters = true,
								parameterNames = true,
								rangeVariableTypes = true,
							},
							analyses = {
								nilness = true,
								unusedparams = true,
								unusedwrite = true,
								useany = true,
								unreachable = true,
								unusedresult = true,
								simplifyslice = true,
								simplifyrange = true,
								simplifycompositelit = true,
								shadow = false,
								printf = true,
								structtag = true,
								modernize = true,
								stylecheck = true,
								gocritic = true,
								deprecated = true,
							},
							usePlaceholders = true,
							completeUnimported = true,
							staticcheck = true,
							directoryFilters = {
								"-.git",
								"-.vscode",
								"-.idea",
								"-.vscode-test",
								"-node_modules",
								"-generated",
							},
							semanticTokens = true,
						},
					},
				},
				golangci_lint = {
					default = 'all', -- set to one of { 'standard', 'fast', 'all', 'none' }
					-- disable = {'errcheck', 'staticcheck'}, -- linters to disable empty by default
					-- enable = {'govet', 'ineffassign','revive', 'gosimple'}, -- linters to enable; empty by default
					config = nil, -- set to a config file path
					no_config = false, -- true: golangci-lint --no-config
					-- disable = {},     -- linters to disable empty by default, e.g. {'errcheck', 'staticcheck'}
					-- enable = {},      -- linters to enable; empty by default, set to e.g. {'govet', 'ineffassign','revive', 'gosimple'}
					-- enable_only = {}, -- linters to enable only; empty by default, set to e.g. {'govet', 'ineffassign','revive', 'gosimple'}
					severity = vim.diagnostic.severity.INFO, -- severity level of the diagnostics
				},
				-- these are disabled to avoid conflicts with tiny-diagnostics
				diagnostic = false,
				lsp_diag_virtual_text = true,
				lsp_diag_signs = true,
				lsp_diag_update_in_insert = true,
			})
			local format_sync_grp = vim.api.nvim_create_augroup("GoFormat", {})
			vim.api.nvim_create_autocmd("BufWritePre", {
				pattern = "*.go",
				callback = function()
					require("go.format").goimports()
				end,
				group = format_sync_grp,
			})
		end,
		ft = { "go", "gomod" },
		build = ':lua require("go.install").update_all_sync()',
	},
	{
		"snehilshah/no-go.nvim",
		enabled = true,
		dependencies = { "nvim-treesitter/nvim-treesitter" },
		ft = "go",
		opts = {
			identifiers = { "err", "error" },
			import_virtual_text = {
				prefix = " ", -- or any icon you prefer
				suffix = " imports ",
			},
		},
	},
}
