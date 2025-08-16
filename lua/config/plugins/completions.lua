return
{
	'saghen/blink.cmp',
	dependencies = { 'rafamadriz/friendly-snippets', 'folke/lazydev.nvim' },
	version = '1.*',

	opts = {
		keymap = { preset = 'super-tab' },

		appearance = {
			nerd_font_variant = 'mono'
		},

		completion = {
			documentation = { auto_show = true },
			trigger = { prefetch_on_insert = true }
		},

		signature = { enabled = true },

		sources = {
			default = { 'lsp', 'path', 'snippets', 'buffer', 'lazydev' },
			providers = {
				lazydev = { module = 'lazydev.integrations.blink', score_offset = 100 },
			},
		},

		fuzzy = { implementation = "prefer_rust_with_warning" }
	},
	opts_extend = { "sources.default" }
}
