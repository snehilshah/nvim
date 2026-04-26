-- hl_color = { bg = "#DDC7A1", fg = "#1D2021" }, -- Gruvbox Material yellow on dark bg
-- My own version of Dracula.

-- Reset highlighting.
vim.cmd.highlight("clear")
if vim.fn.exists("syntax_on") then
  vim.cmd.syntax("reset")
end
vim.o.termguicolors = true
vim.g.colors_name = "cosmic-gleam"

-- stylua: ignore start
local colors = {
  bright_white   = "#f8f9e8",
  cherry         = "#f9c8e5",
  honeydew       = "#E5F4E3",
  almost_black   = "#090E13",
  cyan           = "#75E6E0",
  dark_cyan      = "#198A84",
  ocean          = "#167974",
  sea_green      = "#20ACA5",
  blue_green     = "#07A0C3",
  turquoise      = "#3CDBD3",
  french_blue    = "#003F91",
  sky            = "#b3e6db",
  bright_blue    = "#afd9e6",
  blue           = "#b2caed",
  bright_green   = "#cbe3b3",
  green          = "#a4daa4",
  olive          = "#7E9178",
  aqua           = "#83c092",
  mint_leaf      = "#57B27C",
  -- sea_green      = "#3E885B",
  bright_red     = "#EA2D1F",
  red            = "#A81A10",
  orange         = "#f7a182",
  pink           = "#db7670",
  purple         = "#BAA0E8",
  lavender       = "#6272A4",
  lilac          = "#6D5978",
  lime           = "#dbe6af", -- just lime from evergarden
  gruvbox_yellow = "#d8a657",
  grey           = "#A9ABAC",
  gutter_fg      = "#1d2021",
  selection      = "#3C4148",
  menu           = "#171c1f",
  visual         = "#58686d",
  fg             = "#DFCBB9", --  miss-dracula #f6f6f5 to dacctal #f4decd to cosmic-gleam #d4be98
  nontext        = "#d4be98",
  camel          = "#C19875",
  comment        = "#585f5b", -- miss-dracula #B08BBB to dacctal #888e7b to cosmic-gleam #d5c4a1 now subtext0 from evergarden
  bg             = "#1d2020", -- miss-dracula #282a36 to dacctal #1e2528 to cosmic-gleam #0f0f0f
  darker_bg      = "#131515"
}
-- stylua: ignore end

local test = {
  "#d9ed92",
  "#b5e48c",
  "#99d98c",
  "#76c893",
  "#52b69a",
  "#34a0a4",
  "#168aad",
  "#1a759f",
  "#1e6091",
  "#184e77",
}

local colors2 = {
  bg = "#0f0f0f",
  gray0 = "#141514",
  gray1 = "#1e1f1e",
  gray2 = "#272a28",
  gray3 = "#3b403c",
  gray4 = "#585f5b",
  gray5 = "#6c756f",
  gray6 = "#888e7b",
  gray7 = "#9a9c8b",
  gray8 = "#b6b69a",
  gray9 = "#d9cdb5",
  gray10 = "#e3d6c9",
  fg = "#f4decd",
  red = "#f16e65",
  lred = "#ef968f",
  orange = "#ef934d",
  yellow = "#efbf71",
  green = "#7ec97e",
  lgreen = "#a4daa4",
  cyan = "#7ec9a3",
  lcyan = "#abd4bf",
  lblue = "#b0d4e8",
  blue = "#71b4d6",
  magenta = "#e28dc6",
  lmagenta = "#ebadd6",
  purple = "#E7A1D7",
}

local color3 = {
  red = "#f57f82",
  orange = "#f7a182",
  yellow = "#f5d098",
  lime = "#dbe6af",
  green = "#cbe3b3",
  skye = "#b3e6db",
  aqua = "#b3e3ca",
  snow = "#afd9e6",
  blue = "#b2caed",
  purple = "#d2bdf3",
  pink = "#f3c0e5",
  cherry = "#fae6ef",
  text = "#f8f9e8",
  subtext1 = "#adc9bc",
  subtext0 = "#96b4aa",
  overlay2 = "#839e9a",
  overlay1 = "#6f8788",
  overlay0 = "#58686d",
  surface2 = "#4a585c",
  surface1 = "#374145",
  surface0 = "#262f33",
  base = "#1e2528",
  mantle = "#191e21",
  crust = "#171c1f",
}

