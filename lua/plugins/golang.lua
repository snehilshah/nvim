return {
	"ray-x/go.nvim",
	enabled = true,
	dependencies = {
		"ray-x/guihua.lua",
		"nvim-treesitter/nvim-treesitter",
		"neovim/nvim-lspconfig",
	},
	opts = {
		lsp_keymaps = false,
		lsp_on_attach = false,

		lsp_cfg = {
			settings = {
				gopls = {
					gofumpt = true,
					codelenses = {
						gc_details = false,
						generate = true,
						regenerate_cgo = true,
						run_govulncheck = true,
						test = true,
						tidy = true,
						upgrade_dependency = true,
						vendor = true,
					},
					hints = {
						assignVariableTypes = false,
						compositeLiteralFields = false,
						compositeLiteralTypes = false,
						constantValues = true,
						functionTypeParameters = false,
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
						printf = false,
						structtag = true,
						modernize = true,
						stylecheck = true,
						gocritic = true,
						deprecated = true,
					},
					usePlaceholders = true,
					completeUnimported = true,
					staticcheck = true,
					directoryFilters = { "-.git", "-.vscode", "-.idea", "-.vscode-test", "-node_modules" },
					semanticTokens = true,
				},
			},
		},

		lsp_gofumpt = true,

		-- Disable go.nvim's diagnostic display to avoid conflicts with tiny-diagnostics
		lsp_diag_virtual_text = false,
		lsp_diag_signs = false,
		lsp_diag_update_in_insert = false,

		-- Alternatively, use this diagnostic config to completely disable go.nvim diagnostics
		diagnostic = false,

		-- Enable inlay hints
		lsp_inlay_hints = {
			enable = true,
		},
	},
	config = function(_, opts)
		require("go").setup(opts)

		-- Auto-format with goimports on save
		local format_sync_grp = vim.api.nvim_create_augroup("GoFormat", {})
		vim.api.nvim_create_autocmd("BufWritePre", {
			pattern = "*.go",
			callback = function()
				require("go.format").goimports()
			end,
			group = format_sync_grp,
		})
	end,
	event = { "CmdlineEnter" },
	ft = { "go", "gomod" },
	build = ':lua require("go.install").update_all_sync()',
}
