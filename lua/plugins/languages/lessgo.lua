return {
  {
    "ray-x/go.nvim",
    enabled = true,
    dependencies = {
      "ray-x/guihua.lua",
      "nvim-treesitter/nvim-treesitter",
      "neovim/nvim-lspconfig",
      "saghen/blink.cmp",
    },
    config = function(_, opts)
      require("go").setup({
        lsp_keymaps = false,
        lsp_codelens = false,
        lsp_on_attach = false,
        lsp_cfg = false, -- disable go.nvim LSP, using lspconfig instead
        lsp_gofumpt = false,
        lsp_inlay_hints = {
          enable = false,
        },
        golangci_lint = {
          default = "none", -- disabled, using nvim-lint instead
          flags = {
            "--output.json.path=stdout",
            "--issues-exit-code=0",
            "--show-stats=false",
            "--allow-parallel-runners",
          },
          -- disable = {'errcheck', 'staticcheck'}, -- linters to disable empty by default
          -- enable = {'govet', 'ineffassign','revive', 'gosimple'}, -- linters to enable; empty by default
          config = nil, -- set to a config file path
          no_config = false, -- true: golangci-lint --no-config
          -- disable = {},     -- linters to disable empty by default, e.g. {'errcheck', 'staticcheck'}
          -- enable = {},      -- linters to enable; empty by default, set to e.g. {'govet', 'ineffassign','revive', 'gosimple'}
          -- enable_only = {}, -- linters to enable only; empty by default, set to e.g. {'govet', 'ineffassign','revive', 'gosimple'}
          severity = vim.diagnostic.severity.INFO, -- severity level of the diagnostics
        },
        -- Disable go.nvim diagnostics, using tiny-diagnostics + nvim-lint instead
        diagnostic = false,
        lsp_diag_virtual_text = false,
        lsp_diag_signs = false,
        lsp_diag_update_in_insert = false,
        luasnip = true, -- enable go.nvim luasnip snippets
      })
    end,
    ft = { "go", "gomod" },
    -- build = ':lua require("go.install").update_all_sync()',
  },
  {
    "snehilshah/no-go.nvim",
    branch = "no-no-go",
    enabled = true,
    dependencies = { "nvim-treesitter/nvim-treesitter" },
    ft = "go",
    opts = {
      identifiers = { "err", "error" },
      import_virtual_text = {
        prefix = " ", -- or any icon you prefer
        suffix = " imports ",
      },
      reveal_on_cursor = false,
      keys = {
        down = "j",
        up = "k",
        enter = "<M-l>",
        -- when pressing the enter key, also look for the next concealed block below the cursor
        -- set to false to only enter a block that starts at/above the current line
        refold = "<M-l>",
      },
    },
  },
}
