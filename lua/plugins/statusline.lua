return {
	"nvim-lualine/lualine.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons", "lewis6991/gitsigns.nvim", "catppuccin/nvim" },
	opts = {
		options = {
			theme = "catppuccin",
			section_separators = { left = "", right = "" },
			component_separators = { left = "", right = "" },
			icons_enabled = true,
		},
		sections = {
			lualine_a = { "mode" },
			lualine_b = {
				"branch",
				{
					"diff",
					colored = true,
					symbols = { added = " ", modified = " ", removed = " " },
					source = function()
						local gitsigns = vim.b.gitsigns_status_dict
						if gitsigns then
							return {
								added = gitsigns.added,
								modified = gitsigns.changed,
								removed = gitsigns.removed
							}
						end
					end,
				}
			},
			-- path = 0 -> filename, 1 -> relative path, 2 -> absolute path
			lualine_c = { { "filename", path = 1 } },
			lualine_x = { "filetype" },
			lualine_y = {
				{
					function()
						-- Check if search is active
						if vim.v.hlsearch == 1 and vim.fn.getreg("/") ~= "" then
							local ok, result = pcall(vim.fn.searchcount, { maxcount = 999, timeout = 100 })
							if ok and result and result.total > 0 then
								local current = result.current
								local total = result.total

								if result.incomplete == 1 then
									return string.format(" ?/%d", total)
								elseif result.incomplete == 2 then
									return string.format(" %d/>%d", current, total)
								else
									return string.format(" %d/%d", current, total)
								end
							end
						end

						-- Show LSP name when no search is active
						local clients = vim.lsp.get_clients({ bufnr = 0 })
						if #clients == 0 then
							return ""
						end

						return " " .. clients[1].name
					end,
					color = function()
						-- Orange for search, default for LSP
						if vim.v.hlsearch == 1 and vim.fn.getreg("/") ~= "" then
							return { fg = "#ff9e64" }
						else
							return nil
						end
					end,
				}
			},
			lualine_z = { "location" },
		},
	},
}
