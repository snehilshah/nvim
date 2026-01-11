-- Web Development Plugins (React/Next.js/Tailwind DX)
-- Note: nvim-ts-autotag and nvim-colorizer already in utils.lua
-- Note: Comment.nvim + ts-context-commentstring already handle JSX comments
-- Note: Emmet completions via emmet_language_server + blink.cmp (just Tab to accept)
-- Note: Auto-import via tsgo code actions (ga on unresolved symbol)
return {
  -- Package.json dependency info and management
  -- Shows versions, allows updates, displays changelogs
  {
    "vuki656/package-info.nvim",
    dependencies = { "MunifTanjim/nui.nvim" },
    ft = "json",
    opts = {
      highlights = {
        up_to_date = "PackageInfoUpToDateVersion",
        outdated = "PackageInfoOutdatedVersion",
      },
      icons = {
        enable = true,
        style = {
          up_to_date = "|  ",
          outdated = "|  ",
        },
      },
      autostart = true,
      hide_up_to_date = false,
      hide_unstable_versions = false,
    },
    config = function(_, opts)
      -- Define custom highlight groups
      vim.api.nvim_set_hl(0, "PackageInfoUpToDateVersion", { fg = "#3C4048", italic = true })
      vim.api.nvim_set_hl(0, "PackageInfoOutdatedVersion", { fg = "#d19a66", italic = true })
      require("package-info").setup(opts)
    end,
    keys = {
      {
        "<leader>ns",
        function()
          require("package-info").show()
        end,
        desc = "Show package versions",
        ft = "json",
      },
      {
        "<leader>nc",
        function()
          require("package-info").hide()
        end,
        desc = "Hide package versions",
        ft = "json",
      },
      {
        "<leader>nu",
        function()
          require("package-info").update()
        end,
        desc = "Update package",
        ft = "json",
      },
      {
        "<leader>nd",
        function()
          require("package-info").delete()
        end,
        desc = "Delete package",
        ft = "json",
      },
      {
        "<leader>ni",
        function()
          require("package-info").install()
        end,
        desc = "Install new package",
        ft = "json",
      },
      {
        "<leader>np",
        function()
          require("package-info").change_version()
        end,
        desc = "Change package version",
        ft = "json",
      },
    },
  },
}

