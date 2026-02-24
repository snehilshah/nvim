-- ============================================================================
-- Search & Replace
-- ============================================================================

return {
  "MagicDuck/grug-far.nvim",
  opts = {
    -- engines, default is "ripgrep", but "astgrep" can be specified
    engine = "ripgrep",
    -- whether to start in insert mode
    startInInsertMode = true,
    -- debounce time for search (in ms)
    debounceMs = 500,
    -- minimum number of characters to start search
    minSearchChars = 2,
    -- max number of parallel replacements tasks
    maxWorkers = 4,
    -- specifies the command to run for the rg search
    rgOptions = { "--smart-case", "--hidden", "--glob=!.git/" },
    -- folding related options
    folding = {
      enabled = true,
      foldcolumn = "1",
    },
    -- history settings
    history = {
      autoSave = { enabled = true },
    },
    -- result location settings (with context)
    resultLocation = {
      showNumberLabel = true,
      numberLabelFormat = " [%d] ",
    },
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
    },
    {
      "<leader>sW",
      function()
        require("grug-far").open({ prefills = { search = vim.fn.expand("<cword>") } })
      end,
      desc = "Replace Word Under Cursor",
    },
    {
      "<leader>sF",
      function()
        require("grug-far").open({ prefills = { paths = vim.fn.expand("%") } })
      end,
      desc = "Replace in Current File",
    },
    {
      "<leader>sv",
      function()
        require("grug-far").with_visual_selection()
      end,
      mode = "v",
      desc = "Replace Visual Selection",
    },
  },
}
