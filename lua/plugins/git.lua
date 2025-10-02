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
		opts = {
			diff_binaries = false,
			enhanced_diff_hl = false,
			git = {
				max_files = 300,
			},
			file_panel = {
				listing_style = "tree",
				tree_options = {
					flatten_dirs = true,
					folder_statuses = "only_folded",
				},
				win_config = {
					position = "left",
					width = 35,
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
			commit_log_panel = {
				win_config = {
					position = "bottom",
					height = 16,
				},
			},
			default_args = {
				DiffviewOpen = {},
				DiffviewFileHistory = {},
			},
			hooks = {},
			keymaps = {
				disable_defaults = false,
				view = {
					{ "n", "<tab>",      function() require("diffview.actions").select_next_entry() end, { desc = "Next file" } },
					{ "n", "<s-tab>",    function() require("diffview.actions").select_prev_entry() end, { desc = "Previous file" } },
					{ "n", "gf",         function() require("diffview.actions").goto_file() end,         { desc = "Go to file" } },
					{ "n", "<C-w><C-f>", function() require("diffview.actions").goto_file_split() end,   { desc = "Go to file in split" } },
					{ "n", "<C-w>gf",    function() require("diffview.actions").goto_file_tab() end,     { desc = "Go to file in tab" } },
					{ "n", "<leader>b",  function() require("diffview.actions").toggle_files() end,      { desc = "Toggle files panel" } },
					{ "n", "g<C-x>",     function() require("diffview.actions").cycle_layout() end,      { desc = "Cycle layout" } },
					{ "n", "[x",         function() require("diffview.actions").prev_conflict() end,     { desc = "Previous conflict" } },
					{ "n", "]x",         function() require("diffview.actions").next_conflict() end,     { desc = "Next conflict" } },
					{ "n", "g?",         function() require("diffview.actions").help("view") end,        { desc = "Show help" } },
				},
				diff1 = {
					-- Mappings in single commit diff
					{ "n", "g?", function() require("diffview.actions").help("view") end, { desc = "Show help" } },
				},
				diff2 = {
					{ "n", "g?", function() require("diffview.actions").help("view") end, { desc = "Show help" } },
				},
				diff3 = {
					-- Mappings in 3-way diffs (during merge conflicts)
					{ { "n", "x" }, "2do", function() require("diffview.actions").diffget("ours") end,   { desc = "Get from OURS" } },
					{ { "n", "x" }, "3do", function() require("diffview.actions").diffget("theirs") end, { desc = "Get from THEIRS" } },
					{ "n",          "g?",  function() require("diffview.actions").help("diff3") end,      { desc = "Show help" } },
				},
				diff4 = {
					{ { "n", "x" }, "1do", function() require("diffview.actions").diffget("base") end,   { desc = "Get from BASE" } },
					{ { "n", "x" }, "2do", function() require("diffview.actions").diffget("ours") end,   { desc = "Get from OURS" } },
					{ { "n", "x" }, "3do", function() require("diffview.actions").diffget("theirs") end, { desc = "Get from THEIRS" } },
					{ "n",          "g?",  function() require("diffview.actions").help("diff4") end,      { desc = "Show help" } },
				},
				file_panel = {
					-- File panel specific mappings
					{ "n", "j",             function() require("diffview.actions").next_entry() end,          { desc = "Next entry" } },
					{ "n", "<down>",        function() require("diffview.actions").next_entry() end,          { desc = "Next entry" } },
					{ "n", "k",             function() require("diffview.actions").prev_entry() end,          { desc = "Previous entry" } },
					{ "n", "<up>",          function() require("diffview.actions").prev_entry() end,          { desc = "Previous entry" } },
					{ "n", "<cr>",          function() require("diffview.actions").select_entry() end,        { desc = "Select entry" } },
					{ "n", "o",             function() require("diffview.actions").select_entry() end,        { desc = "Select entry" } },
					{ "n", "<2-LeftMouse>", function() require("diffview.actions").select_entry() end,        { desc = "Select entry" } },
					{ "n", "-",             function() require("diffview.actions").toggle_stage_entry() end,  { desc = "Stage/unstage entry" } },
					{ "n", "S",             function() require("diffview.actions").stage_all() end,           { desc = "Stage all" } },
					{ "n", "U",             function() require("diffview.actions").unstage_all() end,         { desc = "Unstage all" } },
					{ "n", "X",             function() require("diffview.actions").restore_entry() end,       { desc = "Restore entry" } },
					{ "n", "L",             function() require("diffview.actions").open_commit_log() end,     { desc = "Open commit log" } },
					{ "n", "zo",            function() require("diffview.actions").open_fold() end,           { desc = "Expand fold" } },
					{ "n", "zc",            function() require("diffview.actions").close_fold() end,          { desc = "Collapse fold" } },
					{ "n", "za",            function() require("diffview.actions").toggle_fold() end,         { desc = "Toggle fold" } },
					{ "n", "zR",            function() require("diffview.actions").open_all_folds() end,      { desc = "Expand all folds" } },
					{ "n", "zM",            function() require("diffview.actions").close_all_folds() end,     { desc = "Collapse all folds" } },
					{ "n", "<c-b>",         function() require("diffview.actions").scroll_view(-0.25) end,    { desc = "Scroll up" } },
					{ "n", "<c-f>",         function() require("diffview.actions").scroll_view(0.25) end,     { desc = "Scroll down" } },
					{ "n", "<tab>",         function() require("diffview.actions").select_next_entry() end,   { desc = "Next file" } },
					{ "n", "<s-tab>",       function() require("diffview.actions").select_prev_entry() end,   { desc = "Previous file" } },
					{ "n", "gf",            function() require("diffview.actions").goto_file() end,           { desc = "Go to file" } },
					{ "n", "<C-w><C-f>",    function() require("diffview.actions").goto_file_split() end,     { desc = "Go to file in split" } },
					{ "n", "<C-w>gf",       function() require("diffview.actions").goto_file_tab() end,       { desc = "Go to file in tab" } },
					{ "n", "i",             function() require("diffview.actions").listing_style() end,       { desc = "Toggle listing style" } },
					{ "n", "f",             function() require("diffview.actions").toggle_flatten_dirs() end, { desc = "Toggle flatten dirs" } },
					{ "n", "R",             function() require("diffview.actions").refresh_files() end,       { desc = "Refresh files" } },
					{ "n", "<leader>e",     function() require("diffview.actions").focus_files() end,         { desc = "Focus files panel" } },
					{ "n", "<leader>b",     function() require("diffview.actions").toggle_files() end,        { desc = "Toggle files panel" } },
					{ "n", "g<C-x>",        function() require("diffview.actions").cycle_layout() end,        { desc = "Cycle layout" } },
					{ "n", "g?",            function() require("diffview.actions").help("file_panel") end,    { desc = "Show help" } },
				},
				file_history_panel = {
					{ "n", "g!",            function() require("diffview.actions").options() end,                  { desc = "Open options" } },
					{ "n", "<C-A-d>",       function() require("diffview.actions").open_in_diffview() end,         { desc = "Open in diffview" } },
					{ "n", "y",             function() require("diffview.actions").copy_hash() end,                { desc = "Copy commit hash" } },
					{ "n", "L",             function() require("diffview.actions").open_commit_log() end,          { desc = "Open commit log" } },
					{ "n", "zR",            function() require("diffview.actions").open_all_folds() end,           { desc = "Expand all folds" } },
					{ "n", "zM",            function() require("diffview.actions").close_all_folds() end,          { desc = "Collapse all folds" } },
					{ "n", "j",             function() require("diffview.actions").next_entry() end,               { desc = "Next entry" } },
					{ "n", "<down>",        function() require("diffview.actions").next_entry() end,               { desc = "Next entry" } },
					{ "n", "k",             function() require("diffview.actions").prev_entry() end,               { desc = "Previous entry" } },
					{ "n", "<up>",          function() require("diffview.actions").prev_entry() end,               { desc = "Previous entry" } },
					{ "n", "<cr>",          function() require("diffview.actions").select_entry() end,             { desc = "Select entry" } },
					{ "n", "o",             function() require("diffview.actions").select_entry() end,             { desc = "Select entry" } },
					{ "n", "<2-LeftMouse>", function() require("diffview.actions").select_entry() end,             { desc = "Select entry" } },
					{ "n", "<c-b>",         function() require("diffview.actions").scroll_view(-0.25) end,         { desc = "Scroll up" } },
					{ "n", "<c-f>",         function() require("diffview.actions").scroll_view(0.25) end,          { desc = "Scroll down" } },
					{ "n", "<tab>",         function() require("diffview.actions").select_next_entry() end,        { desc = "Next file" } },
					{ "n", "<s-tab>",       function() require("diffview.actions").select_prev_entry() end,        { desc = "Previous file" } },
					{ "n", "gf",            function() require("diffview.actions").goto_file() end,                { desc = "Go to file" } },
					{ "n", "<C-w><C-f>",    function() require("diffview.actions").goto_file_split() end,          { desc = "Go to file in split" } },
					{ "n", "<C-w>gf",       function() require("diffview.actions").goto_file_tab() end,            { desc = "Go to file in tab" } },
					{ "n", "<leader>e",     function() require("diffview.actions").focus_files() end,              { desc = "Focus files panel" } },
					{ "n", "<leader>b",     function() require("diffview.actions").toggle_files() end,             { desc = "Toggle files panel" } },
					{ "n", "g<C-x>",        function() require("diffview.actions").cycle_layout() end,             { desc = "Cycle layout" } },
					{ "n", "g?",            function() require("diffview.actions").help("file_history_panel") end, { desc = "Show help" } },
				},
				option_panel = {
					{ "n", "<tab>", function() require("diffview.actions").select() end,             { desc = "Select" } },
					{ "n", "q",     function() require("diffview.actions").close() end,              { desc = "Close" } },
					{ "n", "g?",    function() require("diffview.actions").help("option_panel") end, { desc = "Show help" } },
				},
			},
		},
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
			{
				"<leader>Gc",
				":DiffviewOpen --imply-local<CR>",
				desc = "Open merge conflicts",
			},
		},
	},
	"tpope/vim-fugitive",
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
