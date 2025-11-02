return {
	{ -- Add indentation guides even on blank lines
		"lukas-reineke/indent-blankline.nvim",
		-- Enable `lukas-reineke/indent-blankline.nvim`
		-- See `:help ibl`
		main = "ibl",
		opts = {},
	},
	{
		"windwp/nvim-autopairs",
		event = "InsertEnter",
		opts = {},
	},
	{
		"folke/which-key.nvim",
		event = "VeryLazy",
		opts = {
			-- your configuration comes here
			-- or leave it empty to use the default settings
			-- refer to the configuration section below
		},
		keys = {
			{
				"<leader>?",
				function()
					require("which-key").show({ global = false })
				end,
				desc = "Buffer Local Keymaps (which-key)",
			},
		},
	},
	{ "tpope/vim-sleuth" },
	{
		"kylechui/nvim-surround",
		version = "^3.0.0", -- Use for stability; omit to use `main` branch for the latest features
		event = "VeryLazy",
		config = function()
			require("nvim-surround").setup({})
		end,
	},
	{
		"bkad/CamelCaseMotion",
		init = function()
			vim.g.camelcasemotion_key = "<leader>"
		end,
	},
	{
		"AckslD/nvim-neoclip.lua",
		dependencies = {
			{ 'kkharji/sqlite.lua',           module = 'sqlite' },
			{ "nvim-telescope/telescope.nvim" },
		},
		config = function()
			require('neoclip').setup({
				enable_persistent_history = true,
				db_path = vim.fn.stdpath("data") .. "/databases/neoclip.sqlite3",
				-- Load neoclip extension for telescope
			})
			require('telescope').load_extension('neoclip')
		end,
		keys = {
			{ "<leader>y", "<cmd>Telescope neoclip<cr>",    desc = "Open Neoclip (Clipboard History)" },
			{ "<leader>q", "<cmd>Telescope macroscope<cr>", desc = "Open Macroscope (Macro History)" },
		},
	},
	{
		"wurli/visimatch.nvim",
		opts = {
			hl_group = "Search",
			chars_lower_limit = 3,
			lines_upper_limit = 30,
			strict_spacing = false,
			-- Visible buffers which should be highlighted. Valid options:
			-- * `"filetype"` (the default): highlight buffers with the same filetype
			-- * `"current"`: highlight matches in the current buffer only
			-- * `"all"`: highlight matches in all visible buffers
			-- * A function. This will be passed a buffer number and should return
			--   `true`/`false` to indicate whether the buffer should be highlighted.
			buffers = "filetype",
			-- Case-(in)nsitivity for matches. Valid options:
			-- * `true`: matches will never be case-sensitive
			-- * `false`/`{}`: matches will always be case-sensitive
			-- * a table of filetypes to use use case-insensitive matching for.
			case_insensitive = { "markdown", "text", "help" },
		},
	},
	{
		"norcalli/nvim-colorizer.lua",
		config = function()
			require("colorizer").setup({ "*" }, {
				RGB = true, -- #RGB hex codes
				RRGGBB = true, -- #RRGGBB hex codes
				names = false, -- "Name" codes like Blue
				RRGGBBAA = true, -- #RRGGBBAA hex codes
				rgb_fn = true, -- CSS rgb() and rgba() functions
				hsl_fn = true, -- CSS hsl() and hsla() functions
				css = true, -- Enable all CSS features: rgb_fn, hsl_fn, names, RGB, RRGGBB
				css_fn = true, -- Enable all CSS *functions*: rgb_fn, hsl_fn
			})
		end,
	},
	{
		"m4xshen/hardtime.nvim",
		lazy = false,
		dependencies = { "MunifTanjim/nui.nvim" },
		opts = {
			max_count = 20,
			disable_mouse = false,
			restriction_mode = "hint",
		},
	},
	{ "sitiom/nvim-numbertoggle" },
	{
		"mluders/comfy-line-numbers.nvim",
		utils = {
			up_key = "k",
			down_key = "j",

			hidden_file_types = { "undotree" },
			hidden_buffer_types = { "terminal", "nofile" },
			hide_in_insert_mode = true,
		},
	},
}
