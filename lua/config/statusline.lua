-- Simple, minimal statusline with essential information
local M = {}

-- Get current mode
local function get_mode()
	local modes = {
		n = "NORMAL",
		i = "INSERT",
		v = "VISUAL",
		V = "V-LINE",
		["\22"] = "V-BLOCK",
		c = "COMMAND",
		s = "SELECT",
		S = "S-LINE",
		["\19"] = "S-BLOCK",
		R = "REPLACE",
		r = "REPLACE",
		["!"] = "SHELL",
		t = "TERMINAL",
	}

	local mode_colors = {
		n = "%#Function#",
		i = "%#String#",
		v = "%#WarningMsg#",
		V = "%#WarningMsg#",
		["\22"] = "%#WarningMsg#",
		c = "%#Identifier#",
		s = "%#WarningMsg#",
		S = "%#WarningMsg#",
		["\19"] = "%#WarningMsg#",
		R = "%#ErrorMsg#",
		r = "%#ErrorMsg#",
		["!"] = "%#ErrorMsg#",
		t = "%#String#",
	}

	local current_mode = vim.api.nvim_get_mode().mode
	local mode_name = modes[current_mode] or current_mode:upper()
	local color = mode_colors[current_mode] or "%#Normal#"

	return color .. " " .. mode_name .. " %*"
end

-- Get filename with icon
local function get_filename()
	local filename = vim.fn.expand("%:t")
	if filename == "" then
		return "%#Comment# [No Name] %*"
	end

	-- Get file icon using mini.icons
	local icon = ""
	local ok, mini_icons = pcall(require, "mini.icons")
	if ok then
		local file_icon, _, _ = mini_icons.get("file", filename)
		icon = file_icon and (file_icon .. " ") or ""
	end

	-- Check if file is modified
	local modified = vim.bo.modified and "%#WarningMsg# [+]%*" or ""

	-- Check if file is readonly
	local readonly = vim.bo.readonly and "%#ErrorMsg# [RO]%*" or ""

	return "%#Title#" .. icon .. filename .. "%*" .. modified .. readonly
end

-- Get LSP diagnostics
local function get_diagnostics()
	if not vim.diagnostic.is_enabled() then
		return ""
	end

	local diagnostics = vim.diagnostic.get(0)
	local counts = { 0, 0, 0, 0 }

	for _, diag in pairs(diagnostics) do
		counts[diag.severity] = counts[diag.severity] + 1
	end

	local result = {}
	local icons = { "E", "W", "I", "H" }
	local colors = { "%#ErrorMsg#", "%#WarningMsg#", "%#Function#", "%#Comment#" }

	for i, count in ipairs(counts) do
		if count > 0 then
			table.insert(result, colors[i] .. icons[i] .. ":" .. count .. "%*")
		end
	end

	if #result > 0 then
		return " " .. table.concat(result, " ") .. " "
	else
		return ""
	end
end

local function get_lsp_status()
	local clients = vim.lsp.get_clients({ bufnr = 0 })
	if #clients == 0 then
		return ""
	end

	local client_names = {}
	-- Filter out AI/Copilot clients and only show language servers
	local excluded_clients = {
		"copilot",
		"GitHub Copilot",
		"codeium",
		"tabnine",
		"supermaven"
	}

	for _, client in pairs(clients) do
		local should_exclude = false
		for _, excluded in ipairs(excluded_clients) do
			if client.name:lower():find(excluded:lower()) then
				should_exclude = true
				break
			end
		end

		if not should_exclude then
			table.insert(client_names, client.name)
		end
	end

	if #client_names == 0 then
		return ""
	end

	return "%#Function#" .. table.concat(client_names, ",") .. " %*"
end

-- Get cursor position
local function get_position()
	local line = vim.fn.line(".")
	local col = vim.fn.col(".")
	local total = vim.fn.line("$")

	return "%#Comment# " .. line .. ":" .. col .. "/" .. total .. " %*"
end

