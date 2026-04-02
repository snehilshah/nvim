return {
  {
    "snehilshah/no-go.nvim",
    branch = "no-no-go",
    enabled = false,
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
        -- when pressing the enter key, also look for the next concealed block below the cursor
        -- set to false to only enter a block that starts at/above the current line
        toggle = "<M-o>",
      },
    },
  },
}
