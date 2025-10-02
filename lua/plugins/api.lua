return {
	"romek-codes/bruno.nvim",
	dependencies = {
		"nvim-lua/plenary.nvim",
		{
			"folke/snacks.nvim",
			opts = { picker = { enabled = true } },
		},
	},
	opts = {
		collection_paths = {
			{ name = "Main", path = "/home/srshah/projects/nitro-api-bruno" },
		},
		picker = "snacks",
		show_formatted_output = true,
		suppress_formatting_errors = false,
	},
}
