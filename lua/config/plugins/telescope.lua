return {
	'nvim-telescope/telescope.nvim',
	tag = '0.1.8',
	dependencies = {
		'nvim-lua/plenary.nvim',
		{ 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' }
	},
	config = function()
		local builtin = require('telescope.builtin')
		require('telescope').setup {
			defaults = require('telescope.themes').get_ivy(),
			extensions = {
				fzf = {}
			}
		}

		require('telescope').load_extension('fzf')

		-- GIT
		vim.keymap.set("n", "<space>gc", builtin.git_commits)
		vim.keymap.set("n", "<space>gb", builtin.git_branches)
		vim.keymap.set("n", "<space>gss", builtin.git_status)
		vim.keymap.set("n", "<space>gst", builtin.git_stash)
		-- FILES
		vim.keymap.set("n", "<space>ff", builtin.live_grep)
		vim.keymap.set("n", "<space>fd", builtin.find_files)
		-- VIM
		vim.keymap.set("n", "<space>fh", builtin.help_tags)
		vim.keymap.set("n", "<space>jp", builtin.jumplist)
		vim.keymap.set("n", "<space>en", function()
			builtin.find_files {
				cwd = vim.fn.stdpath("config")
			}
		end)
		-- N7
		vim.keymap.set("n", "<space>nda", function()
			builtin.find_files {
				cwd = '/home/srshah/projects/nitro-api'
			}
		end)
		vim.keymap.set("n", "<space>npw", function()
			builtin.find_files {
				cwd = '/home/srshah/projects/sera-worker'
			}
		end)
	end
}
