return {
  "zbirenbaum/copilot.lua",
  cmd = "Copilot",
  event = "InsertEnter",
  enabled = true,
  dependencies = {
    "copilotlsp-nvim/copilot-lsp",
  },
  opts = {
    panel = {
      enabled = false, -- disable panel when using blink-copilot
      auto_refresh = false,
      keymap = {
        jump_prev = false,
        jump_next = false,
        accept = false,
        refresh = false,
        open = false,
      },
      layout = {
        position = "bottom", -- | top | left | right | bottom |
        ratio = 0.4,
      },
    },
    suggestion = {
      enabled = true, -- enable native Copilot inline suggestions
      auto_trigger = false, -- automatically show suggestions
      hide_during_completion = true,
      debounce = 75,
      trigger_on_accept = true,
      keymap = {
        accept = "<C-y>", -- Ctrl+y to accept (like traditional completion)
        accept_word = "<C-Right>", -- Ctrl+Right to accept word
        accept_line = "<C-e>", -- Ctrl+e to accept line
        next = "<C-n>", -- Ctrl+n for next suggestion
        prev = "<C-p>", -- Ctrl+p for previous suggestion
        dismiss = "<C-l>", -- Ctrl+c to dismiss
      },
    },
    nes = {
      enabled = true,
      auto_trigger = true,
      keymap = {
        accept_and_goto = "<S-Tab>", -- Tab works reliably in normal mode for NES
        accept = "<M-CR>", -- Enter to accept without jumping to end
        dismiss = "<Esc>",
      },
    },
    logger = {
      file = vim.fn.stdpath("log") .. "/copilot-lua.log",
      file_log_level = vim.log.levels.OFF,
      print_log_level = vim.log.levels.WARN,
      trace_lsp = "off", -- "off" | "messages" | "verbose"
      trace_lsp_progress = false,
      log_lsp_messages = false,
    },
    copilot_node_command = "node", -- Node.js version must be > 22
    workspace_folders = {},
    copilot_model = "", -- at the time of configuring there was only 1 model available, in future can check `github.copilot.selectedCompletionModel`
    disable_limit_reached_message = false, -- Set to `true` to suppress completion limit reached popup
    root_dir = function()
      return vim.fs.dirname(vim.fs.find(".git", { upward = true })[1])
    end,
    should_attach = function(_, _)
      if not vim.bo.buflisted then
        -- logger.debug("not attaching, buffer is not 'buflisted'")
        return false
      end

      if vim.bo.buftype ~= "" then
        -- logger.debug("not attaching, buffer 'buftype' is " .. vim.bo.buftype)
        return false
      end

      return true
    end,
    server = {
      type = "nodejs", -- "nodejs" | "binary"
      custom_server_filepath = nil,
    },
    server_opts_overrides = {},
    filetypes = {
      ["*"] = true,
    },
  },
}
