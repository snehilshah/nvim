return {
	"saghen/blink.cmp",
	dependencies = { "rafamadriz/friendly-snippets", "folke/lazydev.nvim", "fang2hou/blink-copilot" },
	version = "1.*",

	opts = {
		keymap = { preset = "super-tab" },

		appearance = {
			nerd_font_variant = "mono",
		},

		completion = {
			menu = {
				border = "rounded",
			},
			ghost_text = {
				enabled = true,
			},
			documentation = { auto_show = true },
			trigger = { prefetch_on_insert = true },
		},

		signature = { enabled = true },

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
	},
	opts_extend = { "sources.default" },
}
