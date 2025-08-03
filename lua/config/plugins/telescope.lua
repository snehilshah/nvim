return {
	'nvim-telescope/telescope.nvim',
	tag = '0.1.8',
	dependencies = {
		'nvim-lua/plenary.nvim',
		{ 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' }
	},
	config = function()
		require('telescope').setup {
			defaults = require('telescope.themes').get_ivy(),
			extensions = {
				fzf = {}
			}
		}

		require('telescope').load_extension('fzf')

		-- GIT
		vim.keymap.set("n", "<space>gc", require('telescope.builtin').git_commits)
		vim.keymap.set("n", "<space>gb", require('telescope.builtin').git_branches)
		vim.keymap.set("n", "<space>gss", require('telescope.builtin').git_status)
		vim.keymap.set("n", "<space>gst", require('telescope.builtin').git_stash)
		-- FILES
		vim.keymap.set("n", "<space>ff", require('telescope.builtin').live_grep)
		vim.keymap.set("n", "<space>fd", require('telescope.builtin').find_files)
		-- VIM
		vim.keymap.set("n", "<space>fh", require('telescope.builtin').help_tags)
		vim.keymap.set("n", "<space>jp", require('telescope.builtin').jumplist)
		vim.keymap.set("n", "<space>en", function()
			require('telescope.builtin').find_files {
				cwd = vim.fn.stdpath("config")
			}
		end)
		-- N7
		vim.keymap.set("n", "<space>nda", function()
			require('telescope.builtin').find_files {
				cwd = '/home/srshah/projects/nitro-api'
			}
		end)
		vim.keymap.set("n", "<space>npw", function()
			require('telescope.builtin').find_files {
				cwd = '/home/srshah/projects/sera-worker'
			}
		end)
	end
}
