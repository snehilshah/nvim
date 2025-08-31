local M = {}

-- Track current layout index
local idx = 1
local preferred = {
	"ivy_taller",
	"ivy_wider_results",
	"ivy_wider_preview",
	"bottom",
	"default",
	"dropdown",
	"ivy",
	"ivy_split",
	"left",
	"right",
	"select",
	"sidebar",
	"telescope",
	"top",
	"vertical",
	"vscode",
}

local layouts_setup = false

M.setup_layouts = function()
	if layouts_setup then
		return
	end

	local layouts = require("snacks.picker.config.layouts")

	-- Define custom layouts
	layouts.ivy_taller = vim.tbl_deep_extend("keep", { layout = { height = 0.8 } }, layouts.ivy)

	-- ivy_wider_results: wider results pane (narrower preview)
	layouts.ivy_wider_results = vim.deepcopy(layouts.ivy)
	layouts.ivy_wider_results.layout[2][2].width = 0.3

	-- ivy_wider_preview: wider preview pane (narrower results)
	layouts.ivy_wider_preview = vim.deepcopy(layouts.ivy)
	layouts.ivy_wider_preview.layout[2][2].width = 0.8

	layouts_setup = true
end

-- Get the current preferred layout
M.preferred_layout = function()
	return preferred[idx]
end

-- Cycle to the next preferred layout
M.set_next_preferred_layout = function(picker)
	idx = idx % #preferred + 1
	picker:set_layout(preferred[idx])
end

return M
