-- lua/custom/plugins/mini.lua

return {
	{
		'echasnovski/mini.nvim',
		config = function()
			local statusline = require 'mini.statusline'
			statusline.setup { use_icons = true }

			local minigit = require 'mini.git'
			minigit.setup { blame= { height=1 } }

			local minidiff = require 'mini.diff'
			minidiff.setup = { view = { style='sign'}}
		end
	}
}
