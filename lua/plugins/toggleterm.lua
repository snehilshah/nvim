return {
  "akinsho/toggleterm.nvim",
  version = "*",
  event = "VeryLazy",
  opts = {
    -- Size configuration
    size = function(term)
      if term.direction == "horizontal" then
        return 15
      elseif term.direction == "vertical" then
        return vim.o.columns * 0.4
      end
    end,

    -- General settings
    open_mapping = [[<C-\>]],
    hide_numbers = true,
    shade_filetypes = {},
    shade_terminals = true,
    shading_factor = 2,
    start_in_insert = true,
    insert_mappings = true,
    terminal_mappings = true,
    persist_size = true,
    persist_mode = true,
    direction = "float",
    close_on_exit = true,
    shell = vim.o.shell,
    auto_scroll = true,

    -- Float window configuration
    float_opts = {
      border = "rounded",
      width = function()
        return math.floor(vim.o.columns * 0.85)
      end,
      height = function()
        return math.floor(vim.o.lines * 0.8)
      end,
      winblend = 0,
      title_pos = "center",
    },

    -- Window bar (for non-float terminals)
    winbar = {
      enabled = false,
      name_formatter = function(term)
        return term.name
      end,
    },

    -- Highlights
    highlights = {
      Normal = { link = "Normal" },
      NormalFloat = { link = "NormalFloat" },
      FloatBorder = { link = "FloatBorder" },
    },
  },

  config = function(_, opts)
    require("toggleterm").setup(opts)

    -- Create custom terminal instances
    local Terminal = require("toggleterm.terminal").Terminal

    -- Lazygit terminal (if not using snacks lazygit)
    local lazygit = Terminal:new({
      cmd = "lazygit",
      dir = "git_dir",
      direction = "float",
      hidden = true,
      float_opts = {
        border = "rounded",
        width = function()
          return math.floor(vim.o.columns * 0.95)
        end,
        height = function()
          return math.floor(vim.o.lines * 0.95)
        end,
      },
      on_open = function(term)
        vim.cmd("startinsert!")
        -- Close with q in normal mode
        vim.api.nvim_buf_set_keymap(
          term.bufnr,
          "n",
          "q",
          "<cmd>close<CR>",
          { noremap = true, silent = true }
        )
      end,
    })

    -- Htop/btop terminal
    local htop = Terminal:new({
      cmd = "btop",
      direction = "float",
      hidden = true,
      float_opts = {
        border = "rounded",
        width = function()
          return math.floor(vim.o.columns * 0.9)
        end,
        height = function()
          return math.floor(vim.o.lines * 0.9)
        end,
      },
    })

    -- Node REPL
    local node = Terminal:new({
      cmd = "bun repl",
      direction = "float",
      hidden = true,
    })

    -- Python REPL
    local python = Terminal:new({
      cmd = "python3",
      direction = "float",
      hidden = true,
    })

    -- Global functions for keymaps
    _G.toggle_lazygit = function()
      lazygit:toggle()
    end

    _G.toggle_htop = function()
      htop:toggle()
    end

    _G.toggle_node = function()
      node:toggle()
    end

    _G.toggle_python = function()
      python:toggle()
    end

    -- Function to send current line or visual selection to terminal
    _G.send_to_terminal = function()
      local mode = vim.fn.mode()
      if mode == "v" or mode == "V" then
        require("toggleterm").send_lines_to_terminal("visual_selection", true, { args = 1 })
      else
        require("toggleterm").send_lines_to_terminal("single_line", true, { args = 1 })
      end
    end

    -- Keymaps
    local map = vim.keymap.set

    -- Main toggle (float)
    map(
      { "n", "t" },
      "<C-\\>",
      "<cmd>ToggleTerm direction=float<CR>",
      { desc = "Toggle Terminal (float)" }
    )

    -- Direction-specific toggles
    map("n", "<leader>tf", "<cmd>ToggleTerm direction=float<CR>", { desc = "[T]erminal [F]loat" })
    map(
      "n",
      "<leader>th",
      "<cmd>ToggleTerm direction=horizontal<CR>",
      { desc = "[T]erminal [H]orizontal" }
    )
    map(
      "n",
      "<leader>tv",
      "<cmd>ToggleTerm direction=vertical<CR>",
      { desc = "[T]erminal [V]ertical" }
    )
    map("n", "<leader>tt", "<cmd>ToggleTerm direction=tab<CR>", { desc = "[T]erminal [T]ab" })

    -- Numbered terminals (1-4)
    map("n", "<leader>t1", "<cmd>1ToggleTerm<CR>", { desc = "[T]erminal [1]" })
    map("n", "<leader>t2", "<cmd>2ToggleTerm<CR>", { desc = "[T]erminal [2]" })
    map("n", "<leader>t3", "<cmd>3ToggleTerm<CR>", { desc = "[T]erminal [3]" })
    map("n", "<leader>t4", "<cmd>4ToggleTerm<CR>", { desc = "[T]erminal [4]" })

    -- Toggle all terminals
    map("n", "<leader>ta", "<cmd>ToggleTermToggleAll<CR>", { desc = "[T]erminal Toggle [A]ll" })

    -- Terminal select
    map("n", "<leader>ts", "<cmd>TermSelect<CR>", { desc = "[T]erminal [S]elect" })

    -- Send to terminal
    map(
      "n",
      "<leader>tl",
      "<cmd>ToggleTermSendCurrentLine<CR>",
      { desc = "[T]erminal Send [L]ine" }
    )
    map(
      "v",
      "<leader>tl",
      "<cmd>ToggleTermSendVisualSelection<CR>",
      { desc = "[T]erminal Send [L]ines" }
    )

    -- Custom terminals
    map("n", "<leader>tg", _G.toggle_lazygit, { desc = "[T]erminal Lazy[G]it" })
    map("n", "<leader>tp", _G.toggle_htop, { desc = "[T]erminal Hto[P]" })
    map("n", "<leader>tn", _G.toggle_node, { desc = "[T]erminal [N]ode" })
    map("n", "<leader>ty", _G.toggle_python, { desc = "[T]erminal P[Y]thon" })

    -- Terminal mode mappings
    map("t", "<Esc><Esc>", [[<C-\><C-n>]], { desc = "Exit terminal mode" })
    map("t", "<C-h>", [[<Cmd>wincmd h<CR>]], { desc = "Navigate left" })
    map("t", "<C-j>", [[<Cmd>wincmd j<CR>]], { desc = "Navigate down" })
    map("t", "<C-k>", [[<Cmd>wincmd k<CR>]], { desc = "Navigate up" })
    map("t", "<C-l>", [[<Cmd>wincmd l<CR>]], { desc = "Navigate right" })
    map("t", "<C-w>", [[<C-\><C-n><C-w>]], { desc = "Window commands" })

    -- Set terminal-specific options via autocmd
    vim.api.nvim_create_autocmd("TermOpen", {
      pattern = "term://*toggleterm#*",
      callback = function()
        local opts_local = { buffer = 0 }
        vim.keymap.set("t", "<C-h>", [[<Cmd>wincmd h<CR>]], opts_local)
        vim.keymap.set("t", "<C-j>", [[<Cmd>wincmd j<CR>]], opts_local)
        vim.keymap.set("t", "<C-k>", [[<Cmd>wincmd k<CR>]], opts_local)
        vim.keymap.set("t", "<C-l>", [[<Cmd>wincmd l<CR>]], opts_local)
      end,
    })
  end,
}
