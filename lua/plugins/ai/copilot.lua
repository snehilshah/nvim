return {
	"zbirenbaum/copilot.lua",
	cmd = "Copilot",
	event = "InsertEnter",
	enabled = true,
	dependencies = {
		"copilotlsp-nvim/copilot-lsp",
	},
	opts = {
		panel = {
			enabled = false, -- disable panel when using blink-copilot
			auto_refresh = false,
			keymap = {
				jump_prev = false,
				jump_next = false,
				accept = false,
				refresh = false,
				open = false,
			},
			layout = {
				position = "bottom", -- | top | left | right | bottom |
				ratio = 0.4,
			},
		},
		suggestion = {
			enabled = false, -- MUST be false when using blink-copilot
			auto_trigger = true,
			hide_during_completion = true,
			debounce = 75,
			trigger_on_accept = true,
			keymap = {
				accept = false,
				accept_word = false,
				accept_line = false,
				next = false,
				prev = false,
				dismiss = false,
			},
		},
		nes = {
			enabled = true, -- requires copilot-lsp as a dependency
			auto_trigger = true,
			keymap = {
				accept_and_goto = "<Tab>",
				accept = "<CR>",
				dismiss = "<M-l>",
			},
		},
		logger = {
			file = vim.fn.stdpath("log") .. "/copilot-lua.log",
			file_log_level = vim.log.levels.OFF,
			print_log_level = vim.log.levels.WARN,
			trace_lsp = "off", -- "off" | "messages" | "verbose"
			trace_lsp_progress = false,
			log_lsp_messages = false,
		},
		copilot_node_command = "node", -- Node.js version must be > 22
		workspace_folders = {},
		copilot_model = "", -- at the time of configuring there was only 1 model available, in future can check `github.copilot.selectedCompletionModel`
		disable_limit_reached_message = false, -- Set to `true` to suppress completion limit reached popup
		root_dir = function()
			return vim.fs.dirname(vim.fs.find(".git", { upward = true })[1])
		end,
		should_attach = function(_, _)
			if not vim.bo.buflisted then
				-- logger.debug("not attaching, buffer is not 'buflisted'")
				return false
			end

			if vim.bo.buftype ~= "" then
				-- logger.debug("not attaching, buffer 'buftype' is " .. vim.bo.buftype)
				return false
			end

			return true
		end,
		server = {
			type = "nodejs", -- "nodejs" | "binary"
			custom_server_filepath = nil,
		},
		server_opts_overrides = {},
		filetypes = {
			["*"] = true,
		},
	},
}
