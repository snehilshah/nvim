return {
	{
		"folke/lazydev.nvim",
		ft = "lua",
		opts = {
			library = {
				{ path = "${3rd}/luv/library", words = { "vim%.uv" } },
				"LazyVim",
				{ path = "LazyVim", words = { "LazyVim" } },
			},
		},
	},
	{
		"j-hui/fidget.nvim",
		event = "LspAttach",
		opts = {
			notification = {
				window = {
					winblend = 0,
				},
			},
		},
	},
	{
		"rachartier/tiny-code-action.nvim",
		dependencies = {
			{ "nvim-lua/plenary.nvim" },
			{ "folke/snacks.nvim" },
		},
		event = "LspAttach",
		opts = {
			--- The backend to use, currently only "vim", "delta", "difftastic", "diffsofancy" are supported
			backend = "delta",

			picker = "snacks",
			backend_opts = {
				delta = {
					header_lines_to_remove = 4,
					args = {
						"--line-numbers",
					},
				},
			},
			resolve_timeout = 100,

			notify = {
				enabled = true,
				on_empty = true,
			},

			-- You can set the highlight like so: { link = "DiagnosticError" } or  like nvim_set_hl ({ fg ..., bg..., bold..., ...})
			signs = {
				quickfix = { "", { link = "DiagnosticWarning" } },
				others = { "", { link = "DiagnosticWarning" } },
				refactor = { "", { link = "DiagnosticInfo" } },
				["refactor.move"] = { "󰪹", { link = "DiagnosticInfo" } },
				["refactor.extract"] = { "", { link = "DiagnosticError" } },
				["source.organizeImports"] = { "", { link = "DiagnosticWarning" } },
				["source.fixAll"] = { "󰃢", { link = "DiagnosticError" } },
				["source"] = { "", { link = "DiagnosticError" } },
				["rename"] = { "󰑕", { link = "DiagnosticWarning" } },
				["codeAction"] = { "", { link = "DiagnosticWarning" } },
			},
		},
	},
}
