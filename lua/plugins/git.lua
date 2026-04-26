local icons         = require('icons')
local solid_bar     = icons.misc.vertical_bar
local dashed_bar    = icons.misc.dashed_bar
local delete_up     = icons.misc.top_score
local delete_down   = icons.misc.under_score
local change_gutter = icons.misc.change_gutter

return {
  {
    "lewis6991/gitsigns.nvim",
    event = { "BufReadPre", "BufNewFile" },
    opts = {
      signs = {
        add = { text = solid_bar },
        change = { text = solid_bar },
        delete = { text = delete_down },
        topdelete = { text = delete_up },
        changedelete = { text = change_gutter },
        untracked = { text = dashed_bar },
      },
      signs_staged = {
        add = { text = solid_bar },
        change = { text = solid_bar },
        delete = { text = delete_down },
        topdelete = { text = delete_up },
        changedelete = { text = change_gutter },
        untracked = { text = dashed_bar },
      },
      preview_config = {
        border = "rounded",
      },
      current_line_blame = false, -- Toggle with `:Gitsigns toggle_current_line_blame`
      signs_staged_enable = true, -- show the signs mentioned in signs_staged at the top of the config
      gh = true,
      signcolumn = true,
      numhl = true,
      linehl = false,
      word_diff = false,
      watch_gitdir = {
        interval = 1000,
        follow_files = true,
      },
      attach_to_untracked = true,
      current_line_blame_opts = {
        virt_text = true,
        virt_text_pos = "right_align", -- 'eol' | 'overlay' | 'right_align'
        delay = 400,
        ignore_whitespace = false,
      },
      current_line_blame_formatter = function(_, blame_info)
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
      -- Show who last modified the current line (popup with commit info)
      {
        "<leader>gb",
        function()
          require("gitsigns").blame_line()
        end,
        desc = "[g]it [b]lame line",
      },
      -- Show git blame annotations for every line in the buffer (full buffer blame view)
      {
        "<leader>gB",
        function()
          require("gitsigns").blame()
        end,
        desc = "[g]it [B]lame buffer",
      },
      -- Toggle persistent inline blame on every line (virtual text at end of each line)
      {
        "<leader>GB",
        function()
          require("gitsigns").toggle_current_line_blame()
        end,
        desc = "[B]lame mode",
      },
      -- Show hunk diff in a floating popup window
      {
        "<leader>gP",
        function()
          require("gitsigns").preview_hunk()
        end,
        desc = "[g]it [P]review Hunk",
      },
      -- Show hunk diff inline directly in the buffer (overlaid on the code)
      {
        "<leader>gp",
        function()
          require("gitsigns").preview_hunk_inline()
        end,
        desc = "[g]it [p]review Hunk (Inline)",
      },
      -- Discard changes in the current hunk (revert to index/staged version)
      {
        "<leader>gr",
        function()
          require("gitsigns").reset_hunk()
        end,
        desc = "[g]it [r]eset Hunk",
      },
      -- Discard ALL changes in the buffer (revert entire file to index/staged version)
      {
        "<leader>gR",
        function()
          require("gitsigns").reset_buffer()
        end,
        desc = "[g]it [R]eset Buffer",
      },
      -- Stage the current hunk (git add just this hunk)
      {
        "<leader>ga",
        function()
          require("gitsigns").stage_hunk()
        end,
        desc = "[g]it [a]dd Hunk",
      },
      -- Toggle stage state for the current hunk.
      -- On staged signs this unstages (replacement for deprecated undo_stage_hunk()).
      {
        "<leader>gu",
        function()
          require("gitsigns").stage_hunk()
        end,
        desc = "[g]it [u]nstage Hunk",
      },
      -- Open a vim split diff comparing the current buffer against HEAD (last commit)
      {
        "<leader>gD",
        function()
          vim.cmd("Gitsigns diffthis HEAD")
        end,
        desc = "[d]iff HEAD",
      },
      -- Stage all changes in the buffer (git add the entire file)
      {
        "<leader>gA",
        function()
          require("gitsigns").stage_buffer()
        end,
        desc = "[g]it Stage [A]ll (Buffer)",
      },
    },
  },
  {
    "esmuellert/codediff.nvim",
    cmd = "CodeDiff",
    opts = {
      diff = {
        compute_moves = true, -- show moved lines similar to vscode
      },
      explorer = {
        flatten_dirs = false,
      },
      keymaps = {
        view = {
          align_move = "gm", -- default
        },
      },
    },
    keys = {
      {
        "<leader>dd",
        "<cmd>CodeDiff<cr>",
        desc = "[d]iff (toggle)",
      },
      {
        "<leader>dh",
        "<cmd>CodeDiff history<cr>",
        desc = "[h]istory (all files)",
      },
      {
        "<leader>d.",
        "<cmd>CodeDiff history %<cr>",
        desc = "[.] Current file history",
      },
      {
        "<leader>df",
        "<cmd>CodeDiff file HEAD<cr>",
        desc = "[f]ile diff vs last commit",
      },
      -- PR-like merge-base diff: only changes introduced since branching from origin/main
      {
        "<leader>dm",
        "<cmd>CodeDiff origin/main...HEAD<cr>",
        desc = "[m]erge-base diff vs origin/main",
      },
      -- Compare HEAD against any branch you type (prompts for branch name)
      {
        "<leader>dM",
        function()
          local branch = vim.fn.input("Compare with branch: ", "origin/")
          if branch ~= "" and branch ~= "origin/" then
            vim.cmd("CodeDiff " .. branch .. "...HEAD")
          end
        end,
        desc = "[M]erge-base diff vs specific branch",
      },
    },
  },
  {
    "NeogitOrg/neogit",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "esmuellert/codediff.nvim",
    },
    cmd = "Neogit",
    keys = {
      {
        "<leader>gn",
        "<cmd>Neogit<cr>",
        desc = "Open Neogit",
      },
      {
        "<leader>gc",
        "<cmd>Neogit commit<cr>",
        desc = "[c]ommit",
      },
    },
    opts = {
      integrations = {
        codediff = true,
        fzf_lua = true
      },
      diff_viewer = "codediff",
      graph_style = vim.g.neovide and "ascii" or "kitty",
      process_spinner = true,
    },
  },
  {
    "linrongbin16/gitlinker.nvim",
    opts = {},
    keys = {
      { "<leader>gy", "<cmd>GitLink<cr>", mode = { "n", "v" }, desc = "Yank git link" },
      {
        "<leader>gY",
        "<cmd>GitLink! blame<cr>",
        mode = { "n", "v" },
        desc = "Open git link",
      },
    },
  },
}
