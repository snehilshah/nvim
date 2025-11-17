return {
	{
		"rachartier/tiny-inline-diagnostic.nvim",
		event = "VeryLazy",
		priority = 1000,
		opts = {
			-- Style preset for diagnostic messages
			-- Available options:
			-- "modern", "classic", "minimal", "powerline",
			-- "ghost", "simple", "nonerdfont", "amongus"
			preset = "powerline",

			transparent_bg = false, -- Set the background of the diagnostic to transparent
			transparent_cursorline = true, -- Set the background of the cursorline to transparent (only one the first diagnostic)

			hi = {
				error = "DiagnosticError", -- Highlight group for error messages
				warn = "DiagnosticWarn", -- Highlight group for warning messages
				info = "DiagnosticInfo", -- Highlight group for informational messages
				hint = "DiagnosticHint", -- Highlight group for hint or suggestion messages
				arrow = "NonText", -- Highlight group for diagnostic arrows
				background = "CursorLine",
				mixing_color = "Normal",
			},

			options = {
				show_source = {
					enabled = true,
					if_many = true,
				},
				use_icons_from_diagnostic = false,
				set_arrow_to_diag_color = true,
				add_messages = {
					messages = true, -- Show full diagnostic messages
					display_count = false, -- Show diagnostic count instead of messages when cursor not on line
					use_max_severity = false, -- When counting, only show the most severe diagnostic
					show_multiple_glyphs = true, -- Show multiple icons for multiple diagnostics of same severity
				},
				throttle = 100,
				softwrap = 30,
				multilines = {
					enabled = false, -- Enable support for multiline diagnostic messages
					always_show = false, -- Always show messages on all lines of multiline diagnostics
					trim_whitespaces = false, -- Remove leading/trailing whitespace from each line
					tabstop = 4, -- Number of spaces per tab when expanding tabs
					severity = nil, -- Filter multiline diagnostics by severity (e.g., { vim.diagnostic.severity.ERROR })
				},
				show_all_diags_on_cursorline = true,
				show_related = {
					enabled = true, -- Enable displaying related diagnostics
					max_count = 3, -- Maximum number of related diagnostics to show per diagnostic
				},
				enable_on_insert = false,
				enable_on_select = false,

				overflow = {
					mode = "wrap",
					padding = 0,
				},

				break_line = {
					enabled = false,
					after = 30,
				},

				format = nil,

				virt_texts = {
					priority = 2048,
				},

				-- Filter diagnostics by severity
				-- Available severities:
				-- vim.diagnostic.severity.ERROR
				-- vim.diagnostic.severity.WARN
				-- vim.diagnostic.severity.INFO
				-- vim.diagnostic.severity.HINT
				severity = {
					vim.diagnostic.severity.ERROR,
					vim.diagnostic.severity.WARN,
					vim.diagnostic.severity.INFO,
					vim.diagnostic.severity.HINT,
				},

				overwrite_events = nil, -- You should not change this unless the plugin does not work with your configuration
				override_open_float = false,
			},
			disabled_ft = {}, -- List of filetypes to disable the plugin
		},
	},
}
