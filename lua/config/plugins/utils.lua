return {
	{ -- Add indentation guides even on blank lines
		"lukas-reineke/indent-blankline.nvim",
		-- Enable `lukas-reineke/indent-blankline.nvim`
		-- See `:help ibl`
		main = "ibl",
		opts = {},
	},
	{
		"windwp/nvim-autopairs",
		event = "InsertEnter",
		opts = {},
	},
	{
		"folke/which-key.nvim",
		event = "VeryLazy",
		opts = {
			-- your configuration comes here
			-- or leave it empty to use the default settings
			-- refer to the configuration section below
		},
		keys = {
			{
				"<leader>?",
				function()
					require("which-key").show({ global = false })
				end,
				desc = "Buffer Local Keymaps (which-key)",
			},
		},
	},
	{
		"tpope/vim-sleuth",
		-- no further changes required here as this is a actual vim-script plugin not a lua plugin
	},
	{
		"tpope/vim-surround",
	},
	{
		"tpope/vim-fugitive",
	},
	{
		"vim-scripts/ReplaceWithRegister",
	},
	{
		"bkad/CamelCaseMotion",
	},
	{
		"AckslD/nvim-neoclip.lua",
		dependencies = {
			{ "nvim-telescope/telescope.nvim" },
			{ "ibhagwan/fzf-lua" },
		},
		config = function()
			require("neoclip").setup({
				history = 1000,
				enable_persistent_history = false,
				length_limit = 1048576,
				continuous_sync = false,
				db_path = vim.fn.stdpath("data") .. "/databases/neoclip.sqlite3",
				filter = nil,
				preview = true,
				prompt = nil,
				default_register = '"',
				default_register_macros = "q",
				enable_macro_history = true,
				content_spec_column = false,
				disable_keycodes_parsing = false,
				dedent_picker_display = false,
				initial_mode = "insert",
				on_select = {
					move_to_front = false,
					close_telescope = true,
				},
				on_paste = {
					set_reg = false,
					move_to_front = false,
					close_telescope = true,
				},
				on_replay = {
					set_reg = false,
					move_to_front = false,
					close_telescope = true,
				},
				on_custom_action = {
					close_telescope = true,
				},
				keys = {
					telescope = {
						i = {
							select = "<cr>",
							paste = "<c-p>",
							paste_behind = "<c-k>",
							replay = "<c-q>", -- replay a macro
							delete = "<c-d>", -- delete an entry
							edit = "<c-e>", -- edit an entry
							custom = {},
						},
						n = {
							select = "<cr>",
							paste = "p",
							--- It is possible to map to more than one key.
							-- paste = { 'p', '<c-p>' },
							paste_behind = "P",
							replay = "q",
							delete = "d",
							edit = "e",
							custom = {},
						},
					},
					fzf = {
						select = "default",
						paste = "ctrl-p",
						paste_behind = "ctrl-k",
						custom = {},
					},
				},
			})
		end,
	},
	{
		"wurli/visimatch.nvim",
		opts = {
			hl_group = "Search",
			chars_lower_limit = 3,
			lines_upper_limit = 30,
			strict_spacing = false,
			-- Visible buffers which should be highlighted. Valid options:
			-- * `"filetype"` (the default): highlight buffers with the same filetype
			-- * `"current"`: highlight matches in the current buffer only
			-- * `"all"`: highlight matches in all visible buffers
			-- * A function. This will be passed a buffer number and should return
			--   `true`/`false` to indicate whether the buffer should be highlighted.
			buffers = "filetype",
			-- Case-(in)nsitivity for matches. Valid options:
			-- * `true`: matches will never be case-sensitive
			-- * `false`/`{}`: matches will always be case-sensitive
			-- * a table of filetypes to use use case-insensitive matching for.
			case_insensitive = { "markdown", "text", "help" },
		},
	},
	{
		"kevinhwang91/nvim-hlslens",
		branch = "main",
		keys = { "*", "n", "N" },
		config = function()
			local api = vim.api
			local keymap = vim.keymap
			local hlslens = require("hlslens")

			hlslens.setup({
				calm_down = true,
				nearest_only = true,
			})

			local activate_hlslens = function(direction)
				local cmd = string.format("normal! %s%szzzv", vim.v.count1, direction)
				local status, msg = pcall(vim.cmd, cmd)

				if not status then
					local start_idx, _ = string.find(msg, "E486", 1, true)
					if start_idx then
						local msg_part = string.sub(msg, start_idx)
						api.nvim_echo({ { msg_part } }, true, { err = true })
					else
						api.nvim_echo({ { msg } }, true, { err = true })
					end
					return
				end

				hlslens.start()
			end

			keymap.set("n", "n", function()
				activate_hlslens("n")
			end)
			keymap.set("n", "N", function()
				activate_hlslens("N")
			end)

			local check_cursor_word = function()
				local cursor_word = vim.fn.expand("<cword>")
				local result = cursor_word == ""
				if result then
					local msg = "E348: No string under cursor"
					api.nvim_echo({ { msg } }, true, { err = true })
				end

				return result, cursor_word
			end

			keymap.set("n", "*", function()
				local cursor_word_empty, cursor_word = check_cursor_word()
				if cursor_word_empty then
					return
				end

				local cmd = string.format([[normal! /\v<%s>]], cursor_word)

				-- In order to say that we are pressing Enter key, instead of typing literally the character,
				-- we need to replace special notation with their internal representation.
				local escaped_enter = vim.api.nvim_replace_termcodes("<CR>", true, false, true)

				-- character `N` is used to keep the cursor when pressing `*`
				local full_cmd = cmd .. escaped_enter .. "N"
				vim.fn.execute(full_cmd)
				hlslens.start()
			end)
			keymap.set("n", "#", function()
				local cursor_word_empty, cursor_word = check_cursor_word()
				if cursor_word_empty then
					return
				end

				local cmd = string.format([[normal! ?\v<%s>]], cursor_word)
				local escaped_enter = vim.api.nvim_replace_termcodes("<CR>", true, false, true)

				local full_cmd = cmd .. escaped_enter .. "N"
				vim.fn.execute(full_cmd)
				hlslens.start()
			end)
		end,
	},
	{
		"TobinPalmer/rayso.nvim",
		config = function()
			require("rayso").setup({
				open_cmd = "zen",
				options = {
					logging_path = "", -- Notices the trailing slash
					logging_file = "",
					logging_enabled = false,
					theme = "midnight",
				},
			})
			vim.keymap.set("v", "<leader>rs", require("lib.create").create_snippet)
		end,
	},
}
