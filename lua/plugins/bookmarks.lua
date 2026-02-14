-- ============================================================================
-- Bookmarks (Ghost Text Annotations)
-- ============================================================================
-- Annotate lines with virtual text notes without modifying the actual files.
-- Bookmarks are scoped per git branch and searchable via Snacks picker.

return {
  "TheNoeTrevino/haunt.nvim",
  event = "VeryLazy",
  ---@class HauntConfig
  opts = {
    sign = "󱙝",
    sign_hl = "DiagnosticInfo",
    virt_text_hl = "HauntAnnotation", -- links to DiagnosticVirtualTextHint
    annotation_prefix = " 󰆉 ",
    annotation_suffix = "",
    virt_text_pos = "eol",
    per_branch_bookmarks = true,
    picker = "snacks",
    picker_keys = {
      delete = { key = "d", mode = { "n" } },
      edit_annotation = { key = "a", mode = { "n" } },
    },
  },
  init = function()
    local haunt = require("haunt.api")
    local haunt_picker = require("haunt.picker")
    local map = vim.keymap.set
    local prefix = "<leader>m"

    -- Annotations
    map("n", prefix .. "a", function()
      haunt.annotate()
    end, { desc = "Annotate line" })
    map("n", prefix .. "t", function()
      haunt.toggle_annotation()
    end, { desc = "Toggle annotation" })
    map("n", prefix .. "T", function()
      haunt.toggle_all_lines()
    end, { desc = "Toggle all annotations" })
    map("n", prefix .. "d", function()
      haunt.delete()
    end, { desc = "Delete bookmark" })
    map("n", prefix .. "C", function()
      haunt.clear_all()
    end, { desc = "Clear all bookmarks" })

    -- Navigation
    map("n", prefix .. "n", function()
      haunt.next()
    end, { desc = "Next bookmark" })
    map("n", prefix .. "p", function()
      haunt.prev()
    end, { desc = "Previous bookmark" })

    -- Picker
    map("n", prefix .. "f", function()
      haunt_picker.show()
    end, { desc = "Find bookmarks (picker)" })

    -- Quickfix
    map("n", prefix .. "q", function()
      haunt.to_quickfix({ current_buffer = true })
    end, { desc = "Bookmarks → quickfix (buffer)" })
    map("n", prefix .. "Q", function()
      haunt.to_quickfix()
    end, { desc = "Bookmarks → quickfix (all)" })

    -- Yank locations
    map("n", prefix .. "y", function()
      haunt.yank_locations({ current_buffer = true })
    end, { desc = "Yank bookmark locations (buffer)" })
    map("n", prefix .. "Y", function()
      haunt.yank_locations()
    end, { desc = "Yank bookmark locations (all)" })
  end,
}
