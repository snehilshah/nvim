return {
  "folke/snacks.nvim",
  dependencies = { "nvim-lua/plenary.nvim", "nvim-mini/mini.nvim" },
  priority = 1000,
  lazy = false,
  ---@diagnostic disable-next-line: undefined-doc-name
  ---@type snacks.Config
  keys = {
    {
      "<leader>nc",
      function()
        Snacks.picker.files({ cwd = vim.fn.stdpath("config") })
      end,
      desc = "[N]vim [C]onfig",
    },
    {
      "<M-S-k>",
      function()
        Snacks.picker.keymaps({
          layout = "default",
        })
      end,
      desc = "[K]eymaps",
    },
    {
      "<leader>ff",
      function()
        Snacks.picker.files({
          layout = "ivy_taller",
          supports_live = true,
          format = "file",
          finder = "files",
        })
      end,
      desc = "[F]ind [F]iles",
    },
    {
      "<leader>jk",
      function()
        Snacks.picker.buffers({
          on_show = function()
            vim.cmd.stopinsert()
          end,
          finder = "buffers",
          format = "buffer",
          hidden = false,
          unloaded = true,
          current = true,
          sort_lastused = true,
          win = {
            input = {
              keys = {
                ["d"] = "bufdelete",
              },
            },
            list = { keys = { ["d"] = "bufdelete" } },
          },
          layout = "ivy_taller",
        })
      end,
      desc = "Snacks picker buffers",
    },
    {
      "<leader>fa",
      function()
        Snacks.picker.grep({
          layout = "ivy_split",
        })
      end,
      desc = "[F]ind [A]ll",
    },
    {
      "<leader>:",
      function()
        Snacks.picker.command_history({
          layout = "select",
        })
      end,
      desc = "Command History",
    },
    {
      "<M-e>",
      function()
        Snacks.explorer()
      end,
      desc = "File Explorer",
    },
    -- find
    {
      "<leader>fp",
      function()
        Snacks.picker.projects()
      end,
      desc = "Projects",
    },
    {
      "<leader>fr",
      function()
        Snacks.picker.recent()
      end,
      desc = "Recent",
    },
    -- git
    -- Show git commits that specifically modified the current line (per-line history/blame)
    -- Different from Neogit log which shows full repo history
    {
      "<leader>gl",
      function()
        Snacks.picker.git_log_line({
          on_show = function()
            vim.cmd.stopinsert()
          end,
        })
      end,
      desc = "Git log for current line",
    },
    -- Open the current file (or visual selection) on GitHub/GitLab in your browser
    {
      "<leader>go",
      function()
        Snacks.gitbrowse({
          open = function(url)
            vim.fn.system({ "google-chrome", url })
          end,
        })
      end,
      desc = "Git Browse",
      mode = { "n", "v" },
    },
    -- Browse all unstaged changed hunks across the repo in a searchable picker
    -- Quick overview of what changed — for full side-by-side diff use <leader>dv (Diffview)
    {
      "<leader>gd",
      function()
        Snacks.picker.git_diff()
      end,
      desc = "[d]iff Hunks (Snacks)",
    },
    {
      "<leader>fv",
      function()
        Snacks.picker.grep_word()
      end,
      desc = "Visual selection or word",
      mode = { "n", "x" },
    },
    -- search
    {
      '<leader>s"',
      function()
        Snacks.picker.registers()
      end,
      desc = "Registers",
    },
    {
      "<leader>s/",
      function()
        Snacks.picker.search_history()
      end,
      desc = "Search History",
    },
    {
      "<leader>sa",
      function()
        Snacks.picker.autocmds()
      end,
      desc = "Autocmds",
    },
    {
      "<leader>sC",
      function()
        Snacks.picker.commands()
      end,
      desc = "Commands",
    },
    {
      "<leader>sD",
      function()
        Snacks.picker.diagnostics()
      end,
      desc = "Diagnostics",
    },
    {
      "<leader>sd",
      function()
        Snacks.picker.diagnostics_buffer({
          on_show = function()
            vim.cmd.stopinsert()
          end,
        })
      end,
      desc = "Buffer Diagnostics",
    },
    {
      "<leader>sh",
      function()
        Snacks.picker.help()
      end,
      desc = "Help Pages",
    },
    {
      "<leader>sH",
      function()
        Snacks.picker.highlights()
      end,
      desc = "Highlights",
    },
    {
      "<leader>ii",
      function()
        Snacks.picker.icons()
      end,
      desc = "Icons",
    },
    {
      "<leader>sj",
      function()
        Snacks.picker.jumps()
      end,
      desc = "Jumps",
    },
    {
      "<leader>sl",
      function()
        Snacks.picker.loclist()
      end,
      desc = "Location List",
    },
    {
      "<leader>sm",
      function()
        Snacks.picker.marks()
      end,
      desc = "Marks",
    },
    {
      "<leader>sM",
      function()
        Snacks.picker.man()
      end,
      desc = "Man Pages",
    },
    {
      "<leader>sp",
      function()
        Snacks.picker.lazy()
      end,
      desc = "Search for Plugin Spec",
    },
    {
      "<leader>sq",
      function()
        Snacks.picker.qflist()
      end,
      desc = "Quickfix List",
    },
    {
      "<leader>sr",
      function()
        Snacks.picker.resume()
      end,
      desc = "Resume",
    },
    {
      "<leader>su",
      function()
        Snacks.picker.undo()
      end,
      desc = "Undo History",
    },
    {
      "<leader>uC",
      function()
        Snacks.picker.colorschemes()
      end,
      desc = "Colorschemes",
    },
    -- LSP
    {
      "gd",
      function()
        Snacks.picker.lsp_definitions({
          unique_lines = true, -- Filter duplicate results on same line (e.g., class + constructor)
          auto_confirm = true, -- Jump directly if only one result
          jump = { reuse_win = true },
          on_show = function()
            vim.cmd.stopinsert()
          end,
        })
      end,
      desc = "Goto Definition",
    },
    {
      "gD",
      function()
        local clients = vim.lsp.get_clients({ bufnr = 0 })
        local has_declaration_support = false

        for _, client in pairs(clients) do
          if client.server_capabilities.declarationProvider then
            has_declaration_support = true
            break
          end
        end

        if has_declaration_support then
          Snacks.picker.lsp_declarations()
        else
          Snacks.picker.lsp_definitions()
        end
      end,
      desc = "Goto Declaration",
    },
    {
      "grp",
      function()
        Snacks.picker.lsp_references({
          on_show = function()
            vim.cmd.stopinsert()
          end,
          layout = "ivy_split",
        })
      end,
      nowait = true,
      desc = "References",
    },
    {
      "gi",
      function()
        local clients = vim.lsp.get_clients({ bufnr = 0 })
        local has_implementation_support = false

        for _, client in pairs(clients) do
          if client.server_capabilities.implementationProvider then
            has_implementation_support = true
            break
          end
        end

        if has_implementation_support then
          Snacks.picker.lsp_implementations()
        else
          vim.notify("Implementation not supported by LSP server", vim.log.levels.WARN)
        end
      end,
      desc = "Goto Implementation",
    },
    {
      "gt",
      function()
        local clients = vim.lsp.get_clients({ bufnr = 0 })
        local has_type_definition_support = false

        for _, client in pairs(clients) do
          if client.server_capabilities.typeDefinitionProvider then
            has_type_definition_support = true
            break
          end
        end

        if has_type_definition_support then
          Snacks.picker.lsp_type_definitions()
        else
          vim.notify("Type definition not supported by LSP server", vim.log.levels.WARN)
        end
      end,
      desc = "Goto T[y]pe Definition",
    },
    {
      "<leader>sf",
      function()
        Snacks.picker.lsp_symbols()
      end,
      desc = "LSP Symbols",
    },
    {
      "<leader>sS",
      function()
        Snacks.picker.lsp_workspace_symbols()
      end,
      desc = "LSP Workspace Symbols",
    },
    -- Other
    {
      "<leader>z",
      function()
        Snacks.zen()
      end,
      desc = "Toggle Zen Mode",
    },
    {
      "<leader>Z",
      function()
        Snacks.zen.zoom()
      end,
      desc = "Toggle Zoom",
    },
    {
      "<leader>.",
      function()
        Snacks.scratch()
      end,
      desc = "Toggle Scratch Buffer",
    },
    {
      "<leader>S",
      function()
        Snacks.scratch.select()
      end,
      desc = "Select Scratch Buffer",
    },
    {
      "<leader>nh",
      function()
        Snacks.notifier.show_history()
      end,
      desc = "Notification History",
    },
    {
      "<leader>bd",
      function()
        Snacks.bufdelete()
      end,
      desc = "Delete Buffer",
    },
    {
      "<leader>cR",
      function()
        Snacks.rename.rename_file()
      end,
      desc = "Rename File",
    },
    {
      "<leader>un",
      function()
        Snacks.notifier.hide()
      end,
      desc = "Dismiss All Notifications",
    },
    {
      "<leader>fn",
      function()
        Snacks.words.jump(vim.v.count1)
      end,
      desc = "Next Reference",
    },
    {
      "<leader>fN",
      function()
        Snacks.words.jump(-vim.v.count1)
      end,
      desc = "Prev Reference",
    },
    {
      "<leader>N",
      desc = "Neovim News",
      function()
        Snacks.win({
          file = vim.api.nvim_get_runtime_file("doc/news.txt", false)[1],
          width = 0.6,
          height = 0.6,
          wo = {
            spell = false,
            wrap = false,
            signcolumn = "yes",
            statuscolumn = " ",
            conceallevel = 3,
          },
        })
      end,
    },
    -- file jumps
    {
      "<leader><leader>",
      function()
        Snacks.picker.smart({
          layout = "ivy_taller",
        })
      end,
      desc = "Smart Find Files",
    },
  },
  opts = {
    dashboard = { enabled = true },
    explorer = {
      enabled = true,
      show_hidden = true,
    },
    indent = {
      enabled = true,
      animate = {
        style = "up_down",
        duration = {
          step = 25, -- ms per step
          total = 1000, -- maximum duration
        },
      },
      scope = {
        underline = true, -- underline the start of the scope
      },
    },
    input = { enabled = true },
    notifier = {
      enabled = true,
      timeout = 3000,
    },

    picker = {
      sources = {
        files = {
          hidden = true, -- Show hidden files (dotfiles) by default
        },
        explorer = {
          -- focus = "input",
          replace_netrw = true, -- Replaces default file explorer
          diagnostics = true,
          auto_close = true,
          diagnostics_open = true, -- auto-open folders with diagnostics
          win = {
            list = {
              wo = {
                number = true,
                relativenumber = false,
              },
            },
            input = {
              keys = {
                ["<a-a>"] = {
                  "sidekick_send",
                  mode = { "n", "i" },
                },
              },
            },
          },
        },
      },
      actions = {
        cycle_layouts = function(picker)
          require("utils.snacks_picker").set_next_preferred_layout(picker)
        end,
        sidekick_send = function(...)
          return require("sidekick.cli.picker.snacks").send(...)
        end,
      },
      layout = {
        preset = function()
          return require("utils.snacks_picker").preferred_layout()
        end,
        cycle = false,
      },
      matcher = {
        frecency = true,
      },
      exclude = {
        "*.pb",
        "*.gw",
        "*.pb.go",
        "*.pb.gw.go",
        "*.pb.validate.go",
        "*.swagger.json",
        ".git",
        "node_modules",
      },
      win = {
        input = {
          keys = {
            ["<Esc>"] = { "close", mode = { "n", "i" } },
            ["<M-p>"] = { "cycle_layouts", mode = { "i", "n" } },
            ["J"] = { "preview_scroll_down", mode = { "n" } },
            ["K"] = { "preview_scroll_up", mode = { "n" } },
            ["H"] = { "preview_scroll_left", mode = { "n" } },
            ["L"] = { "preview_scroll_right", mode = { "n" } },
            ["<Tab>"] = { "focus_preview", mode = { "i", "n" } },
          },
        },
        preview = {
          keys = {
            ["<Esc>"] = { "focus_input", mode = { "i", "n" } },
          },
          wo = {
            number = true, -- Show line numbers
            relativenumber = true, -- Show relative line numbers (optional)
            signcolumn = "yes", -- Show sign column
            wrap = false, -- Don't wrap lines
          },
        },
      },
      formatters = {
        file = {
          filename_first = true, -- display filename before the file path
          truncate = 80,
        },
      },
    },
  },
  init = function()
    -- Setup custom layouts immediately
    require("utils.snacks_picker").setup_layouts()

    -- Snacks.util.set_hl({ UgYank = "Cursor" })
    -- Set specific colors directly

    vim.api.nvim_create_autocmd("User", {
      pattern = "VeryLazy",
      callback = function()
        -- Setup some globals for debugging (lazy-loaded)
        -- _G.dd = function(...)
        -- 	Snacks.debug.inspect(...)
        -- end
        -- _G.bt = function()
        -- 	Snacks.debug.backtrace()
        -- end
        -- vim.print = _G.dd -- Override print to use snacks for `:=` command

        -- Create some toggle mappings
        Snacks.toggle.option("spell", { name = "Spelling" }):map("<leader>us")
        Snacks.toggle.option("wrap", { name = "Wrap" }):map("<leader>uw")
        Snacks.toggle.option("relativenumber", { name = "Relative Number" }):map("<leader>uL")
        Snacks.toggle.diagnostics():map("<leader>ud")
        Snacks.toggle.line_number():map("<leader>ul")
        Snacks.toggle
          .option("conceallevel", { off = 0, on = vim.o.conceallevel > 0 and vim.o.conceallevel or 2 })
          :map("<leader>uc")
        Snacks.toggle.treesitter():map("<leader>uT")
        Snacks.toggle
          .option("background", { off = "light", on = "dark", name = "Dark Background" })
          :map("<leader>ub")
        -- NOTE: Inlay hints toggle is <leader>ih in plugins/lsp/init.lua (buffer-local)
        Snacks.toggle.indent():map("<leader>ug")
        Snacks.toggle.dim():map("<leader>uD")
      end,
    })
  end,
}

-- Disabled keys
-- {
-- NOTE: not good use neogit with <leader>gn ll or lb
--   "<leader>gl",
--   function()
--     Snacks.picker.git_log({
--       all = true,
--       layout = "ivy_taller",
--       on_show = function()
--         vim.cmd.stopinsert()
--       end,
--     })
--   end,
--   desc = "[G]it [L]og",
-- },
-- {
-- NOTE: again can use neogit with <leader>gn -- filename log ll or lb
--   "<leader>gf",
--   function()
--     Snacks.picker.git_log_file()
--   end,
--   desc = "Git Log File",
-- },
