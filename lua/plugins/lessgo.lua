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
				lsp_keymaps = false,
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
							codelenses = {
								generate = true,
								gc_details = true,
								test = true,
								tidy = true,
								vendor = true,
								regenerate_cgo = false,
								upgrade_dependency = true,
								run_govulncheck = true,
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
								ST1003 = true,
								undeclaredname = true,
								fillreturns = true,
								nonewvars = true,
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
							matcher = "Fuzzy",
							diagnosticsDelay = '500ms',
							symbolMatcher = 'fuzzy',
							directoryFilters = {
								"-.git",
								"-.vscode",
								"-.idea",
								"-.vscode-test",
								"-node_modules",
								"-generated",
							},
							semanticTokens = true,
							gofumpt = true,
						},
					},
				},
				golangci_lint = {
					default = 'none', -- disabled, using nvim-lint instead
					-- disable = {'errcheck', 'staticcheck'}, -- linters to disable empty by default
					-- enable = {'govet', 'ineffassign','revive', 'gosimple'}, -- linters to enable; empty by default
					config = nil, -- set to a config file path
					no_config = false, -- true: golangci-lint --no-config
					-- disable = {},     -- linters to disable empty by default, e.g. {'errcheck', 'staticcheck'}
					-- enable = {},      -- linters to enable; empty by default, set to e.g. {'govet', 'ineffassign','revive', 'gosimple'}
					-- enable_only = {}, -- linters to enable only; empty by default, set to e.g. {'govet', 'ineffassign','revive', 'gosimple'}
					severity = vim.diagnostic.severity.INFO, -- severity level of the diagnostics
				},
				-- Disable go.nvim diagnostics, using tiny-diagnostics + nvim-lint instead
				diagnostic = false,
				lsp_diag_virtual_text = false,
				lsp_diag_signs = false,
				lsp_diag_update_in_insert = false,
				luasnip = true, -- enable go.nvim luasnip snippets
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
