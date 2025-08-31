return {
	"nvim-lualine/lualine.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	opts = {
		options = {
			theme = "auto",
			section_separators = { left = "", right = "" },
			component_separators = { left = "", right = "" },
			icons_enabled = true,
		},
		sections = {
			lualine_a = { "mode" },
			lualine_b = { "branch", "diagnostics" },
			-- path = 0 -> filename, 1 -> relative path, 2 -> absolute path
			lualine_c = { { "filename", path = 1 } },
			lualine_x = { "filetype" },
			lualine_y = { "progress" },
			lualine_z = { "location" },
		},
	},
}
