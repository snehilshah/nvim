return {
  {
    "kristijanhusak/vim-dadbod-ui",
    dependencies = {
      { "tpope/vim-dadbod", lazy = true },
      { "kristijanhusak/vim-dadbod-completion", ft = { "sql", "mysql", "plpgsql" }, lazy = true },
    },
    cmd = { "DBUI", "DBUIToggle", "DBUIAddConnection", "DBUIFindBuffer" },
    keys = {
      { "<leader>Du", "<cmd>DBUIToggle<CR>", desc = "[D]atabase [U]I toggle" },
      { "<leader>Da", "<cmd>DBUIAddConnection<CR>", desc = "[D]atabase [A]dd connection" },
      { "<leader>Df", "<cmd>DBUIFindBuffer<CR>", desc = "[D]atabase [F]ind buffer" },
    },
    init = function()
      vim.g.db_ui_use_nerd_fonts = 1
      vim.g.db_ui_show_database_icon = 1
      vim.g.db_ui_force_echo_notifications = 1
      vim.g.db_ui_win_position = "left"
      vim.g.db_ui_winwidth = 40

      vim.g.db_ui_icons = {
        expanded = {
          db = "▾ ",
          buffers = "▾ ",
          saved_queries = "▾ ",
          schemas = "▾ ",
          schema = "▾ ",
          tables = "▾ ",
          table = "▾ ",
        },
        collapsed = {
          db = "▸ ",
          buffers = "▸ ",
          saved_queries = "▸ ",
          schemas = "▸ ",
          schema = "▸ ",
          tables = "▸ ",
          table = "▸ ",
        },
        saved_query = "",
        new_query = "󰓰",
        tables = "󰓫",
        buffers = "󰽙",
        add_connection = "󱘖",
        connection_ok = "",
        connection_error = "",
      }
    end,
    config = function()
      -- Highlight groups for dadbod-ui (customize colors here)
      local hl = vim.api.nvim_set_hl

      -- DBUI drawer (sidebar tree)
      hl(0, "dbui_tables", { link = "Keyword" })
      hl(0, "dbui_connection_ok", { link = "DiffAdd" })
      hl(0, "dbui_connection_error", { link = "DiffDelete" })
      hl(0, "dbui_saved_query", { link = "Identifier" })
      hl(0, "dbui_databases", { link = "Title" })
      hl(0, "dbui_schemas", { link = "Statement" })
      hl(0, "dbui_buffers", { link = "Special" })

      -- Query result buffer (dbout)
      hl(0, "dbout_header", { link = "Title" })
      hl(0, "dbout_separator", { link = "NonText" })
      hl(0, "dbout_null", { link = "Comment" })

      -- Notification highlights
      hl(0, "NotificationTitle", { link = "Title" })
      hl(0, "NotificationBody", { link = "Normal" })
    end,
  },
}
