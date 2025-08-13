return {
	"nvim-tree/nvim-tree.lua",
	version = "*",
	lazy = false,
	dependencies = {
		"nvim-tree/nvim-web-devicons",
	},
	config = function()
		local api = require("nvim-tree.api")
		vim.keymap.set("n", "<space>we", api.tree.toggle)
		require("nvim-tree").setup {}
	end,
}
