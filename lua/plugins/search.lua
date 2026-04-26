-- ============================================================================
-- Search & Replace
-- ============================================================================

return {
  "MagicDuck/grug-far.nvim",
  opts = {
    -- Disable folding.
    folding = { enabled = false },
    -- Don't numerate the result list.
    resultLocation = { showNumberLabel = false },
  },
  cmd = "GrugFar",
  keys = {
    {
      "<leader>sR",
      function()
        require("grug-far").open()
      end,
      mode = { "n", "v" },
      desc = "Open Grug Far",
      transient = true,
    },
    {
      "<leader>sW",
      function()
        require("grug-far").open({ prefills = { search = vim.fn.expand("<cword>") } })
      end,
      desc = "Replace Word Under Cursor",
      transient = true,
    },
    {
      "<leader>sv",
      function()
        require("grug-far").with_visual_selection()
      end,
      mode = "v",
      desc = "Replace Visual Selection",
      transient = true,
    },
  },
}
