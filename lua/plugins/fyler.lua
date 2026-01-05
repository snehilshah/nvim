return {
  "A7Lavinraj/fyler.nvim",
  dependencies = { "nvim-mini/mini.nvim", "folke/snacks.nvim" },
  branch = "stable",
  opts = {
    hooks = {
      on_rename = function(src_path, destination_path)
        Snacks.rename.on_rename_file(src_path, destination_path)
      end,
    },
    integrations = {
      icon = "mini_icons",
      winpick = {
        provider = "snacks",
        opts = {},
      },
    },
    views = {
      finder = {
        win = {
          border = vim.o.winborder == "" and "single" or vim.o.winborder,
          buf_opts = {
            filetype = "fyler",
            syntax = "fyler",
            buflisted = false,
            buftype = "acwrite",
            expandtab = true,
            shiftwidth = 2,
          },
          kind = "float",
          kinds = {
            float = {
              height = "70%",
              width = "80%",
              top = "10%",
              left = "10%",
            },
          },
          win_opts = {
            number = true,
            relativenumber = false,
            winhighlight = "Normal:FylerNormal,NormalNC:FylerNormalNC",
            wrap = false,
            signcolumn = "no",
          },
        },
      },
    },
  },
}
