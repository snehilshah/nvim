return {
	"ThePrimeagen/harpoon",
	branch = "harpoon2",
	opts = {
		menu = {
			width = vim.api.nvim_win_get_width(0) - 4,
		},
		settings = {
			save_on_toggle = true,
		},
	},
	keys = {
		{
			"<leader>h",
			function()
				local harpoon = require("harpoon")
				harpoon.ui:toggle_quick_menu(harpoon:list())
			end,
			desc = "List locations",
		},
		{
			"<leader>H",
			function()
				require("harpoon"):list():add()
			end,
			desc = "Add Location",
		},
		{
			"<leader>mr",
			function()
				require("harpoon"):list():remove()
			end,
			desc = "Remove Location",
		},
		{
			"<C-n>",
			function()
				require("harpoon"):list():next()
			end,
			desc = "Next Location",
		},
		{
			"<C-p>",
			function()
				require("harpoon"):list():prev()
			end,
			desc = "Previous Location",
		},
		{
			"<leader>1",
			function()
				require("harpoon"):list():select(1)
			end,
			desc = "Harpoon to File 1",
		},
		{
			"<leader>2",
			function()
				require("harpoon"):list():select(2)
			end,
			desc = "Harpoon to File 2",
		},
		{
			"<leader>3",
			function()
				require("harpoon"):list():select(3)
			end,
			desc = "Harpoon to File 3",
		},
		{
			"<leader>4",
			function()
				require("harpoon"):list():select(4)
			end,
			desc = "Harpoon to File 4",
		},
		{
			"<leader>5",
			function()
				require("harpoon"):list():select(5)
			end,
			desc = "Harpoon to File 5",
		},
	},
}
