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
		notify_on_error = false,
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

			-- JavaScript/TypeScript (prettier handles formatting)
			javascript = { "prettierd", "prettier", stop_after_first = true },
			javascriptreact = { "prettierd", "prettier", stop_after_first = true },
			typescript = { "prettierd", "prettier", stop_after_first = true },
			typescriptreact = { "prettierd", "prettier", stop_after_first = true },

			-- Web (all handled by prettier)
			json = { "prettierd", "prettier", stop_after_first = true },
			jsonc = { "prettierd", "prettier", stop_after_first = true },
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
