return {
	"y3owk1n/undo-glow.nvim",
	enabled = true,
	opts = {
		animation = {
			enabled = true,
			duration = 600,
			window_scoped = true,
		},
		highlights = {
			undo = {
				hl_color = { bg = "#693232" }, -- Dark muted red
			},
			redo = {
				hl_color = { bg = "#2F4640" }, -- Dark muted green
			},
			yank = {
				hl_color = { bg = "#d8a657", fg = "#1d2021" }, -- Gruvbox Material yellow on dark bg
			},
			paste = {
				hl_color = { bg = "#325B5B" }, -- Dark muted cyan
			},
			comment = {
				hl_color = { bg = "#7A5A3D" }, -- Dark muted orange
			},
			cursor = {
				hl_color = { bg = "#793D54" }, -- Dark muted pink
			},
		},
		priority = 2048 * 3,
	},
	keys = {
		{
			"u",
			function()
				require("undo-glow").undo({
					animation = {
						animation_type = "zoom",
					},
				})
			end,
			mode = "n",
			desc = "Undo with highlight",
			noremap = true,
		},
		{
			"U",
			function()
				require("undo-glow").redo({
					animation = {
						animation_type = "zoom",
					},
				})
			end,
			mode = "n",
			desc = "Redo with highlight",
			noremap = true,
		},
		{
			"gc",
			function()
				-- This is an implementation to preserve the cursor position
				local pos = vim.fn.getpos(".")
				vim.schedule(function()
					vim.fn.setpos(".", pos)
				end)
				return require("undo-glow").comment({
					animation_type = "zoom",
				})
			end,
			mode = { "n", "x" },
			desc = "Toggle comment with highlight",
			expr = true,
			noremap = true,
		},
		{
			"gc",
			function()
				require("undo-glow").comment_textobject({
					animation_type = "zoom",
				})
			end,
			mode = "o",
			desc = "Comment textobject with highlight",
			noremap = true,
		},
		{
			"gcc",
			function()
				return require("undo-glow").comment_line({
					animation_type = "zoom",
				})
			end,
			mode = "n",
			desc = "Toggle comment line with highlight",
			expr = true,
			noremap = true,
		},
		{
			"p",
			function()
				require("undo-glow").highlight_changes({
					hlgroup = "UgPaste",
					animation = { animation_type = "zoom" },
				})
				vim.cmd("normal! p")
			end,
			mode = "n",
			desc = "Paste below with highlight",
			noremap = true,
		},
		{
			"P",
			function()
				require("undo-glow").highlight_changes({
					hlgroup = "UgPaste",
					animation = { animation_type = "zoom" },
				})
				vim.cmd("normal! P")
			end,
			mode = "n",
			desc = "Paste above with highlight",
			noremap = true,
		},
	},
	init = function()
		local undo_glow_group = vim.api.nvim_create_augroup("UndoGlowHighlights", { clear = true })

		vim.api.nvim_create_autocmd("TextYankPost", {
			group = undo_glow_group,
			desc = "Highlight when yanking (copying) text",
			callback = function()
				require("undo-glow").yank({
					animation = {
						animation_type = "fade",
					},
				})
			end,
		})

		-- This only handles neovim instance and do not highlight when switching panes in tmux
		vim.api.nvim_create_autocmd("CursorMoved", {
			group = undo_glow_group,
			desc = "Highlight when cursor moved significantly",
			callback = function()
				require("undo-glow").cursor_moved({
					animation = {
						animation_type = "slide",
					},
				})
			end,
		})

		vim.api.nvim_create_autocmd("CmdLineLeave", {
			group = undo_glow_group,
			pattern = { "/", "?" },
			desc = "Highlight when search cmdline leave",
			callback = function()
				require("undo-glow").search_cmd({
					animation = {
						animation_type = "zoom",
					},
				})
			end,
		})
	end,
}
