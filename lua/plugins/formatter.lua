return {
	"stevearc/conform.nvim",
	event = { "BufWritePre" },
	cmd = { "ConformInfo" },
	keys = {
		{
			"<leader>fb",
			function()
				require("conform").format({ async = true }, function(err, did_edit)
					if not err and did_edit then
						vim.notify("Code formatted", vim.log.levels.INFO, { title = "Conform" })
					end
				end)
			end,
			mode = { "n", "v" },
			desc = "[F]ormat [B]uffer",
		},
	},
	init = function()
		vim.o.formatexpr = "v:lua.require'conform'.formatexpr()"
	end,
	opts = {
		notify_on_error = true,
		format_on_save = {
			-- if formatting takes longer than this much time then abort
			timeout_ms = 1000,
			lsp_format = "fallback",
		},
		formatters_by_ft = {
			-- lua
			lua = { "stylua" },
			-- Python formatters
			-- python = { "isort", "black" },

			-- C/C++
			c = { "clang_format" },
			cpp = { "clang_format" },

			-- JavaScript/TypeScript (use Biome if biome.json exists, else prettier)
			javascript = { "biome", "prettier", stop_after_first = true },
			javascriptreact = { "biome", "prettier", stop_after_first = true },
			typescript = { "biome", "prettier", stop_after_first = true },
			typescriptreact = { "biome", "prettier", stop_after_first = true },

			-- Web and config files (use Biome)
			json = { "biome", "prettier", stop_after_first = true },
			jsonc = { "biome", "prettier", stop_after_first = true },
			css = { "biome", "prettier", stop_after_first = true },
			scss = { "biome", "prettier", stop_after_first = true },
			html = { "biome", "prettier", stop_after_first = true },
			yaml = { "yamlfmt", stop_after_first = true },
			yml = { "yamlfmt", stop_after_first = true },
			toml = { "tombi", stop_after_first = true },
			markdown = { "markdownlint-cli2", stop_after_first = true },

			-- Go
			go = { "goimports", "gofumpt" },

			-- Shell scripts
			sh = { "shfmt" },
			bash = { "shfmt" },
			zsh = { "shfmt" },

			-- Dockerfile
			dockerfile = { "dockerfmt" },
		},
	},
}
