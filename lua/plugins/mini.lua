return {
	"nvim-mini/mini.nvim",
	priority = 1000, -- Load early to ensure icons are available
	lazy = false, -- Load immediately, not lazily
	version = false,
	config = function()
		-- require("mini.ai").setup({ n_lines = 500 }) -- this is not a "AI" plugin
		require("mini.cmdline").setup()
		require("mini.cursorword").setup()
		require("mini.icons").setup({
			-- Override by exact filename (case-sensitive)
			file = {
				["Dockerfile"] = { glyph = "󰡨", hl = "MiniIconsBlue" },
				["Makefile"] = { glyph = "", hl = "MiniIconsRed" },
				[".dockerignore"] = { glyph = "󰡨", hl = "MiniIconsBlue" },
				[".gitignore"] = { glyph = "", hl = "MiniIconsOrange" },
				["README.md"] = { glyph = "", hl = "MiniIconsRed" },
			},
			-- Override by filetype
			filetype = {
				dockerfile = { glyph = "󰡨", hl = "MiniIconsBlue" },
				make = { glyph = "", hl = "MiniIconsRed" },
				markdown = { glyph = "", hl = "MiniIconsBlue" },
				go = { glyph = "", hl = "MiniIconsAzure" },
				json = { glyph = "", hl = "MiniIconsYellow" },
				jsonc = { glyph = "", hl = "MiniIconsYellow" },
			},
			extension = {
				log = { glyph = "󰌱", hl = "MiniIconsGreen" },
				md = { glyph = "", hl = "MiniIconsBlue" },
			},
		})
		MiniIcons.mock_nvim_web_devicons()
		require("mini.operators").setup()
		require("mini.surround").setup()
	end,
}