-- Terminal colors.
vim.g.terminal_color_0 = colors.almost_black
vim.g.terminal_color_1 = colors.red
vim.g.terminal_color_2 = colors.green
vim.g.terminal_color_3 = colors.yellow
vim.g.terminal_color_4 = colors.purple
vim.g.terminal_color_5 = colors.pink
vim.g.terminal_color_6 = colors.cyan
vim.g.terminal_color_7 = colors.cherry
vim.g.terminal_color_8 = colors.selection
vim.g.terminal_color_9 = colors.bright_red
vim.g.terminal_color_10 = colors.bright_green
vim.g.terminal_color_11 = colors.lime
vim.g.terminal_color_12 = colors.bright_blue
vim.g.terminal_color_13 = colors.purple
vim.g.terminal_color_14 = colors.sky
vim.g.terminal_color_15 = colors.bright_white
vim.g.terminal_color_background = colors.bg
vim.g.terminal_color_foreground = colors.fg

---@type table<string, vim.api.keyset.highlight>
local groups = {
  -- Builtins.
  Boolean = { fg = colors.cyan },
  Character = { fg = colors.green },
  ColorColumn = { bg = colors.selection },
  Comment = { fg = colors.comment, italic = true },
  Conceal = { fg = colors.comment },
  Conditional = { fg = colors.pink },
  Constant = { fg = colors.yellow },
  CurSearch = { fg = colors.almost_black, bg = colors.pink },
  Cursor = { fg = colors.almost_black, bg = colors.cherry },
  CursorColumn = { bg = colors.almost_black },
  CursorLine = { bg = colors.selection },
  CursorLineNr = { fg = colors.lilac, bold = true },
  Define = { fg = colors.purple },
  Directory = { fg = colors.cyan },
  EndOfBuffer = { fg = colors.bg },
  Error = { fg = colors.bright_red },
  ErrorMsg = { fg = colors.bright_red },
  FoldColumn = {},
  Folded = { bg = colors.almost_black },
  Function = { fg = colors.yellow },
  Identifier = { fg = colors.cyan },
  IncSearch = { link = "CurSearch" },
  Include = { fg = colors.purple },
  Keyword = { fg = colors.cyan },
  Label = { fg = colors.cyan },
  LineNr = { fg = colors.lilac },
  Macro = { fg = colors.purple },
  MatchParen = { sp = colors.fg, underline = true },
  NonText = { fg = colors.nontext },
  Normal = { fg = colors.fg, bg = colors.bg },
  NormalFloat = { fg = colors.fg, bg = colors.bg },
  Number = { fg = colors.orange },
  Pmenu = { fg = colors.cherry, bg = colors.bg },
  PmenuSbar = { bg = colors.blue },
  PmenuSel = { fg = colors.cyan, bg = colors.selection },
  PmenuThumb = { bg = colors.selection },
  PreCondit = { fg = colors.cyan },
  PreProc = { fg = colors.yellow },
  Question = { fg = colors.purple },
  Repeat = { fg = colors.pink },
  Search = { fg = colors.bg, bg = colors.orange },
  SignColumn = { bg = colors.bg },
  Special = { fg = colors.green, italic = true },
  SpecialComment = { fg = colors.comment, italic = true },
  SpecialKey = { fg = colors.nontext },
  SpellBad = { sp = colors.bright_red, underline = true },
  SpellCap = { sp = colors.yellow, underline = true },
  SpellLocal = { sp = colors.yellow, underline = true },
  SpellRare = { sp = colors.yellow, underline = true },
  Statement = { fg = colors.purple },
  StatusLine = { fg = colors.cherry, bg = colors.almost_black },
  StorageClass = { fg = colors.pink },
  Structure = { fg = colors.yellow },
  Substitute = { fg = colors.pink, bg = colors.orange, bold = true },
  Title = { fg = colors.cyan },
  Todo = { fg = colors.purple, bold = true, italic = true },
  Type = { fg = colors.blue, bold = true },
  TypeDef = { fg = colors.yellow },
  Underlined = { fg = colors.cyan, underline = true },
  VertSplit = { fg = colors.cherry },
  Visual = { bg = colors.visual },
  VisualNOS = { fg = colors.visual },
  WarningMsg = { fg = colors.yellow },
  WildMenu = { fg = colors.almost_black, bg = colors.cherry },

  -- Treesitter.
  ["@annotation"] = { fg = colors.yellow },
  ["@attribute"] = { fg = colors.cyan },
  ["@boolean"] = { fg = colors.purple },
  ["@character"] = { fg = colors.green },
  ["@constant"] = { fg = colors.purple },
  ["@constant.builtin"] = { fg = colors.purple },
  ["@constant.macro"] = { fg = colors.cyan },
  ["@constructor"] = { fg = colors.cyan },
  ["@error"] = { fg = colors.bright_red },
  ["@function"] = { fg = colors.green },
  ["@function.builtin"] = { fg = colors.cyan },
  ["@function.macro"] = { fg = colors.green },
  ["@function.method"] = { fg = colors.mint_leaf },
  ["@keyword"] = { fg = colors.pink },
  ["@keyword.conditional"] = { fg = colors.pink },
  ["@keyword.exception"] = { fg = colors.purple },
  ["@keyword.function"] = { fg = colors.cyan },
  ["@keyword.function.ruby"] = { fg = colors.pink },
  ["@keyword.include"] = { fg = colors.pink },
  ["@keyword.operator"] = { fg = colors.pink },
  ["@keyword.repeat"] = { fg = colors.pink },
  ["@label"] = { fg = colors.cyan },
  ["@markup"] = { fg = colors.orange },
  ["@markup.emphasis"] = { fg = colors.yellow, italic = true },
  ["@markup.heading"] = { fg = colors.pink, bold = true },
  ["@markup.link"] = { fg = colors.orange, bold = true },
  ["@markup.link.uri"] = { fg = colors.yellow, italic = true },
  ["@markup.list"] = { fg = colors.cyan },
  ["@markup.raw"] = { fg = colors.yellow },
  ["@markup.strong"] = { fg = colors.orange, bold = true },
  ["@markup.underline"] = { fg = colors.orange },
  ["@module"] = { fg = colors.orange },
  ["@number"] = { fg = colors.purple },
  ["@number.float"] = { fg = colors.green },
  ["@operator"] = { fg = colors.pink },
  ["@parameter.reference"] = { fg = colors.orange },
  ["@property"] = { fg = colors.purple },
  ["@punctuation.bracket"] = { fg = colors.green },
  ["@punctuation.delimiter"] = { fg = colors.fg },
  ["@string"] = { fg = colors.gruvbox_yellow, italic = true },
  ["@string.escape"] = { fg = colors.aqua },
  ["@string.regexp"] = { fg = colors.aqua },
  ["@string.special.symbol"] = { fg = colors.aqua },
  ["@structure"] = { fg = colors.purple },
  ["@tag"] = { fg = colors.cyan },
  ["@tag.attribute"] = { fg = colors.green },
  ["@tag.delimiter"] = { fg = colors.cyan },
  ["@type"] = { fg = colors.blue, bold = true },
  ["@type.builtin"] = { fg = colors.sky, italic = true },
  ["@type.qualifier"] = { fg = colors.pink },
  ["@variable"] = { fg = colors.fg },
  ["@variable.builtin"] = { fg = colors.purple },
  ["@variable.member"] = { fg = colors.orange },
  ["@variable.parameter"] = { fg = colors.orange },

  -- Semantic tokens.
  ["@class"] = { fg = colors.cyan },
  ["@decorator"] = { fg = colors.cyan },
  ["@enum"] = { fg = colors.cyan },
  ["@enumMember"] = { fg = colors.purple },
  ["@event"] = { fg = colors.cyan },
  ["@interface"] = { fg = colors.cyan },
  ["@lsp.type.class"] = { fg = colors.cyan },
  ["@lsp.type.decorator"] = { fg = colors.green },
  ["@lsp.type.enum"] = { fg = colors.cyan },
  ["@lsp.type.enumMember"] = { fg = colors.purple },
  ["@lsp.type.function"] = { fg = colors.mint_leaf },
  ["@lsp.type.interface"] = { fg = colors.cyan },
  ["@lsp.type.macro"] = { fg = colors.cyan },
  ["@lsp.type.method"] = { fg = colors.green },
  ["@lsp.type.namespace"] = { fg = colors.orange },
  ["@lsp.type.parameter"] = { fg = colors.orange },
  ["@lsp.type.property"] = { fg = colors.purple },
  ["@lsp.type.struct"] = { fg = colors.cyan },
  ["@lsp.type.type"] = { fg = colors.sea_green },
  ["@lsp.type.variable"] = { fg = colors.fg },
  ["@modifier"] = { fg = colors.cyan },
  ["@regexp"] = { fg = colors.yellow },
  ["@struct"] = { fg = colors.cyan },
  ["@typeParameter"] = { fg = colors.cyan },

  -- Package manager.
  LazyDimmed = { fg = colors.grey },

  -- LSP.
  ComplHint = { link = "Comment" },
  DiagnosticDeprecated = { strikethrough = true, fg = colors.fg },
  DiagnosticError = { fg = colors.red },
  DiagnosticFloatingError = { fg = colors.red },
  DiagnosticFloatingHint = { fg = colors.cyan },
  DiagnosticFloatingInfo = { fg = colors.cyan },
  DiagnosticFloatingWarn = { fg = colors.yellow },
  DiagnosticHint = { fg = colors.cyan },
  DiagnosticInfo = { fg = colors.cyan },
  DiagnosticUnderlineError = { undercurl = true, sp = colors.red },
  DiagnosticUnderlineHint = { undercurl = true, sp = colors.cyan },
  DiagnosticUnderlineInfo = { undercurl = true, sp = colors.cyan },
  DiagnosticUnderlineWarn = { undercurl = true, sp = colors.yellow },
  DiagnosticUnnecessary = { fg = colors.grey, italic = true },
  DiagnosticVirtualTextError = { fg = colors.red, bg = colors.red },
  DiagnosticVirtualTextHint = { fg = colors.cyan, bg = colors.blue },
  DiagnosticVirtualTextInfo = { fg = colors.cyan, bg = colors.blue },
  DiagnosticVirtualTextWarn = { fg = colors.yellow, bg = colors.yellow },
  DiagnosticWarn = { fg = colors.yellow },
  LspCodeLens = { fg = colors.cyan, underline = true },
  LspFloatWinBorder = { fg = colors.comment },
  LspInlayHint = { fg = colors.lavender, italic = true },
  LspReferenceRead = { bg = colors.blue },
  LspReferenceText = {},
  LspReferenceWrite = { bg = colors.red },
  LspSignatureActiveParameter = { bold = true, underline = true, sp = colors.fg },

  -- Completions:
  BlinkCmpKindClass = { link = "@type" },
  BlinkCmpKindColor = { link = "DevIconCss" },
  BlinkCmpKindConstant = { link = "@constant" },
  BlinkCmpKindConstructor = { link = "@type" },
  BlinkCmpKindEnum = { link = "@variable.member" },
  BlinkCmpKindEnumMember = { link = "@variable.member" },
  BlinkCmpKindEvent = { link = "@constant" },
  BlinkCmpKindField = { link = "@variable.member" },
  BlinkCmpKindFile = { link = "Directory" },
  BlinkCmpKindFolder = { link = "Directory" },
  BlinkCmpKindFunction = { link = "@function" },
  BlinkCmpKindInterface = { link = "@type" },
  BlinkCmpKindKeyword = { link = "@keyword" },
  BlinkCmpKindMethod = { link = "@function.method" },
  BlinkCmpKindModule = { link = "@module" },
  BlinkCmpKindOperator = { link = "@operator" },
  BlinkCmpKindProperty = { link = "@property" },
  BlinkCmpKindReference = { link = "@parameter.reference" },
  BlinkCmpKindSnippet = { link = "@markup" },
  BlinkCmpKindStruct = { link = "@structure" },
  BlinkCmpKindText = { link = "@markup" },
  BlinkCmpKindTypeParameter = { link = "@variable.parameter" },
  BlinkCmpKindUnit = { link = "@variable.member" },
  BlinkCmpKindValue = { link = "@variable.member" },
  BlinkCmpKindVariable = { link = "@variable" },
  BlinkCmpLabelDeprecated = { link = "DiagnosticDeprecated" },
  BlinkCmpLabelDescription = { fg = colors.grey, italic = true },
  BlinkCmpLabelDetail = { fg = colors.grey, bg = colors.bg },
  BlinkCmpMenu = { bg = colors.bg },
  BlinkCmpMenuBorder = { bg = colors.bg },

  -- Dap UI.
  DapStoppedLine = { default = true, link = "Visual" },
  NvimDapVirtualText = { fg = colors.lavender, underline = true },

  -- Diffs.
  DiffAdd = { fg = colors.green, bg = colors.green },
  DiffChange = { fg = colors.cherry, bg = colors.yellow },
  DiffDelete = { fg = colors.red, bg = colors.red },
  DiffText = { fg = colors.orange, bg = colors.yellow, bold = true },
  DiffviewFolderSign = { fg = colors.cyan },
  DiffviewNonText = { fg = colors.lilac },
  diffAdded = { fg = colors.bright_green, bold = true },
  diffChanged = { fg = colors.lime, bold = true },
  diffRemoved = { fg = colors.bright_red, bold = true },

  -- Command line.
  MoreMsg = { fg = colors.bright_white, bold = true },
  MsgArea = { fg = colors.cyan },
  MsgSeparator = { fg = colors.lilac },

  -- Winbar styling.
  WinBar = { fg = colors.fg, bg = colors.almost_black },
  WinBarNC = { bg = colors.almost_black },
  WinBarDir = { fg = colors.purple, bg = colors.almost_black, italic = true },
  WinBarSeparator = { fg = colors.green, bg = colors.almost_black },

  -- Quickfix window.
  QuickFixLine = { italic = true, bg = colors.red },

  -- Gitsigns.
  GitSignsAdd = { fg = colors.bright_green },
  GitSignsChange = { fg = colors.cyan },
  GitSignsCurrentLineBlame = { fg = colors.lavender },
  GitSignsDelete = { fg = colors.bright_red },
  GitSignsStagedAdd = { fg = colors.orange },
  GitSignsStagedChange = { fg = colors.orange },
  GitSignsStagedDelete = { fg = colors.orange },

  -- Gitlinker.
  NvimGitLinkerHighlightTextObject = { link = "Visual" },

  -- Bufferline.
  BufferLineBufferSelected = { bg = colors.bg, underline = true, sp = colors.purple },
  BufferLineFill = { bg = colors.bg },
  TabLine = { fg = colors.comment, bg = colors.bg },
  TabLineFill = { bg = colors.bg },
  TabLineSel = { bg = colors.purple },

  -- When triggering flash, use a white font and make everything in the backdrop italic.
  FlashBackdrop = { italic = true },
  FlashPrompt = { link = "Normal" },

  -- Make these titles more visible.
  MiniClueTitle = { bold = true, fg = colors.cyan },
  MiniFilesTitleFocused = { bold = true, fg = colors.cyan },

  -- Nicer yanky highlights.
  YankyPut = { link = "Visual" },
  YankyYanked = { link = "Visual" },

  -- Highlight for the Treesitter sticky context.
  TreesitterContextBottom = { underline = true, sp = colors.lilac },

  -- Fzf overrides.
  FzfLuaBorder = { fg = colors.comment },
  FzfLuaHeaderBind = { fg = colors.lavender },
  FzfLuaHeaderText = { fg = colors.pink },
  FzfLuaLivePrompt = { link = "Normal" },
  FzfLuaLiveSym = { fg = colors.pink },
  FzfLuaPreviewTitle = { fg = colors.fg },
  FzfLuaSearch = { bg = colors.red },

  -- Nicer sign column highlights for grug-far.
  GrugFarResultsChangeIndicator = { link = "Changed" },
  GrugFarResultsRemoveIndicator = { link = "Removed" },
  GrugFarResultsAddIndicator = { link = "Added" },

  -- Links.
  HighlightUrl = { underline = true, fg = colors.blue, sp = colors.blue },
}

for group, opts in pairs(groups) do
  vim.api.nvim_set_hl(0, group, opts)
end
