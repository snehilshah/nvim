-- set rtp+=/home/linuxbrew/.linuxbrew/opt/fzf
vim.opt.number = true
vim.o.showmode = false

vim.schedule(function()
	vim.o.clipboard = 'unnamedplus'
end)

--  Notice listchars is set using `vim.opt` instead of `vim.o`.
--  It is very similar to `vim.o` but offers an interface for conveniently interacting with tables.
--   See `:help lua-options`
--   and `:help lua-options-guide`
vim.o.list = true
vim.opt.listchars = { tab = '→ ', trail = '·', nbsp = '␣' }
-- vim.opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }

-- Preview substitutions live, as you type!
vim.o.inccommand = 'split'

--- Show which line your cursor is on
vim.o.cursorline = true

-- if performing an operation that would fail due to unsaved changes in the buffer (like `:q`),
-- instead raise a dialog asking if you wish to save the current file(s)
-- See `:help 'confirm'`
vim.o.confirm = true
