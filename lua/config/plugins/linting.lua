return {
	{
		"mfussenegger/nvim-lint",
		event = { "BufReadPre", "BufNewFile" },
		config = function()
			local lint = require("lint")

			-- Customize golangcilint to ignore exit codes (golangci-lint exits with code 1-3 when issues are found)
			local golangcilint = require('lint').linters.golangcilint
			golangcilint.ignore_exitcode = true

			-- Add nilaway linter configuration
			lint.linters.nilaway = {
				cmd = 'nilaway',
				stdin = false,
				args = {
					'-include-tests', -- Include test files in analysis
					'./...', -- Analyze all packages
				},
				ignore_exitcode = true,
				parser = require('lint.parser').from_pattern(
					'^([^:]+):(%d+):(%d+): (.+)$',
					{ 'file', 'lnum', 'col', 'message' },
					nil,
					{
						['source'] = 'nilaway',
						['severity'] = vim.diagnostic.severity.WARN,
					}
				),
			}

			lint.linters_by_ft = {
				-- C/C++
				c = { "cppcheck" },
				cpp = { "cppcheck" },
				-- JavaScript/TypeScript
				javascript = { "eslint_d" },
				javascriptreact = { "eslint_d" },
				typescript = { "eslint_d" },
				typescriptreact = { "eslint_d" },
				-- JSON
				json = { "jsonlint" },
				-- Go
				go = { "golangcilint", "nilaway" },
				-- Shell scripts
				sh = { "shellcheck" },
				bash = { "shellcheck" },
				zsh = { "shellcheck" },
				-- Docker
				dockerfile = { "hadolint" },
				-- YAML
				yaml = { "yamllint" },
				yml = { "yamllint" },
			}

			-- Auto lint on save and when leaving insert mode
			local lint_augroup = vim.api.nvim_create_augroup("lint", { clear = true })

			vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
				group = lint_augroup,
				callback = function()
					local linters = lint.linters_by_ft[vim.bo.filetype]
					if linters and #linters > 0 then
						lint.try_lint()
					end
				end,
			})

			-- Manual linting command
			vim.keymap.set("n", "<leader>ll", function()
				lint.try_lint()
				vim.notify("Linting...", vim.log.levels.INFO)
			end, { desc = "Trigger linting for current file" })

			vim.keymap.set("n", "<leader>li", function()
				local linters = lint.linters_by_ft[vim.bo.filetype] or {}
				if #linters == 0 then
					print("No linters configured for filetype: " .. vim.bo.filetype)
				else
					print("Linters for " .. vim.bo.filetype .. ": " .. table.concat(linters, ", "))
				end
			end, { desc = "Show available linters for current filetype" })
		end,
	},
}
