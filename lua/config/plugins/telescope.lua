return {
  'nvim-telescope/telescope.nvim',
  event = "VimEnter",
  tag = '0.1.8',
  dependencies = {
    'nvim-lua/plenary.nvim',
    { 'nvim-telescope/telescope-ui-select.nvim' },
    { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' }
  },
  config = function()
    local builtin = require('telescope.builtin')
    require('telescope').setup {
      defaults = require('telescope.themes').get_ivy(),
      extensions = {
        fzf = {},
        ['ui-select'] = {
          require('telescope.themes').get_dropdown(),
        },
      }
    }

    require('telescope').load_extension('fzf')
    require('telescope').load_extension('ui-select')

    vim.keymap.set("n", "<space>sh", builtin.help_tags)
    vim.keymap.set("n", "<space>sk", builtin.keymaps)
    -- GIT
    vim.keymap.set("n", "<space>gc", builtin.git_commits)
    vim.keymap.set("n", "<space>gb", builtin.git_branches)
    vim.keymap.set("n", "<space>gss", builtin.git_status)
    vim.keymap.set("n", "<space>gst", builtin.git_stash)
    -- FILES
    vim.keymap.set("n", "<space>ff", builtin.live_grep)
    vim.keymap.set("n", "<space>fd", builtin.find_files)
    vim.keymap.set('n', '<leader>sw', builtin.grep_string, { desc = '[S]earch current [W]ord' })
    vim.keymap.set('n', '<leader>sd', builtin.diagnostics, { desc = '[S]earch [D]iagnostics' })
    vim.keymap.set('n', '<leader><leader>p', builtin.buffers, { desc = '[ ] Find existing buffers' })
    vim.keymap.set('n', '<leader>s/', function()
      builtin.live_grep {
        grep_open_files = true,
        prompt_title = 'Live Grep in Open Files',
      }
    end, { desc = '[S]earch [/] in Open Files' })
    vim.keymap.set('n', '<leader>/', function()
      -- You can pass additional configuration to Telescope to change the theme, layout, etc.
      builtin.current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
        winblend = 10,
        previewer = false,
      })
    end, { desc = '[/] Fuzzily search in current buffer' })

    -- VIM
    -- vim.keymap.set("n", "<space>ss", builtin.builtin)
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
