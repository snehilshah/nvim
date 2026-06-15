vim.opt.rtp:append(".")
-- mock vim.api.nvim_get_mode
vim.api = vim.api or {}
vim.api.nvim_get_mode = function() return { mode = "n" } end
vim.api.nvim_buf_get_name = function() return "test.lua" end
vim.api.nvim_buf_line_count = function() return 100 end
vim.fn = vim.fn or {}
vim.fn.fnamemodify = function() return "test.lua" end
vim.fn.line = function() return 1 end
vim.fn.virtcol = function() return 1 end
vim.b = { gitsigns_head = "main" }
package.loaded["gitsigns"] = { get_hunks = function() return {} end }
vim.lsp = { get_clients = function() return {} end }
vim.diagnostic = { count = function() return {} end, severity = { ERROR = 1, WARN = 2, INFO = 3, HINT = 4 } }
vim.bo = { filetype = "lua" }
package.loaded["nvim-web-devicons"] = { get_icon = function() return "󰢱" end, get_icon_by_filetype = function() return "󰢱" end }

local statusline = require("statusline")

local start = vim.uv.hrtime()
for i = 1, 100000 do
    statusline.render()
end
local duration = (vim.uv.hrtime() - start) / 1000000
print("Original statusline.render() 100k times took: " .. duration .. " ms")
