return {
	"romgrk/barbar.nvim",
	dependencies = {
		"nvim-tree/nvim-web-devicons", -- OPTIONAL: for file icons
	},
	init = function()
		vim.g.barbar_auto_setup = false
	end,
	opts = {
		animation = true,
		-- Enable/disable current/total tabpages indicator (top right corner)
		tabpages = true,
		-- A buffer to this direction will be focused (if it exists) when closing the current buffer.
		-- Valid options are 'left' (the default), 'previous', and 'right'
		focus_on_close = "left",
		-- Hide inactive buffers and file extensions. Other options are `alternate`, `current`, and `visible`.
		hide = { extensions = false, inactive = false },
		icons = {
			buffer_index = false,
			buffer_number = false,
			button = "",
			diagnostics = {
				[vim.diagnostic.severity.ERROR] = { enabled = true, icon = " " },
			},
			separator = { left = "▎", right = "" },
			-- If true, add an additional separator at the end of the buffer list
			separator_at_end = true,
			-- Configure the icons on the bufferline when modified or pinned.
			-- Supports all the base icon options.
			modified = { button = "●" },
			pinned = { button = "", filename = true },
			-- Configure the icons on the bufferline based on the visibility of a buffer.
			-- Supports all the base icon options, plus `modified` and `pinned`.
			alternate = { filetype = { enabled = false } },
			current = { buffer_index = true },
			inactive = { button = "×" },
			visible = { modified = { buffer_number = false } },
		},
		sidebar_filetypes = { -- Set the filetypes which barbar will offset itself for
			-- Use the default values: {event = 'BufWinLeave', text = '', align = 'left'}
			NvimTree = true,
			-- Or, specify the text used for the offset:
			undotree = {
				text = "undotree",
				align = "left", -- *optionally* specify an alignment (either 'left', 'center', or 'right')
			},
			-- Or, specify the event which the sidebar executes when leaving:
			["neo-tree"] = { event = "BufWipeout" },
			-- Or, specify all three
			Outline = { event = "BufWinLeave", text = "symbols-outline", align = "right" },
		},
		maximum_length = 25, -- Sets the maximum buffer name length.
	},
	version = "^1.0.0", -- optional: only update when a new 1.x version is released
}
