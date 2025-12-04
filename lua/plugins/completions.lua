return {
	"saghen/blink.cmp",
	dependencies = {
		"rafamadriz/friendly-snippets",
		"folke/lazydev.nvim",
		"fang2hou/blink-copilot",
		"nvim-mini/mini.nvim",
		{
			"L3MON4D3/LuaSnip",
			version = "v2.*",
			build = "make install_jsregexp",
			config = function()
				require("luasnip.loaders.from_vscode").lazy_load({
					exclude = { "go" }, -- go.nvim provides its own Go snippets
				})
			end,
		},
	},
	version = "1.*",

	opts = {
		keymap = {
			preset = "super-tab",
			-- ["<Tab>"] = {
			-- 	"snippet_forward",
			-- 	function() -- sidekick next edit suggestion
			-- 		return require("sidekick").nes_jump_or_apply()
			-- 	end,
			-- 	function() -- if you are using Neovim's native inline completions
			-- 		return vim.lsp.inline_completion.get()
			-- 	end,
			-- 	"fallback",
			-- },
		},

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
					preselect = true,
					auto_insert = true,
				},
			},
			cmdline = {
				enabled = false,
			},
		},

		snippets = { preset = "luasnip" },

		sources = {
			default = { "lazydev", "lsp", "path", "copilot", "snippets", "buffer" },
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
