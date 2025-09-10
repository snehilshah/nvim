return {
	"folke/twilight.nvim",
	event = "VeryLazy",
	-- lazy.nvim will call this with the opts below so twilight is initialized
	opts = {
		dimming = {
			alpha = 0.4,      -- amount of dimming
			color = { "Normal", "#ffffff" },
			term_bg = "#000000", -- if guibg=NONE, this will be used to calculate text color
			inactive = true,  -- when true, other windows will be fully dimmed (unless they contain the same buffer)
		},
		context = 30,       -- amount of lines we will try to show around the current line
		treesitter = false,
		exclude = {}, -- exclude these filetypes
	},
}
