return {
	{
		"mfussenegger/nvim-lint",
		event = { "BufReadPre", "BufNewFile" },
		config = function()
			local lint = require("lint")

			-- Customize golangcilint to ignore exit codes
			local golangcilint = require("lint").linters.golangcilint
			golangcilint.ignore_exitcode = true

			-- biome-check
			lint.linters["biome-check"] = {
				cmd = "biome",
				stdin = false,
				args = { "check", "." },
				ignore_exitcode = true,
				parser = require("lint.parser").from_pattern(
					"^([^:]+):(%d+):(%d+): (.+)$",
					{ "file", "lnum", "col", "message" },
					nil,
					{ ["source"] = "biome", ["severity"] = vim.diagnostic.severity.WARN }
				),
			}

			lint.linters_by_ft = {
				javascript = { "biome-check" },
				javascriptreact = { "biome-check" },
				typescript = { "biome-check" },
				typescriptreact = { "biome-check" },
				json = { "jsonlint" },
				jsonc = { "jsonlint" },
				go = { "golangcilint" },
				sh = { "shellcheck" },
				bash = { "shellcheck" },
				zsh = { "shellcheck" },
				dockerfile = { "hadolint" },
				yaml = { "yamllint" },
				yml = { "yamllint" },
				c = { "cppcheck" },
				cpp = { "cppcheck" },
			}

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
