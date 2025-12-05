return {
	"esmuellert/nvim-eslint",
	config = function()
		local eslint_configs = {
			".eslintrc",
			".eslintrc.js",
			".eslintrc.cjs",
			".eslintrc.mjs",
			".eslintrc.json",
			".eslintrc.yaml",
			".eslintrc.yml",
			"eslint.config.js",
			"eslint.config.mjs",
			"eslint.config.cjs",
			"eslint.config.ts",
		}

		local function has_eslint_config()
			for _, config in ipairs(eslint_configs) do
				if vim.fn.filereadable(vim.fn.getcwd() .. "/" .. config) == 1 then
					return true
				end
			end
			return false
		end

		if has_eslint_config() then
			require("nvim-eslint").setup({})
		end
	end,
}
