return {
	"stevearc/conform.nvim",
	event = { "BufWritePre" },
	cmd = { "ConformInfo" },
	keys = {
		{
			"<leader>fb",
			function()
				require("conform").format({ async = true, lsp_format = "fallback" })
			end,
			mode = "",
			desc = "[F]ormat [B]uffer",
		},
	},
	opts = {
		notify_on_error = true,
		format_on_save = {
			-- if formatting takes longer than this much time then abort
			timeout_ms = 1000,
			lsp_format = "fallback",
		},
		formatters_by_ft = {
			lua = { "stylua" },
			-- Python formatters
			-- python = { "isort", "black" },

			-- C/C++
			c = { "clang_format" },
			cpp = { "clang_format" },

			-- JavaScript/TypeScript (use Biome for formatting)
			javascript = { "biome", stop_after_first = true },
			javascriptreact = { "biome", stop_after_first = true },
			typescript = { "biome", stop_after_first = true },
			typescriptreact = { "biome", stop_after_first = true },

			-- Web and config files (use Biome)
			json = { "biome", stop_after_first = true },
			jsonc = { "biome", stop_after_first = true },
			css = { "biome", stop_after_first = true },
			scss = { "biome", stop_after_first = true },
			html = { "biome", stop_after_first = true },
			markdown = { "biome", stop_after_first = true },
			yaml = { "biome", stop_after_first = true },
			yml = { "biome", stop_after_first = true },

			-- Go
			go = { "gofumpt", "goimports" },

			-- Shell scripts
			sh = { "shfmt" },
			bash = { "shfmt" },
			zsh = { "shfmt" },

			-- Dockerfile
			dockerfile = { "hadolint" },
		},
	},
}
