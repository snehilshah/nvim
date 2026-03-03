return {
  {
    "scinac/vim-norm-trainer.nvim",
    lazy = false,
  },
  {
    "m4xshen/hardtime.nvim",
    lazy = false,
    dependencies = { "MunifTanjim/nui.nvim" },
    opts = {
      max_count = 20,
      disable_mouse = false,
      restriction_mode = "hint",
      disabled_keys = {
        ["<Up>"] = { "", "i" },
        ["<Down>"] = { "", "i" },
        -- left and right are left enabled for navigating buffers see keymaps.lua
        -- anyways this keymap will not do what you are expecting to block here
        ["<Left>"] = {},
        ["<Right>"] = {},
      },
    },
  },
}
