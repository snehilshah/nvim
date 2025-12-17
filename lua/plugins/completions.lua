return {
	{
		"L3MON4D3/LuaSnip",
		version = "v2.*",
		build = "make install_jsregexp",
		dependencies = {
			"rafamadriz/friendly-snippets",
		},
		config = function()
			require("luasnip.loaders.from_vscode").lazy_load()
		end,
		keys = {},
	},
	{
		"saghen/blink.cmp",
		dependencies = {
			"rafamadriz/friendly-snippets",
			"folke/lazydev.nvim",
			"fang2hou/blink-copilot",
			"nvim-mini/mini.nvim",
			"L3MON4D3/LuaSnip",
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
				use_nvim_cmp_as_default = false,
				nerd_font_variant = "mono",
			},

			completion = {
				menu = {
					auto_show = true,
					border = "rounded",
					scrollbar = false,
					scrolloff = 1,
					draw = {
						padding = 1,
						gap = 1,
						columns = {
							{ "kind_icon" },
							{ "label", "label_description", gap = 1 },
							{ "kind" },
							{ "source_name" },
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
			},

			snippets = { preset = "luasnip" },

			cmdline = {
				enabled = false, -- mini.cmdline has better options, with previews
				completion = { menu = { auto_show = true } },
				keymap = {
					["<CR>"] = { "accept_and_enter", "fallback" },
				},
			},

			sources = {
				default = { "lazydev", "lsp", "path", "copilot", "snippets", "buffer" },
				providers = {
					lazydev = { name = "LazyDev", module = "lazydev.integrations.blink", score_offset = 100 },
					copilot = {
						name = "copilot",
						module = "blink-copilot",
						score_offset = 100,
						async = true,
					},
					cmdline = {
						min_keyword_length = 2,
					},
					lsp = {
						name = "LSP",
						module = "blink.cmp.sources.lsp",
						opts = {
							markdown_oxide = {
								keyword_pattern = [[\(\k\| \|\/\|#\)\+]],
							},
						},
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
	},
}
