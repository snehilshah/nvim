return {
	--  automatically inserts matching pairs of characters when you type the opening one.
	{
		"windwp/nvim-autopairs",
		event = "InsertEnter",
		opts = {},
	},
	-- displays a popup with possible keybindings of the command you started typing.
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
	-- automatically detects and sets the appropriate 'shiftwidth' and 'expandtab' options
	{ "tpope/vim-sleuth" },
	-- provides motions for navigating and operating on CamelCase and snake_case words
	{
		"bkad/CamelCaseMotion",
		init = function()
			vim.g.camelcasemotion_key = "<leader>"
		end,
	},
	-- clipboard manager
	{
		"AckslD/nvim-neoclip.lua",
		event = "VeryLazy",
		dependencies = {
			{ "kkharji/sqlite.lua", module = "sqlite" },
			{ "ibhagwan/fzf-lua" },
		},
		config = function()
			require("neoclip").setup({
				enable_persistent_history = true,
				db_path = vim.fn.stdpath("data") .. "/databases/neoclip.sqlite3",
			})
		end,
		keys = {
			{ "<leader>y", "<cmd>lua require('neoclip.fzf')()<cr>", desc = "Open Neoclip (Clipboard History)" },
		},
	},
	-- color highlighter for color codes
	{
		"norcalli/nvim-colorizer.lua",
		event = "VeryLazy",
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
	-- encourages best practices
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
	-- just comfy line numbers
	{
		"snehilshah/comfy-line-numbers.nvim",
		opts = {
			up_key = "k",
			down_key = "j",

			hidden_file_types = { "undotree" },
			hidden_buffer_types = { "terminal", "nofile" },
			hide_in_insert_mode = true,
		},
	},
	-- a simple timer plugin for Neovim
	{
		"nvzone/timerly",
		lazy = true,
		cmd = "TimerlyToggle",
		dependencies = "nvzone/volt",
		opts = {},
	},
	{
		"kevinhwang91/nvim-ufo",
		dependencies = { "kevinhwang91/promise-async" },
		event = "BufReadPost", -- Load immediately when opening a file
		config = true, -- Runs require('ufo').setup() with default settings
	},
	-- ════════════════════════════════════════════════════════════════════════════
	-- Comments
	-- ════════════════════════════════════════════════════════════════════════════
	{
		"numToStr/Comment.nvim",
		opts = {},
		lazy = false,
	},
	{ "joosepalviste/nvim-ts-context-commentstring", lazy = true },

	{
		"nvim-pack/nvim-spectre",
		dependencies = { "nvim-lua/plenary.nvim" },
		keys = {
			{
				"<leader>sS",
				function()
					require("spectre").open()
				end,
				desc = "Search & Replace",
			},
			{
				"<leader>sW",
				function()
					require("spectre").open_visual({ select_word = true })
				end,
				desc = "Replace Word",
			},
			{
				"<leader>sF",
				function()
					require("spectre").open_file_search()
				end,
				desc = "Replace in File",
			},
		},
	},
	{
		"mcauley-penney/visual-whitespace.nvim",
		init = function()
			vim.keymap.set({ "n", "v" }, "<leader>tw", require("visual-whitespace").toggle, {})
			vim.api.nvim_set_hl(0, "VisualNonText", { fg = "#5D5F71", bg = "#24282d" })
		end,
		event = "ModeChanged *:[vV\22]", -- optionally, lazy load on entering visual mode
		opts = {
			list_chars = {
				space = "·",
				tab = " ",
				nbsp = "󱁐 ",
				lead = "‹",
				trail = "›",
			},
			fileformat_chars = {
				unix = " 󰌑 ",
				mac = " 󰌑 ",
				dos = " 󰌑 ",
			},
		},
	},
	-- ════════════════════════════════════════════════════════════════════════════
	-- Autotags for HTML/JSX
	-- ════════════════════════════════════════════════════════════════════════════
	{
		"windwp/nvim-ts-autotag",
		event = { "BufReadPost", "BufNewFile" },
		opts = {},
	},
}
