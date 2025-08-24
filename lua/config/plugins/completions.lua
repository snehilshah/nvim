return {
	"saghen/blink.cmp",
	dependencies = {
		"rafamadriz/friendly-snippets",
		"folke/lazydev.nvim",
		"fang2hou/blink-copilot",
		"echasnovski/mini.nvim",
	},
	version = "1.*",

	opts = {
		keymap = { preset = "super-tab" },

		appearance = {
			nerd_font_variant = "mono",
		},

		completion = {
			menu = {
				border = "rounded",
				scrollbar = true,
				draw = {
					columns = {
						{ "kind_icon" },
						{ "label", "label_description", "kind", gap = 1 },
					},
					treesitter = {
						"lsp",
					},
				},
			},
			ghost_text = {
				enabled = true,
			},
			documentation = {
				auto_show = true,
				auto_show_delay_ms = 200,
				window = {
					border = "rounded",
					scrollbar = true,
				},
			},
			trigger = { prefetch_on_insert = true },
			list = {
				selection = {
					preselect = false,
					auto_insert = true,
				},
			},
			cmdline = {
				enabled = false,
			},
		},

		sources = {
			default = { "lsp", "path", "copilot", "snippets", "buffer", "lazydev" },
			providers = {
				lazydev = { module = "lazydev.integrations.blink", score_offset = 100 },
				copilot = {
					name = "copilot",
					module = "blink-copilot",
					score_offset = 100,
					async = true,
				},
			},
		},

		fuzzy = { implementation = "prefer_rust_with_warning" },

		signature = {
			enabled = true,
			window = {
				show_documentation = true,
				border = "rounded",
			},
		},
	},
	opts_extend = { "sources.default" },
}
