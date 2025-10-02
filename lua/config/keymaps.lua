-- vim.keymap.set("n", "<space><space>x", "<cmd>source %<CR>")
vim.keymap.set("n", "<space>x", ":.lua<CR>")
vim.keymap.set("v", "<space>x", ":lua<CR>")

vim.keymap.set("n", "<M-j>", "<cmd>cnext<CR>")
vim.keymap.set("n", "<M-k>", "<cmd>cprev<CR>")
vim.keymap.set("n", "<M-q>", "<cmd>copen<CR>")

vim.keymap.set("n", "<space>to", function()
	vim.cmd.vnew()
	vim.cmd.term()
	vim.cmd.wincmd("J")
	vim.api.nvim_win_set_height(0, 5)
end)

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
vim.keymap.set("n", "<space>q", vim.diagnostic.setloclist, { desc = "Open diagnostic [Q]uickfix list" })
vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, { desc = "Go to previous [D]iagnostic message" })
vim.keymap.set("n", "]d", vim.diagnostic.goto_next, { desc = "Go to next [D]iagnostic message" })
vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float, { desc = "Show diagnostic [E]rror messages" })

-- Make hover window interactive
vim.keymap.set("n", "<C-k>", function()
	local winid = vim.lsp.buf.hover()
	if winid then
		vim.defer_fn(function()
			vim.api.nvim_set_current_win(winid)
		end, 100)
	end
end, { desc = "Show hover and focus window" })

-- Alternative: Enter any floating window
vim.keymap.set("n", "<leader>wf", function()
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

-- LSP Call Hierarchy - show incoming calls (call stack)
vim.keymap.set("n", "<leader>ci", vim.lsp.buf.incoming_calls, { desc = "Show [C]all hierarchy [I]ncoming" })
-- LSP Call Hierarchy - show outgoing calls
vim.keymap.set("n", "<leader>co", vim.lsp.buf.outgoing_calls, { desc = "Show [C]all hierarchy [O]utgoing" })
