return {
	{
		"lewis6991/gitsigns.nvim",
		lazy = true,
		event = { "BufReadPre", "BufNewFile" },
		opts = {
			signs = {
				add = { text = "┃" },
				change = { text = "┃" },
				delete = { text = "_" },
				topdelete = { text = "‾" },
				changedelete = { text = "~" },
				untracked = { text = "┆" },
			},
			signs_staged = {
				add = { text = "┃" },
				change = { text = "┃" },
				delete = { text = "_" },
				topdelete = { text = "‾" },
				changedelete = { text = "~" },
				untracked = { text = "┆" },
			},
			signs_staged_enable = true,
			signcolumn = true,
			numhl = false,
			linehl = false,
			word_diff = false,
			watch_gitdir = {
				interval = 1000,
				follow_files = true,
			},
			attach_to_untracked = true,
			current_line_blame = false, -- Toggle with `:Gitsigns toggle_current_line_blame`
			current_line_blame_opts = {
				virt_text = true,
				virt_text_pos = "eol", -- 'eol' | 'overlay' | 'right_align'
				delay = 1000,
				ignore_whitespace = false,
			},
			current_line_blame_formatter = "<author>, <author_time:%Y-%m-%d> - <summary>",
			sign_priority = 6,
			status_formatter = nil,
			update_debounce = 200,
			max_file_length = 40000,
			preview_config = {
				border = "rounded",
				style = "minimal",
				relative = "cursor",
				row = 0,
				col = 1,
			},
			-- yadm = { enable = false },
		},
		keys = {
			{
				"<leader>Gk",
				function()
					require("gitsigns").prev_hunk({ navigation_message = false })
				end,
				desc = "[k] Prev Hunk",
			},
			{
				"<leader>Gj",
				function()
					require("gitsigns").next_hunk({ navigation_message = false })
				end,
				desc = "[j] Next Hunk",
			},
			{
				"<leader>Gb",
				function()
					require("gitsigns").blame_line()
				end,
				desc = "[b]lame",
			},
			{
				"<leader>Gp",
				function()
					require("gitsigns").preview_hunk()
				end,
				desc = "[p]review Hunk",
			},
			{
				"<leader>GP",
				function()
					require("gitsigns").preview_hunk_inline()
				end,
				desc = "[P]review Hunk (Inline)",
			},
			{
				"<leader>Gr",
				function()
					require("gitsigns").reset_hunk()
				end,
				desc = "[r]eset Hunk",
			},
			{
				"<leader>GR",
				function()
					require("gitsigns").reset_buffer()
				end,
				desc = "[R]eset Buffer",
			},

			{
				"<leader>Gs",
				function()
					require("gitsigns").stage_hunk()
				end,
				desc = "[s]tage Hunk",
			},
			{
				"<leader>Gu",
				function()
					require("gitsigns").undo_stage_hunk()
				end,
				desc = "[u]ndo Stage Hunk",
			},
			{
				"<leader>gs",
				function()
					Snacks.picker.git_status()
				end,
				desc = "[s]tatus (Snacks)",
			},
			{
				"<leader>gd",
				function()
					Snacks.picker.git_diff()
				end,
				desc = "[d]iff Hunks (Snacks)",
			},
			{
				"<leader>gS",
				function()
					Snacks.picker.git_stash()
				end,
				desc = "[S]tash (Snacks)",
			},
			{
				"<leader>Gd",
				function()
					vim.cmd("Gitsigns diffthis HEAD")
				end,
				desc = "[d]iff HEAD",
			},
			{
				"<leader>GB",
				function()
					require("gitsigns").toggle_current_line_blame()
				end,
				desc = "[B]lame mode",
			},
			{
				"<leader>GS",
				function()
					require("gitsigns").stage_buffer()
				end,
				desc = "[S]tage Buffer",
			},
		},
	},
	{
		"sindrets/diffview.nvim",
		event = "VeryLazy",
		cmd = { "DiffviewOpen", "DiffviewClose", "DiffviewToggleFiles", "DiffviewFocusFiles", "DiffviewFileHistory" },
		config = function()
			local actions = require("diffview.actions")
			require("diffview").setup({
				enhanced_diff_hl = true,
				file_panel = {
					listing_style = "tree",
					tree_options = {
						flatten_dirs = false,
					},
				},
				file_history_panel = {
					log_options = {
						git = {
							single_file = {
								diff_merges = "combined",
							},
							multi_file = {
								diff_merges = "first-parent",
							},
						},
					},
					win_config = {
						position = "bottom",
						height = 16,
					},
				},
				keymaps = {
					file_panel = {
						{ "n", "<tab>", actions.toggle_stage_entry, { desc = "Open the diff for the current file" } },
						{ "n", "<cr>",  actions.goto_file_edit,     { desc = "go to edit the file" } },
					},
				},
			})
		end,
		keys = {
			{
				"<leader>Dv",
				":DiffviewOpen<CR>",
				desc = "[v]iew",
			},
			{
				"<leader>Dc",
				":DiffviewClose<CR>",
				desc = "[c]lose",
			},
			{
				"<leader>Df",
				":DiffviewFileHistory<CR>",
				desc = "[f]ile History (all files)",
			},
			{
				"<leader>D.",
				":DiffviewFileHistory %<CR>",
				desc = "[.] Current File History (current file)",
			},
			{
				"<leader>DF",
				":DiffviewToggleFiles<CR>",
				desc = "[F]iles Panel Toggle Diffview",
			},
			{
				"<leader>Gm",
				":DiffviewOpen origin/main...HEAD<CR>",
				desc = "Compare with origin/main",
			},
			{
				"<leader>GM",
				function()
					local branch = vim.fn.input("Compare with branch: ", "origin/")
					if branch ~= "" and branch ~= "origin/" then
						vim.cmd("DiffviewOpen " .. branch .. "...HEAD")
					end
				end,
				desc = "Compare with specific branch",
			},
		},
	},
	{
		"NeogitOrg/neogit",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"sindrets/diffview.nvim",
			"nvim-telescope/telescope.nvim",
		},
		cmd = "Neogit",
		keys = {
			{
				"<leader>gg",
				"<cmd>Neogit<cr>",
				desc = "Neogit",
			},
			{
				"<leader>gc",
				"<cmd>Neogit commit<cr>",
				desc = "[c]ommit",
			},
		},
		opts = {
			integrations = {
				diffview = true,
			},
		},
	},
	{
		"mbbill/undotree",
		keys = {
			{
				"<leader>GU",
				":UndotreeToggle<CR>",
				desc = "Toggle UndoTree",
			},
		},
	},
}
