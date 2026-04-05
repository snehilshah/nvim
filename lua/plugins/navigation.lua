return {
  "folke/flash.nvim",
  event = "VeryLazy",
  ---@type Flash.Config
  opts = {
    jump = { nohlsearch = true },
    prompt = {
      win_config = {
        border = "none",
        -- Place the prompt above the statusline.
        row = -3,
      },
    },
    search = {
      exclude = {
        "flash_prompt",
        "qf",
        function(win)
          -- Non-focusable windows.
          return not vim.api.nvim_win_get_config(win).focusable
        end,
      },
    },
    modes = {
      -- Enable flash when searching with ? or /
      search = { enabled = true },
    },
  },
  keys = {
    {
      "zj",
      mode = { "n", "x", "o" },
      function()
        require("flash").jump()
      end,
      desc = "Flash",
    },
    {
      "zp",
      mode = { "n", "x", "o" },
      function()
        require("flash").treesitter()
      end,
      desc = "Flash Treesitter",
    },
    {
      "zk",
      mode = "o",
      function()
        require("flash").remote()
      end,
      desc = "Remote Flash",
    },
    {
      "zo",
      mode = { "o", "x" },
      function()
        require("flash").treesitter_search()
      end,
      desc = "Treesitter Search",
    },
  },
}
