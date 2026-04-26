return {
  "nvim-mini/mini.nvim",
  priority = 1000,
  lazy = false,
  version = false,
  dependencies = { 'nvim-treesitter/nvim-treesitter-textobjects', branch = 'main' },
  config = function()
    require("mini.cmdline").setup()
    require("mini.cursorword").setup()
    require("mini.icons").setup({
      file = {
        ["Dockerfile"] = { glyph = "󰡨", hl = "MiniIconsBlue" },
        ["Makefile"] = { glyph = "", hl = "MiniIconsRed" },
        [".dockerignore"] = { glyph = "󰡨", hl = "MiniIconsBlue" },
        [".gitignore"] = { glyph = "", hl = "MiniIconsOrange" },
        ["README.md"] = { glyph = "", hl = "MiniIconsRed" },
      },
      filetype = {
        dockerfile = { glyph = "󰡨", hl = "MiniIconsBlue" },
        make = { glyph = "", hl = "MiniIconsRed" },
        markdown = { glyph = "", hl = "MiniIconsBlue" },
        go = { glyph = "", hl = "MiniIconsAzure" },
        json = { glyph = "", hl = "MiniIconsYellow" },
        jsonc = { glyph = "", hl = "MiniIconsYellow" },
      },
      extension = {
        log = { glyph = "󰌱", hl = "MiniIconsGreen" },
        md = { glyph = "", hl = "MiniIconsBlue" },
      },
    })
    MiniIcons.mock_nvim_web_devicons()
    require("mini.operators").setup({
      -- All operators under <leader>o ("operator") to keep g* free for LSP
      replace = { prefix = "<leader>or" },
      exchange = { prefix = "<leader>ox" },
      sort = { prefix = "<leader>os" },
      multiply = { prefix = "<leader>om" },
      evaluate = { prefix = "<leader>oe" },
    })
    -- Add/delete/replace surroundings (brackets, quotes, etc.)
    -- - saiw) - [S]urround [A]dd [I]nner [W]ord [)]Paren
    -- - sd'   - [S]urround [D]elete [']quotes
    -- - sr)'  - [S]urround [R]eplace [)] [']
    require("mini.surround").setup()

    -- Split/join arguments, tables, arrays, etc.
    -- - gS    - Toggle between split and join
    require("mini.splitjoin").setup({
      mappings = {
        toggle = "gS",
        split = "",
        join = "",
      },
    })
    local miniai = require("mini.ai")
    miniai.setup({
      n_lines = 300,
      custom_textobjects = {
        f = miniai.gen_spec.treesitter({ a = "@function.outer", i = "@function.inner" }, {}),
        -- Whole buffer.
        g = function()
          local from = { line = 1, col = 1 }
          local to = {
            line = vim.fn.line("$"),
            col = math.max(vim.fn.getline("$"):len(), 1),
          }
          return { from = from, to = to }
        end,
      },
      -- Disable error feedback.
      silent = true,
      -- Don't use the previous or next text object.
      search_method = "cover",
      mappings = {
        -- Disable next/last variants.
        around_next = "",
        inside_next = "",
        around_last = "",
        inside_last = "",
      },
    })
    require("mini.move").setup({})
  end,
}
