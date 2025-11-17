return {
	"ray-x/go.nvim",
	enabled = true,
	dependencies = {
		"ray-x/guihua.lua",
		"nvim-treesitter/nvim-treesitter",
		"neovim/nvim-lspconfig",
	},
	opts = {
		lsp_cfg = true,
		lsp_keymaps = false,
		lsp_on_attach = true,
		lsp_gofumpt = true,
		lsp_inlay_hints = {
			enable = true,
		},

		-- these are disabled to avoid conflicts with tiny-diagnostics
		diagnostic = false,
		lsp_diag_virtual_text = true,
		lsp_diag_signs = true,
		lsp_diag_update_in_insert = true,
	},
	config = function(_, opts)
		require("go").setup(opts)
		local format_sync_grp = vim.api.nvim_create_augroup("GoFormat", {})
		vim.api.nvim_create_autocmd("BufWritePre", {
			pattern = "*.go",
			callback = function()
				require("go.format").goimports()
			end,
			group = format_sync_grp,
		})
	end,
	event = { "BufReadPost" },
	ft = { "go", "gomod" },
	build = ':lua require("go.install").update_all_sync()',
}
