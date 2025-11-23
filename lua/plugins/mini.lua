return {
	"nvim-mini/mini.nvim",
	priority = 1000, -- Load early to ensure icons are available
	lazy = false, -- Load immediately, not lazily
	version = false,
	config = function()
		require("mini.ai").setup({ n_lines = 500 }) -- this is not a "AI" plugin
		require("mini.cursorword").setup()
		-- require("mini.icons").setup()
		require("mini.operators").setup()
		require("mini.surround").setup()
	end,
}
