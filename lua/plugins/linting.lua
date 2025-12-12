return {
	"mfussenegger/nvim-lint",
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		local lint = require("lint")
		-- Customize golangcilint to ignore exit codes (golangci-lint exits with code 1-3 when issues are found)
		local golangcilint = require("lint").linters.golangcilint
		golangcilint.ignore_exitcode = true
		lint.linters_by_ft = {
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
			md = { "markdownlint-cli2" },
			toml = { "tombi" },
			-- javascript and typescript handled by eslint_d via esmuellert/nvim-eslint see esleent.lua
			-- in case of biome setup biome server is started as a lsp see lspconfig
		}

		local lint_augroup = vim.api.nvim_create_augroup("lint", { clear = true })

		vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
			group = lint_augroup,
			callback = function()
				lint.try_lint()
			end,
		})

		vim.keymap.set("n", "<leader>ll", function()
			lint.try_lint()
			vim.notify("Linting... with", vim.log.levels.INFO)
		end, { desc = "Trigger linting for current file" })

		vim.keymap.set("n", "<leader>lk", function()
			local linters = lint.linters_by_ft[vim.bo.filetype] or {}
			if #linters == 0 then
				print("No linters configured for filetype: " .. vim.bo.filetype)
			else
				print("Linters for " .. vim.bo.filetype .. ": " .. table.concat(linters, ", "))
			end
		end, { desc = "Show available linters for current filetype" })
		--
		-- 	-- Stop eslint_d daemon when exiting Neovim (only if running)
		-- 	vim.api.nvim_create_autocmd("VimLeavePre", {
		-- 		group = lint_augroup,
		-- 		callback = function()
		-- 			vim.fn.system("eslint_d stop")
		-- 		end,
		-- 	})
	end,
}
