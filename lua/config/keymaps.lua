vim.keymap.set("n", "<leader>rc", "<cmd>source %<CR>")
vim.keymap.set("n", "<leader>x", ":.lua<CR>")
vim.keymap.set("v", "<leader>x", ":lua<CR>")

vim.keymap.set("n", "<M-j>", "<cmd>cnext<CR>")
vim.keymap.set("n", "<M-k>", "<cmd>cprev<CR>")
vim.keymap.set("n", "<M-q>", "<cmd>copen<CR>")

-- moving lines up or down
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", { desc = "Move Lines Down" })
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", { desc = "Move Lines Up" })

-- Resize window using <ctrl> arrow keys
vim.keymap.set("n", "<C-Up>", "<cmd>resize +2<cr>", { desc = "Increase window height" })
vim.keymap.set("n", "<C-Down>", "<cmd>resize -2<cr>", { desc = "Decrease window height" })
vim.keymap.set("n", "<C-Left>", "<cmd>vertical resize -2<cr>", { desc = "Decrease window width" })
vim.keymap.set("n", "<C-Right>", "<cmd>vertical resize +2<cr>", { desc = "Increase window width" })

-- Keeping the cursor centered.
vim.keymap.set("n", "<C-d>", "<C-d>zz", { desc = "Scroll downwards" })
vim.keymap.set("n", "<C-u>", "<C-u>zz", { desc = "Scroll upwards" })

-- better indenting
vim.keymap.set("v", "<", "<gv", { desc = "Indent Left" })
vim.keymap.set("v", ">", ">gv", { desc = "Indent Right" })

-- Move to start/end of line
vim.keymap.set({ "n", "x", "o" }, "H", "^", { desc = "Start of Line" })
vim.keymap.set({ "n", "x", "o" }, "L", "g_", { desc = "End of Line" })

-- Keep search results centered
vim.keymap.set("n", "n", "nzzzv", { desc = "Next Match (centered)" })
vim.keymap.set("n", "N", "Nzzzv", { desc = "Prev Match (centered)" })
vim.keymap.set("n", "*", "*zzzv", { desc = "Search Word (centered)" })
vim.keymap.set("n", "#", "#zzzv", { desc = "Search Word Back (centered)" })
vim.keymap.set("n", "g*", "g*zz", { desc = "Search Partial (centered)" })
vim.keymap.set("n", "g#", "g#zz", { desc = "Search Partial Back (centered)" })

-- Get highlighted line numbers in visual mode
vim.keymap.set(
  "v",
  "<leader>ln",
  ':lua require("core.utils").get_highlighted_line_numbers()<CR>',
  { desc = "Copy Line Numbers", silent = true }
)

-- Split line with X
vim.keymap.set(
  "n",
  "X",
  ":keeppatterns substitute/\\s*\\%#\\s*/\\r/e <bar> normal! ==^<cr>",
  { desc = "Split Line", silent = true }
)

-- Diagnostic keymaps
vim.keymap.set(
  "n",
  "<leader>q",
  vim.diagnostic.setloclist,
  { desc = "Open diagnostic [Q]uickfix list" }
)
-- NOTE: [d/]d diagnostic jumps are in plugins/lsp/init.lua (buffer-local on LspAttach)
vim.keymap.set(
  "n",
  "<leader>de",
  vim.diagnostic.open_float,
  { desc = "Show diagnostic [E]rror messages" }
)

vim.keymap.set("n", "gX", function()
  local target = vim.fn.expand("<cfile>")
  if target == nil or target == "" then
    vim.notify("No link under cursor", vim.log.levels.WARN)
    return
  end
  vim.ui.open(target)
end, { desc = "Open link under cursor" })

-- Yank diagnostic message under cursor
vim.keymap.set("n", "<leader>dy", function()
  local diagnostics = vim.diagnostic.get(0, { lnum = vim.fn.line(".") - 1 })
  if #diagnostics > 0 then
    local messages = {}
    for _, diag in ipairs(diagnostics) do
      table.insert(messages, diag.message)
    end
    local full_message = table.concat(messages, "\n")
    vim.fn.setreg("+", full_message)
    vim.fn.setreg('"', full_message)
    vim.notify("Diagnostic message(s) yanked to clipboard", vim.log.levels.INFO)
  else
    vim.notify("No diagnostic message on this line", vim.log.levels.WARN)
  end
end, { desc = "[D]iagnostic [Y]ank message" })

-- Alternative: Enter any floating window
vim.keymap.set("n", "<C-w>f", function()
  local wins = vim.api.nvim_list_wins()
  for _, win in ipairs(wins) do
    local config = vim.api.nvim_win_get_config(win)
    if config.relative ~= "" then -- This is a floating window
      vim.api.nvim_set_current_win(win)
      break
    end
  end
end, { desc = "Focus floating [W]indow" })

vim.keymap.set("t", "<Esc><Esc>", "<C-\\><C-n>", { desc = "Exit terminal mode" })

-- Delete without copying to clipboard
vim.keymap.set({ "n", "x" }, "d", '"_d', { desc = "Delete without copying to clipboard" })
vim.keymap.set(
  { "n", "x" },
  "D",
  '"_D',
  { desc = "Delete to end of line without copying to clipboard" }
)

-- Code actions
vim.keymap.set(
  { "n", "x" },
  "<leader>ca",
  vim.lsp.buf.code_action,
  { noremap = true, silent = true, desc = "[C]ode [A]ction" }
)

-- Run codelens actions directly
vim.keymap.set("n", "grx", vim.lsp.codelens.run, { desc = "Run codelens actions" })

-- LSP Call Hierarchy - show incoming calls (call stack)
vim.keymap.set(
  "n",
  "<leader>ci",
  vim.lsp.buf.incoming_calls,
  { desc = "Show [C]all hierarchy [I]ncoming" }
)
-- LSP Call Hierarchy - show outgoing calls
vim.keymap.set(
  "n",
  "<leader>co",
  vim.lsp.buf.outgoing_calls,
  { desc = "Show [C]all hierarchy [O]utgoing" }
)

vim.keymap.set("n", "<leader>cp", function()
  require("core.utils").copyFilePathAndLineNumber()
end, { desc = "Copy file path with line number" })

-- Disable the frustrating command-line window that pops up when pressing q: instead of :q
vim.keymap.set({ "n", "v" }, "q:", function()
  vim.notify("Command-line window (q:) is disabled. Use :q to quit.", vim.log.levels.INFO)
end, { desc = "Disable command-line window (q:)" })

-- Indent while remaining in visual mode.
vim.keymap.set("v", "<", "<gv")
vim.keymap.set("v", ">", ">gv")

-- Poweful <esc>.
vim.keymap.set({ "i", "s", "n" }, "<esc>", function()
  vim.cmd("noh")
  return "<esc>"
end, { desc = "Escape, clear hlsearch, and stop snippet session", expr = true })

-- Make U opposite to u.
vim.keymap.set("n", "U", "<C-r>", { desc = "Redo" })

-- Escape and save changes.
vim.keymap.set(
  { "s", "i", "n", "v" },
  "<C-s>",
  "<esc>:w<cr>",
  { desc = "Exit insert mode and save changes" }
)
vim.keymap.set({ "s", "i", "n", "v" }, "<C-S-s>", function()
  vim.g.skip_formatting = true
  return "<esc>:w<cr>"
end, { desc = "Exit insert mode and save changes (without formatting)", expr = true })

vim.keymap.set(
  { "n", "v" },
  "<leader>jj",
  ":colorscheme cosmic-gleam<CR>",
  { desc = "activate my theme" }
)
