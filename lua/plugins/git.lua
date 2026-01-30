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
      numhl = true,
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
        delay = 400,
        ignore_whitespace = false,
      },
      current_line_blame_formatter = function(name, blame_info, opts)
        if blame_info.author == "Not Committed Yet" then
          return { { " Not committed yet", "GitSignsCurrentLineBlame" } }
        end
        -- Replace your name with "You"
        local author = blame_info.author
        local git_user = vim.fn.system("git config user.name"):gsub("\n", "")
        if author == git_user then
          author = "You"
        end
        local date = os.date("%d %b %Y, %H:%M", tonumber(blame_info.author_time))
        local text = string.format(" %s, %s - %s", author, blame_info.summary, date)
        return { { text, "GitSignsCurrentLineBlame" } }
      end,
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
        "[g",
        function()
          require("gitsigns").nav_hunk("prev", { wrap = true, target = "all" })
        end,
        desc = "<- hunk",
      },
      {
        "]g",
        function()
          require("gitsigns").nav_hunk("next", { wrap = true, target = "all" })
        end,
        desc = "-> Hunk",
      },
      {
        "<leader>gb",
        function()
          require("gitsigns").blame_line()
        end,
        desc = "[g]it [b]lame line",
      },
      {
        "<leader>gB",
        function()
          require("gitsigns").blame()
        end,
        desc = "[g]it [B]lame buffer",
      },
      {
        "<leader>GB",
        function()
          require("gitsigns").toggle_current_line_blame()
        end,
        desc = "[B]lame mode",
      },
      {
        "<leader>gP",
        function()
          require("gitsigns").preview_hunk()
        end,
        desc = "[g]it [P]review Hunk",
      },
      {
        "<leader>gp",
        function()
          require("gitsigns").preview_hunk_inline()
        end,
        desc = "[g]it [p]review Hunk (Inline)",
      },
      {
        "<leader>gr",
        function()
          require("gitsigns").reset_hunk()
        end,
        desc = "[g]it [r]eset Hunk",
      },
      {
        "<leader>gR",
        function()
          require("gitsigns").reset_buffer()
        end,
        desc = "[g]it [R]eset Buffer",
      },
      {
        "<leader>ga",
        function()
          require("gitsigns").stage_hunk()
        end,
        desc = "[g]it [a]dd Hunk",
      },
      {
        "<leader>gu",
        function()
          require("gitsigns").undo_stage_hunk()
        end,
        desc = "[g]it [u]ndo Stage Hunk",
      },
      {
        "<leader>gS",
        function()
          Snacks.picker.git_stash()
        end,
        desc = "[S]tash (Snacks)",
      },
      {
        "<leader>gD",
        function()
          vim.cmd("Gitsigns diffthis HEAD")
        end,
        desc = "[d]iff HEAD",
      },
      {
        "<leader>gA",
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
    cmd = {
      "DiffviewOpen",
      "DiffviewClose",
      "DiffviewToggleFiles",
      "DiffviewFocusFiles",
      "DiffviewFileHistory",
    },
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
            {
              "n",
              "<tab>",
              actions.toggle_stage_entry,
              { desc = "Open the diff for the current file" },
            },
            { "n", "<cr>", actions.goto_file_edit, { desc = "go to edit the file" } },
          },
        },
      })
    end,
    keys = {
      {
        "<leader>dv",
        ":DiffviewOpen<CR>",
        desc = "[v]iew",
      },
      {
        "<leader>dc",
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
      "folke/snacks.nvim",
    },
    cmd = "Neogit",
    keys = {
      {
        "<leader>gn",
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
        snacks = true,
      },
      graph_style = vim.g.neovide and "unicode" or "kitty",
      process_spinner = true,
    },
  },
  {
    "XXiaoA/atone.nvim",
    cmd = "Atone",
    opts = {},
  },
}
