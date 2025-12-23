return {
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		branch = "main",
		lazy = false,
		config = function()
			require("nvim-treesitter").setup({
				ensure_install = {
					"bash",
					"c",
					"html",
					"javascript",
					"json",
					"lua",
					"luadoc",
					"luap",
					"markdown",
					"markdown_inline",
					"python",
					"query",
					"regex",
					"jsx",
					"tsx",
					"typescript",
					"vim",
					"vimdoc",
					"yaml",
					"rust",
					"go",
					"gomod",
					"gowork",
					"gosum",
					"proto",
				},
			})

			-- Enable treesitter-based highlighting
			vim.api.nvim_create_autocmd("FileType", {
				callback = function()
					pcall(vim.treesitter.start)
				end,
			})
		end,
	},
}
