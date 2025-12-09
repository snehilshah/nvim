return {
	{
		"ellisonleao/gruvbox.nvim",
		enabled = false,
		priority = 1000,
		lazy = false,
		opts = {
			terminal_colors = true,
			undercurl = true,
			underline = true,
			bold = true,
			italic = {
				strings = true,
				emphasis = true,
				comments = true,
				operators = false,
				folds = true,
			},
			strikethrough = true,
			invert_selection = false,
			invert_signs = false,
			invert_tabline = false,
			invert_intend_guides = false,
			inverse = false,
			contrast = "hard",
			palette_overrides = {
				dark0_hard = "#1d2021",
				dark0 = "#282828",
				dark0_soft = "#32302f",
				dark1 = "#3c3836",
				dark2 = "#504945",
				dark3 = "#665c54",
				dark4 = "#7c6f64",

				light0_hard = "#f9f5d7",
				light0 = "#fbf1c7",
				light0_soft = "#f2e5bc",
				light1 = "#ebdbb2",
				light2 = "#d5c4a1",
				light3 = "#bdae93",
				light4 = "#a89984",
				gray = "#928374",

				bright_red = "#EA6962",
				bright_green = "#A9B665",
				bright_yellow = "#fabd2f",
				bright_blue = "#7DAEA3",
				bright_purple = "#d3869b",
				bright_aqua = "#89B482",
				bright_orange = "#fe8019",

				neutral_red = "#EA6962",
				neutral_green = "#A9B665",
				neutral_yellow = "#d79921",
				neutral_blue = "#7DAEA3",
				neutral_purple = "#b16286",
				neutral_aqua = "#89B482",
				neutral_orange = "#d65d0e",

				faded_red = "#EA6962",
				faded_green = "#A9B665",
				faded_yellow = "#b57614",
				faded_blue = "#076678",
				faded_purple = "#8f3f71",
				faded_aqua = "#89B482",
				faded_orange = "#af3a03",
			},
			overrides = {
				String = { fg = "#D8A657", italic = true },
				["@lsp.type.class"] = { fg = "#7DAEA3" },
				["@lsp.type.type"] = { fg = "#7DAEA3" },
				["@namespace"] = { fg = "#89B482" },
				["@lsp.type.property.typescript"] = { fg = "#ebdbb2" },
				-- Make gutter/sign column match background
				SignColumn = { bg = "#1D2021" },
				LineNr = { bg = "#1D2021" },
				CursorLineNr = { bg = "#1D2021" },
				FoldColumn = { bg = "#1D2021" },
				GitSignsAdd = { bg = "#1D2021" },
				GitSignsChange = { bg = "#1D2021" },
				GitSignsDelete = { bg = "#1D2021" },
			},
			dim_inactive = false,
			transparent_mode = false,
		},
		config = function(_, opts)
			require("gruvbox").setup(opts)
			vim.o.background = "dark" -- or "light" for light mode
			vim.cmd([[colorscheme gruvbox]])

			-- Custom statusline highlights
			vim.api.nvim_set_hl(0, "StatusLine", {
				bg = "#1C2021", -- Dark gray background
				fg = "#ebdbb2", -- Light text
				bold = false,
			})

			vim.api.nvim_set_hl(0, "StatusLineNC", {
				bg = "#1C2021", -- Darker background for inactive windows
				fg = "#928374", -- Muted text
				bold = false,
			})

			-- Git blame inline text color
			vim.api.nvim_set_hl(0, "GitSignsCurrentLineBlame", {
				fg = "#d3869b", -- Gruvbox purple
				italic = true,
			})
		end,
	},
	{
		"sainnhe/gruvbox-material",
		lazy = false,
		priority = 1000,
		config = function()
			vim.g.gruvbox_material_better_performance = true
			vim.cmd("colorscheme gruvbox-material")
		end,
	},
}
