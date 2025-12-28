return {
	"andymass/vim-matchup",
	event = "BufReadPost",
	init = function()
		-- Disable Neovim's built-in matchparen plugin
		vim.g.loaded_matchparen = 1

		-- Highlight matching brackets when cursor is inside them
		vim.g.matchup_matchparen_offscreen = { method = "popup" }
		-- Enable deferred highlighting (better performance)
		vim.g.matchup_matchparen_deferred = 1
		vim.g.matchup_matchparen_deferred_show_delay = 50
		vim.g.matchup_matchparen_deferred_hide_delay = 700
		-- Highlight surrounding brackets, not just the one under cursor
		vim.g.matchup_matchparen_hi_surround_always = 1
	end,
	opts = {},
}