-- Get git branch and status for current file
local function get_git_status()
	-- Check if we're in a git repository
	local git_dir = vim.fn.finddir('.git', '.;')
	if git_dir == '' then
		return ""
	end

	-- Get current branch
	local branch = vim.fn.system('git branch --show-current 2>/dev/null'):gsub('\n', '')
	if branch == '' then
		return ""
	end

	local git_info = "%#Function# " .. branch .. "%*"

	-- Get current file path relative to git root
	local current_file = vim.fn.expand('%:p')
	if current_file == '' then
		return git_info .. " "
	end

	-- Get git root directory
	local git_root = vim.fn.system('git rev-parse --show-toplevel 2>/dev/null'):gsub('\n', '')
	if git_root == '' then
		return git_info .. " "
	end

	-- Get relative path from git root
	local relative_file = current_file:gsub(git_root .. '/', '')

	-- Check if file is tracked and get its status
	local file_status = vim.fn.system('git status --porcelain "' .. relative_file .. '" 2>/dev/null'):gsub('\n', '')

	if file_status ~= '' then
		local status_code = file_status:sub(1, 2)
		local status_parts = {}

		-- Check modification status
		if status_code:match('M.') or status_code:match('.M') then
			-- Simple and accurate: just show what git numstat reports
			local numstat = vim.fn.system('git diff --numstat "' .. relative_file .. '" 2>/dev/null'):gsub('\n', '')

			if numstat ~= '' then
				local added_str, deleted_str = numstat:match('(%d+)%s+(%d+)')
				if added_str and deleted_str then
					local added = tonumber(added_str) or 0
					local deleted = tonumber(deleted_str) or 0

					-- Show modifications when both adds and deletes exist
					-- This is the most accurate way to represent line changes
					if added > 0 and deleted > 0 then
						-- Calculate modifications (minimum of adds/deletes represents changed lines)
						local modifications = math.min(added, deleted)
						local pure_additions = added - modifications
						local pure_deletions = deleted - modifications

						-- Always show modifications first
						if modifications > 0 then
							table.insert(status_parts, "%#WarningMsg#~" .. modifications .. "%*")
						end
						-- Then show any pure additions/deletions
						if pure_additions > 0 then
							table.insert(status_parts, "%#String#+" .. pure_additions .. "%*")
						end
						if pure_deletions > 0 then
							table.insert(status_parts, "%#ErrorMsg#-" .. pure_deletions .. "%*")
						end
					else
						-- Pure additions or pure deletions (no modifications)
						if added > 0 then
							table.insert(status_parts, "%#String#+" .. added .. "%*")
						end
						if deleted > 0 then
							table.insert(status_parts, "%#ErrorMsg#-" .. deleted .. "%*")
						end
					end
				end
			end
		elseif status_code:match('A.') then
			table.insert(status_parts, "%#String#+new%*")
		elseif status_code:match('D.') then
			table.insert(status_parts, "%#ErrorMsg#-del%*")
		end

		if #status_parts > 0 then
			git_info = git_info .. " " .. table.concat(status_parts, " ")
		end
	end

	return git_info .. " "
end -- Build the statusline
function M.statusline()
	local components = {
		get_mode(),  -- Left: Current mode
		"%#Comment#|%*", -- Left: Separator
		get_git_status(), -- Left: Git branch and status
		"%=",        -- Center alignment start
		get_filename(), -- Center: Filename with icon
		"%=",        -- Right alignment start
		get_diagnostics(), -- Right: LSP diagnostics
		get_lsp_status(), -- Right: LSP clients
		get_position(), -- Right: Line:col/total
	}

	return table.concat(components, "")
end

-- Setup function
function M.setup()
	vim.o.statusline = "%!v:lua.require('config.statusline').statusline()"

	vim.api.nvim_create_autocmd("ColorScheme", {
		group = vim.api.nvim_create_augroup("StatuslineRefresh", { clear = true }),
		callback = function()
			vim.cmd("redrawstatus")
		end,
	})
end

return M
