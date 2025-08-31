local function focus_preview(prompt_bufnr)
  local action_state = require("telescope.actions.state")
  local picker = action_state.get_current_picker(prompt_bufnr)
  local prompt_win = picker.prompt_win
  local previewer = picker.previewer
  local bufnr = previewer.state.bufnr or previewer.state.termopen_bufnr
  local winid = previewer.state.winid or vim.fn.win_findbuf(bufnr)[1]
  vim.keymap.set("n", "<Tab>", function()
    vim.cmd(string.format("noautocmd lua vim.api.nvim_set_current_win(%s)", prompt_win))
  end, { buffer = bufnr })
  vim.cmd(string.format("noautocmd lua vim.api.nvim_set_current_win(%s)", winid))
end

return {
  'nvim-telescope/telescope.nvim',
  event = "VimEnter",
  enabled = false,
  tag = '0.1.8',
  dependencies = {
    'nvim-lua/plenary.nvim',
    { 'nvim-telescope/telescope-ui-select.nvim' },
    { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' }
  },
  config = function()
    local builtin = require('telescope.builtin')
    require('telescope').setup {
      defaults = {
        require('telescope.themes').get_ivy(),

        mappings = {
          n = {
            ["<S-Tab>"] = focus_preview,
          },
        }
      },
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
    vim.keymap.set("n", "<space>fq", builtin.live_grep)
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
    -- greps
    -- vim.keymap.set("n", "<leader>fw", builtin.grep_cword(), { desc = "[F]ind current [W]ord" })
    vim.keymap.set("n", "<leader>fr", builtin.resume, { desc = "[F]ind [R]esume" })
    vim.keymap.set("n", "<leader>fo", builtin.oldfiles, { desc = "[F]ind [O]ld Files" })
    vim.keymap.set("n", "<leader><leader><leader>", builtin.buffers, { desc = "[␣][␣] Find existing buffers" })


    -- VIM
    -- vim.keymap.set("n", "<space>ss", builtin.builtin)
    vim.keymap.set("n", "<space>jp", builtin.jumplist)
    vim.keymap.set("n", "<leader>fk", builtin.keymaps, { desc = "[F]ind [K]eymaps" })
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
