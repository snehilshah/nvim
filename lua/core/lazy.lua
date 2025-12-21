-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
	local lazyrepo = "https://github.com/folke/lazy.nvim.git"
	local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
	if vim.v.shell_error ~= 0 then
		vim.api.nvim_echo({
			{ "Failed to clone lazy.nvim:\n", "ErrorMsg" },
			{ out, "WarningMsg" },
			{ "\nPress any key to exit..." },
		}, true, {})
		vim.fn.getchar()
		os.exit(1)
	end
end
vim.opt.rtp:prepend(lazypath)

-- Setup lazy.nvim
require("lazy").setup({
	change_detection = {
		enabled = true,
		notify = false,
	},
	spec = {
		{ import = "plugins" },
		{ import = "plugins.languages" },
		{ import = "plugins.ai" },
		{ import = "plugins.lsp" },
	},
	ui = {
		border = "rounded",
		backdrop = 80,
		title = "$NH!L",
		title_pos = "left",
	},
	-- colorscheme that will be used when installing plugins.
	install = { colorscheme = { "gruvbox-material" } },
	-- automatically check for plugin updates
	checker = { enabled = true },
	-- disable these inbuilt plugins as not used
	git = {
		throttle = {
			enabled = false,
			-- max 2 ops every 5 seconds
			rate = 2,
			duration = 5 * 1000, -- in ms
		},
		cooldown = 300,
	},
	performance = {
		rtp = {
			disabled_plugins = {
				"gzip",
				"tarPlugin",
				"tohtml",
				"tutor",
				"zipPlugin",
			},
		},
	},
})
