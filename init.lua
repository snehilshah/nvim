-- Set leader keys before loading lazy.nvim
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

require("config.lazy")
require("config.options")
require("config.keymaps")

vim.g.have_nerd_font = false
vim.o.background = "dark"

vim.api.nvim_create_autocmd('TextYankPost', {
	desc = 'Highlight when yanking text',
	group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
	callback = function()
		vim.highlight.on_yank()
	end
})

vim.diagnostic.config({
	virtual_text = true,
	signs = true,
	underline = true,
	update_in_insert = false,
})

vim.api.nvim_create_autocmd("TermOpen", {
	group = vim.api.nvim_create_augroup("custom-term-open", { clear = true }),
	callback = function()
		local current_job_id = vim.bo.channel
		if current_job_id and current_job_id > 0 then
			vim.fn.chansend(current_job_id, { "make all \r\n" })
		end
	end,
})
