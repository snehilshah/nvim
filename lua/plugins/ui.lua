-- ============================================================================
-- UI Enhancements
-- ============================================================================
-- Visual helpers: keymaps popup, color highlighting, line numbers, etc.

return {
  -- Displays a popup with possible keybindings of the command you started typing
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    opts = {
      delay = 1000, -- ms before popup shows (default: 200)
    },
    keys = {
      {
        "<leader>?",
        function()
          require("which-key").show({ global = false })
        end,
        desc = "Buffer Local Keymaps (which-key)",
      },
    },
  },
  -- Comfy line numbers
  {
    "snehilshah/comfy-line-numbers.nvim",
    opts = {
      up_key = "k",
      down_key = "j",

      hidden_file_types = { "undotree" },
      hidden_buffer_types = { "terminal", "nofile" },
      hide_in_insert_mode = true,
    },
    config = function(_, opts)
      require("comfy-line-numbers").setup(opts)
      -- Add fold column (%C) to the statuscolumn set by comfy-line-numbers
      vim.api.nvim_create_autocmd("ModeChanged", {
        pattern = "*",
        callback = function()
          vim.schedule(function()
            local sc = vim.opt.statuscolumn:get()
            if sc ~= "" and not sc:match("%%C") then
              vim.opt.statuscolumn = "%C" .. sc
            end
          end)
        end,
      })
      -- Also set it initially
      vim.schedule(function()
        local sc = vim.opt.statuscolumn:get()
        if sc ~= "" and not sc:match("%%C") then
          vim.opt.statuscolumn = "%C" .. sc
        end
      end)
    end,
  },
  -- Visual whitespace display in visual mode
  {
    "mcauley-penney/visual-whitespace.nvim",
    init = function()
      vim.keymap.set({ "n", "v" }, "<leader>tw", require("visual-whitespace").toggle, {})
      vim.api.nvim_set_hl(0, "VisualNonText", { fg = "#5D5F71", bg = "#24282d" })
    end,
    event = "ModeChanged *:[vV\22]", -- optionally, lazy load on entering visual mode
    opts = {
      list_chars = {
        space = "·",
        tab = " ",
        nbsp = "󱁐 ",
        lead = "‹",
        trail = "›",
      },
      fileformat_chars = {
        unix = " 󰌑 ",
        mac = " 󰌑 ",
        dos = " 󰌑 ",
      },
    },
  },
  {
    "brenoprata10/nvim-highlight-colors",
    event = "BufReadPre",
    enabled = true,
    opts = {
      render = "background",
      enable_hex = true,
      enable_short_hex = true,
      enable_rgb = true,
      enable_hsl = true,
      enable_hsl_without_function = true,
      enable_ansi = true,
      enable_var_usage = true,
      enable_tailwind = true,
    },
  },
}
