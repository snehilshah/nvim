return {

	"nvim-lualine/lualine.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	opts = {
		sections = {
			lualine_a = { "mode" },
			lualine_b = { "branch", "diff", "diagnostics" },
			lualine_c = { "filename" },
			test = {},
			lualine_x = { "selectioncount" },
			lualine_y = { "progress" },
			lualine_z = { "location" },
		},
	},
}
