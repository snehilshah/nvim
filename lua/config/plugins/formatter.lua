return {
	"stevearc/conform.nvim",
	event = { "BufWritePre" },
	cmd = { "ConformInfo" },
	keys = {
		{
			"<leader>af",
			function()
				require("conform").format({ async = true, lsp_format = "fallback" })
			end,
			mode = "",
			desc = "[F]ormat [B]uffer",
		},
	},
	opts = {
		notify_on_error = false,
		format_on_save = {
			-- if formatting takes longer than this much time then abort
			timeout_ms = 1000,
			lsp_format = "fallback",
		},
		formatters = {
			-- Custom biome formatter that handles both formatting and import organizing
			["biome-check"] = {
				command = "biome",
				args = { "check", "--apply", "--stdin-file-path", "$FILENAME" },
				stdin = true,
			},
		},
		formatters_by_ft = {
			lua = { "stylua" },
			-- Python formatters
			-- python = { "isort", "black" },

			-- C/C++
			c = { "clang_format" },
			cpp = { "clang_format" },

			-- JavaScript/TypeScript (biome handles both formatting and import sorting)
			javascript = { "biome-check" },
			javascriptreact = { "biome-check" },
			typescript = { "biome-check" },
			typescriptreact = { "biome-check" },

			-- Web (JSON handled by biome, others by prettier)
			json = { "biome" },
			jsonc = { "biome" },
			css = { "prettierd", "prettier", stop_after_first = true },
			scss = { "prettierd", "prettier", stop_after_first = true },
			html = { "prettierd", "prettier", stop_after_first = true },
			markdown = { "prettierd", "prettier", stop_after_first = true },
			yaml = { "prettierd", "prettier", stop_after_first = true },
			yml = { "prettierd", "prettier", stop_after_first = true },

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
