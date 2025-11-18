return {
	"stevearc/oil.nvim",
	opts = {
		view_options = {
			show_hidden = true,
			natural_order = true,
			sort = {
				{ "type", "asc" },
				{ "name", "asc" },
			},
		},
	},
	dependencies = { "nvim-tree/nvim-web-devicons" },
	lazy = false,
}
