vim.keymap.set("n", "<leader>rc", "<cmd>source %<CR>")
vim.keymap.set("n", "<leader>x", ":.lua<CR>")
vim.keymap.set("v", "<leader>x", ":lua<CR>")

vim.keymap.set("n", "<M-j>", "<cmd>cnext<CR>")
vim.keymap.set("n", "<M-k>", "<cmd>cprev<CR>")
vim.keymap.set("n", "<M-q>", "<cmd>copen<CR>")

vim.keymap.set("n", "<leader>to", function()
	vim.cmd.vnew()
	vim.cmd.term()
	vim.cmd.wincmd("J")
	vim.api.nvim_win_set_height(0, 5)
end)

-- moving lines up or down
vim.keymap.set("n", "<leader>j", ":m .+1<CR>==", { desc = "Move line down" })
vim.keymap.set("n", "<leader>k", ":m .-2<CR>==", { desc = "Move line up" })
vim.keymap.set("v", "<leader>j", ":m '>+1<CR>gv=gv", { desc = "Move selection down" })
vim.keymap.set("v", "<leader>k", ":m '<-2<CR>gv=gv", { desc = "Move selection up" })

-- Clear highlights on search when pressing <Esc> in normal mode and close LSP hover
--  See `:help hlsearch`
vim.keymap.set("n", "<Esc>", function()
	vim.cmd("nohlsearch")
	-- Close LSP hover and diagnostic windows specifically
	pcall(vim.lsp.buf.clear_references)
	vim.diagnostic.hide()

	if vim.fn.pumvisible() == 1 then
		vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<C-e>", true, false, true), "n", false)
	end
end)

-- Diagnostic keymaps
vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist, { desc = "Open diagnostic [Q]uickfix list" })
vim.keymap.set("n", "[e", vim.diagnostic.goto_prev, { desc = "Go to previous [D]iagnostic message" })
vim.keymap.set("n", "]e", vim.diagnostic.goto_next, { desc = "Go to next [D]iagnostic message" })
vim.keymap.set("n", "<leader>de", vim.diagnostic.open_float, { desc = "Show diagnostic [E]rror messages" })

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

-- Oil
vim.keymap.set("n", "-", "<cmd>Oil --float<CR>", { desc = "Open parent directory in oil" })

-- Delete without copying to clipboard
vim.keymap.set({ "n", "x" }, "d", '"_d', { desc = "Delete without copying to clipboard" })
vim.keymap.set("n", "dd", '"_dd', { desc = "Delete line without copying to clipboard" })
vim.keymap.set({ "n", "x" }, "D", '"_D', { desc = "Delete to end of line without copying to clipboard" })

-- Code actions with tiny-code-action
vim.keymap.set({ "n", "x" }, "<leader>ca", function()
	require("tiny-code-action").code_action()
end, { noremap = true, silent = true, desc = "[C]ode [A]ction" })

-- LSP Call Hierarchy - show incoming calls (call stack)
vim.keymap.set("n", "<leader>ci", vim.lsp.buf.incoming_calls, { desc = "Show [C]all hierarchy [I]ncoming" })
-- LSP Call Hierarchy - show outgoing calls
vim.keymap.set("n", "<leader>co", vim.lsp.buf.outgoing_calls, { desc = "Show [C]all hierarchy [O]utgoing" })
