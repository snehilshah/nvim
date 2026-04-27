-- My own version of Gruvbox.

-- Reset highlighting.
vim.cmd.highlight("clear")
if vim.fn.exists("syntax_on") then
    vim.cmd.syntax("reset")
end
vim.o.termguicolors = true
vim.g.colors_name = "cosmic-gleam"

local colors = {
    -- Colors from cosmic-gleam-staging
    bright_white   = "#ebdbb2",
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
    bright_red     = "#EA2D1F",
    red            = "#A81A10",
    orange         = "#f7a182",
    pink           = "#db7670",
    purple         = "#BAA0E8",
    lavender       = "#6272A4",
    lilac          = "#6D5978",
    lime           = "#dbe6af",
    gruvbox_yellow = "#d8a657",
    grey           = "#A9ABAC",
    gutter_fg      = "#1d2021",
    selection      = "#3C4148",
    menu           = "#171c1f",
    visual         = "#58686d",
    fg             = "#DFCBB9",
    nontext        = "#d4be98",
    camel          = "#C19875",
    comment        = "#585f5b",
    bg             = "#1d2020",
    darker_bg      = "#131515",

    -- Mapped standard keys needed by the theme groups
    black              = "#090E13", -- almost_black
    white              = "#ebdbb2", -- bright_white
    yellow             = "#d8a657", -- gruvbox_yellow
    bright_yellow      = "#dbe6af", -- lime
    bright_magenta     = "#f9c8e5", -- cherry
    bright_cyan        = "#b3e6db", -- sky
    fuchsia            = "#db7670", -- pink
    neon_cyan          = "#3CDBD3", -- turquoise
    transparent_black  = "#131515", -- darker_bg
    transparent_blue   = "#19272C",
    transparent_green  = "#22372c",
    transparent_red    = "#342231",
    transparent_yellow = "#202624",
}

-- Terminal colors.
vim.g.terminal_color_0 = colors.transparent_black
vim.g.terminal_color_1 = colors.red
vim.g.terminal_color_2 = colors.green
vim.g.terminal_color_3 = colors.yellow
vim.g.terminal_color_4 = colors.purple
vim.g.terminal_color_5 = colors.pink
vim.g.terminal_color_6 = colors.cyan
vim.g.terminal_color_7 = colors.white
vim.g.terminal_color_8 = colors.selection
vim.g.terminal_color_9 = colors.bright_red
vim.g.terminal_color_10 = colors.bright_green
vim.g.terminal_color_11 = colors.bright_yellow
vim.g.terminal_color_12 = colors.bright_blue
vim.g.terminal_color_13 = colors.bright_magenta
vim.g.terminal_color_14 = colors.bright_cyan
vim.g.terminal_color_15 = colors.bright_white
vim.g.terminal_color_background = colors.bg
vim.g.terminal_color_foreground = colors.fg

-- Groups used for my statusline.
---@type table<string, vim.api.keyset.highlight>
local statusline_groups = {}
for mode, color in pairs({
    Normal = "fg",
    Pending = "orange",
    Visual = "yellow",
    Insert = "blue",
    Command = "green",
    Other = "red",
}) do
    statusline_groups["StatuslineMode" .. mode] =
    { fg = colors.transparent_black, bg = colors[color] }
    statusline_groups["StatuslineModeSeparator" .. mode] =
    { fg = colors[color], bg = colors.transparent_black }
end
statusline_groups = vim.tbl_extend("error", statusline_groups, {
    StatuslineItalic = { fg = colors.grey, bg = colors.transparent_black, italic = true },
    StatuslineSpinner = { fg = colors.bright_green, bg = colors.transparent_black, bold = true },
    StatuslineTitle = { fg = colors.bright_white, bg = colors.transparent_black, bold = true },
})

---@type table<string, vim.api.keyset.highlight>
local groups = vim.tbl_extend("error", statusline_groups, {
    -- Builtins.
    Boolean = { fg = colors.cyan },
    Character = { fg = colors.green },
    ColorColumn = { bg = colors.selection },
    Comment = { fg = colors.comment, italic = true },
    Conceal = { fg = colors.comment },
    Conditional = { fg = colors.pink },
    Constant = { fg = colors.yellow },
    CurSearch = { fg = colors.black, bg = colors.fuchsia },
    Cursor = { fg = colors.black, bg = colors.white },
    CursorColumn = { bg = colors.transparent_black },
    CursorLine = { bg = colors.selection },
    CursorLineNr = { fg = colors.lilac, bold = true },
    Define = { fg = colors.purple },
    Directory = { fg = colors.cyan },
    EndOfBuffer = { fg = colors.bg },
    Error = { fg = colors.bright_red },
    ErrorMsg = { fg = colors.bright_red },
    FoldColumn = {},
    Folded = { bg = colors.transparent_black },
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
    Pmenu = { fg = colors.white, bg = colors.bg },
    PmenuSbar = { bg = colors.transparent_blue },
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
    StatusLine = { fg = colors.white, bg = colors.transparent_black },
    StorageClass = { fg = colors.pink },
    Structure = { fg = colors.yellow },
    Substitute = { fg = colors.fuchsia, bg = colors.orange, bold = true },
    Title = { fg = colors.cyan },
    Todo = { fg = colors.purple, bold = true, italic = true },
    Type = { fg = colors.cyan },
    TypeDef = { fg = colors.yellow },
    Underlined = { fg = colors.cyan, underline = true },
    VertSplit = { fg = colors.white },
    Visual = { bg = colors.visual },
    VisualNOS = { fg = colors.visual },
    WarningMsg = { fg = colors.yellow },
    WildMenu = { fg = colors.transparent_black, bg = colors.white },

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
    ["@function.method"] = { fg = colors.green },
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
    ["@punctuation.bracket"] = { fg = colors.fg },
    ["@punctuation.delimiter"] = { fg = colors.fg },
    ["@string"] = { fg = colors.yellow },
    ["@string.escape"] = { fg = colors.cyan },
    ["@string.regexp"] = { fg = colors.bright_red },
    ["@string.special.symbol"] = { fg = colors.purple },
    ["@structure"] = { fg = colors.purple },
    ["@tag"] = { fg = colors.cyan },
    ["@tag.attribute"] = { fg = colors.green },
    ["@tag.delimiter"] = { fg = colors.cyan },
    ["@type"] = { fg = colors.bright_cyan },
    ["@type.builtin"] = { fg = colors.cyan, italic = true },
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
    ["@lsp.type.function"] = { fg = colors.green },
    ["@lsp.type.interface"] = { fg = colors.cyan },
    ["@lsp.type.macro"] = { fg = colors.cyan },
    ["@lsp.type.method"] = { fg = colors.green },
    ["@lsp.type.namespace"] = { fg = colors.orange },
    ["@lsp.type.parameter"] = { fg = colors.orange },
    ["@lsp.type.property"] = { fg = colors.purple },
    ["@lsp.type.struct"] = { fg = colors.cyan },
    ["@lsp.type.type"] = { fg = colors.bright_cyan },
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
    DiagnosticVirtualTextError = { fg = colors.red, bg = colors.transparent_red },
    DiagnosticVirtualTextHint = { fg = colors.cyan, bg = colors.transparent_blue },
    DiagnosticVirtualTextInfo = { fg = colors.cyan, bg = colors.transparent_blue },
    DiagnosticVirtualTextWarn = { fg = colors.yellow, bg = colors.transparent_yellow },
    DiagnosticWarn = { fg = colors.yellow },
    LspCodeLens = { fg = colors.cyan, underline = true },
    LspInlayHint = { fg = colors.lavender, italic = true },
    LspReferenceRead = { bg = colors.transparent_blue },
    LspReferenceText = {},
    LspReferenceWrite = { bg = colors.transparent_red },
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
    DiffAdd = { fg = colors.green, bg = colors.transparent_green },
    DiffChange = { fg = colors.white, bg = colors.transparent_yellow },
    DiffDelete = { fg = colors.red, bg = colors.transparent_red },
    DiffText = { fg = colors.orange, bg = colors.transparent_yellow, bold = true },
    DiffviewFolderSign = { fg = colors.cyan },
    DiffviewNonText = { fg = colors.lilac },
    diffAdded = { fg = colors.bright_green, bold = true },
    diffChanged = { fg = colors.bright_yellow, bold = true },
    diffRemoved = { fg = colors.bright_red, bold = true },

    -- Command line.
    MoreMsg = { fg = colors.bright_white, bold = true },
    MsgArea = { fg = colors.cyan },
    MsgSeparator = { fg = colors.lilac },

    -- Winbar styling.
    WinBar = { fg = colors.fg, bg = colors.transparent_black },
    WinBarNC = { bg = colors.transparent_black },
    WinBarDir = { fg = colors.bright_magenta, bg = colors.transparent_black, italic = true },
    WinBarSeparator = { fg = colors.green, bg = colors.transparent_black },

    -- Quickfix window.
    QuickFixLine = { italic = true, bg = colors.transparent_red },

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
    FzfLuaLiveSym = { fg = colors.fuchsia },
    FzfLuaPreviewTitle = { fg = colors.fg },
    FzfLuaSearch = { bg = colors.transparent_red },

    -- Nicer sign column highlights for grug-far.
    GrugFarResultsChangeIndicator = { link = "Changed" },
    GrugFarResultsRemoveIndicator = { link = "Removed" },
    GrugFarResultsAddIndicator = { link = "Added" },

    -- Links.
    HighlightUrl = { underline = true, fg = colors.neon_cyan, sp = colors.neon_cyan },

    -- AI completions.
    NeoCodeiumSuggestion = { link = "Comment" },

    -- Barbar (tabline)
    BufferCurrent = { fg = colors.fg, bg = colors.bg },
    BufferCurrentIndex = { fg = colors.comment, bg = colors.bg },
    BufferCurrentMod = { fg = colors.yellow, bg = colors.bg },
    BufferCurrentSign = { fg = colors.cyan, bg = colors.bg },
    BufferCurrentTarget = { fg = colors.red, bg = colors.bg, bold = true },
    BufferCurrentERROR = { fg = colors.red, bg = colors.bg },
    BufferCurrentWARN = { fg = colors.orange, bg = colors.bg },
    BufferCurrentINFO = { fg = colors.blue, bg = colors.bg },
    BufferCurrentHINT = { fg = colors.cyan, bg = colors.bg },

    BufferVisible = { fg = colors.fg, bg = colors.transparent_black },
    BufferVisibleIndex = { fg = colors.fg, bg = colors.transparent_black },
    BufferVisibleMod = { fg = colors.yellow, bg = colors.transparent_black },
    BufferVisibleSign = { fg = colors.nontext, bg = colors.transparent_black },
    BufferVisibleTarget = { fg = colors.red, bg = colors.transparent_black, bold = true },
    BufferVisibleERROR = { fg = colors.red, bg = colors.transparent_black },
    BufferVisibleWARN = { fg = colors.orange, bg = colors.transparent_black },
    BufferVisibleINFO = { fg = colors.blue, bg = colors.transparent_black },
    BufferVisibleHINT = { fg = colors.cyan, bg = colors.transparent_black },

    BufferInactive = { fg = colors.comment, bg = colors.transparent_black },
    BufferInactiveIndex = { fg = colors.comment, bg = colors.transparent_black },
    BufferInactiveMod = { fg = colors.yellow, bg = colors.transparent_black },
    BufferInactiveSign = { fg = colors.nontext, bg = colors.transparent_black },
    BufferInactiveTarget = { fg = colors.red, bg = colors.transparent_black, bold = true },
    BufferInactiveERROR = { fg = colors.red, bg = colors.transparent_black },
    BufferInactiveWARN = { fg = colors.orange, bg = colors.transparent_black },
    BufferInactiveINFO = { fg = colors.blue, bg = colors.transparent_black },
    BufferInactiveHINT = { fg = colors.cyan, bg = colors.transparent_black },

    BufferTabpages = { fg = colors.cyan, bg = colors.transparent_black, bold = true },
    BufferTabpageFill = { fg = colors.nontext, bg = colors.transparent_black, bold = true },
    BufferOffset = { fg = colors.comment, bg = colors.bg, bold = true },
    BufferScrollArrow = { fg = colors.fg, bg = colors.transparent_black, bold = true },
    BufferPart = { fg = colors.cyan, bg = colors.transparent_blue, bold = true },

    -- Standard nvim additions
    FloatBorder  = { fg = colors.comment, bg = colors.bg },
    FloatTitle   = { fg = colors.cyan, bg = colors.bg, bold = true },
    StatusLineNC = { fg = colors.comment, bg = colors.transparent_black },
    WinSeparator = { fg = colors.lilac, bg = colors.bg },
    Whitespace   = { fg = colors.selection },

    -- Treesitter additions
    ["@comment.error"]   = { fg = colors.bright_red, bold = true },
    ["@comment.warning"] = { fg = colors.yellow, bold = true },
    ["@comment.todo"]    = { fg = colors.purple, bold = true },
    ["@comment.note"]    = { fg = colors.cyan, bold = true },
    ["@markup.quote"]    = { fg = colors.lavender, italic = true },
    ["@diff.plus"]       = { fg = colors.bright_green },
    ["@diff.minus"]      = { fg = colors.bright_red },
    ["@diff.delta"]      = { fg = colors.bright_yellow },

    -- Flash extras
    FlashLabel   = { fg = colors.transparent_black, bg = colors.fuchsia, bold = true },
    FlashMatch   = { fg = colors.transparent_black, bg = colors.cyan },
    FlashCurrent = { fg = colors.transparent_black, bg = colors.orange, bold = true },

    -- Mini.files
    MiniFilesBorder         = { fg = colors.comment, bg = colors.bg },
    MiniFilesBorderModified = { fg = colors.yellow, bg = colors.bg },
    MiniFilesNormal         = { fg = colors.fg, bg = colors.bg },
    MiniFilesTitle          = { fg = colors.lavender, bg = colors.bg },
    MiniFilesCursorLine     = { bg = colors.selection },
    MiniFilesDirectory      = { fg = colors.cyan, bold = true },
    MiniFilesFile           = { fg = colors.fg },

    -- Mini.icons
    MiniIconsAzure  = { fg = colors.bright_blue },
    MiniIconsBlue   = { fg = colors.blue },
    MiniIconsCyan   = { fg = colors.cyan },
    MiniIconsGreen  = { fg = colors.green },
    MiniIconsGrey   = { fg = colors.grey },
    MiniIconsOrange = { fg = colors.orange },
    MiniIconsPurple = { fg = colors.purple },
    MiniIconsRed    = { fg = colors.bright_red },
    MiniIconsYellow = { fg = colors.yellow },

    -- Trouble.nvim
    TroubleNormal    = { fg = colors.fg, bg = colors.bg },
    TroubleNormalNC  = { fg = colors.fg, bg = colors.bg },
    TroubleText      = { fg = colors.fg },
    TroubleCount     = { fg = colors.purple, bg = colors.transparent_blue },
    TroubleSource    = { fg = colors.lavender },
    TroubleFilename  = { fg = colors.cyan, bold = true },
    TroubleIcon      = { fg = colors.purple },
    TroubleIndent    = { fg = colors.lilac },
    TroubleFoldIcon  = { fg = colors.purple },
    TroubleLocation  = { fg = colors.comment },
    TroublePos       = { fg = colors.comment },
    TroubleDirectory = { fg = colors.bright_magenta, italic = true },

    -- Tiny-inline-diagnostic
    TinyInlineDiagnosticVirtualTextError = { link = "DiagnosticVirtualTextError" },
    TinyInlineDiagnosticVirtualTextWarn  = { link = "DiagnosticVirtualTextWarn" },
    TinyInlineDiagnosticVirtualTextInfo  = { link = "DiagnosticVirtualTextInfo" },
    TinyInlineDiagnosticVirtualTextHint  = { link = "DiagnosticVirtualTextHint" },
    TinyInlineDiagnosticVirtualTextArrow = { fg = colors.red },
    TinyInlineDiagnosticVirtualTextBg    = { bg = colors.transparent_red },

    -- Todo-comments
    TodoBgFix    = { fg = colors.transparent_black, bg = colors.bright_red, bold = true },
    TodoBgHack   = { fg = colors.transparent_black, bg = colors.orange, bold = true },
    TodoBgPerf   = { fg = colors.transparent_black, bg = colors.purple, bold = true },
    TodoBgNote   = { fg = colors.transparent_black, bg = colors.cyan, bold = true },
    TodoBgTodo   = { fg = colors.transparent_black, bg = colors.green, bold = true },
    TodoBgWarn   = { fg = colors.transparent_black, bg = colors.yellow, bold = true },
    TodoBgTest   = { fg = colors.transparent_black, bg = colors.bright_magenta, bold = true },
    TodoFgFix    = { fg = colors.bright_red },
    TodoFgHack   = { fg = colors.orange },
    TodoFgPerf   = { fg = colors.purple },
    TodoFgNote   = { fg = colors.cyan },
    TodoFgTodo   = { fg = colors.green },
    TodoFgWarn   = { fg = colors.yellow },
    TodoFgTest   = { fg = colors.bright_magenta },
    TodoSignFix  = { link = "TodoFgFix" },
    TodoSignHack = { link = "TodoFgHack" },
    TodoSignPerf = { link = "TodoFgPerf" },
    TodoSignNote = { link = "TodoFgNote" },
    TodoSignTodo = { link = "TodoFgTodo" },
    TodoSignWarn = { link = "TodoFgWarn" },
    TodoSignTest = { link = "TodoFgTest" },

    -- Indent-blankline
    IblIndent     = { fg = colors.gutter_fg },
    IblWhitespace = { fg = colors.gutter_fg },
    IblScope      = { fg = colors.lilac },

    -- Which-key
    WhichKey          = { fg = colors.cyan },
    WhichKeyDesc      = { fg = colors.fg },
    WhichKeyGroup     = { fg = colors.purple, italic = true },
    WhichKeySeparator = { fg = colors.comment },
    WhichKeyValue     = { fg = colors.lavender },
    WhichKeyFloat     = { bg = colors.bg },
    WhichKeyTitle     = { fg = colors.cyan, bold = true },
    WhichKeyBorder    = { fg = colors.comment, bg = colors.bg },
    WhichKeyNormal    = { bg = colors.bg },

    -- Neogit
    NeogitDiffAdd              = { fg = colors.green, bg = colors.transparent_green },
    NeogitDiffAddHighlight     = { fg = colors.bright_green, bg = colors.transparent_green, bold = true },
    NeogitDiffDelete           = { fg = colors.red, bg = colors.transparent_red },
    NeogitDiffDeleteHighlight  = { fg = colors.bright_red, bg = colors.transparent_red, bold = true },
    NeogitDiffContext          = { fg = colors.fg },
    NeogitDiffContextHighlight = { fg = colors.fg, bg = colors.transparent_black },
    NeogitHunkHeader           = { fg = colors.cyan, bg = colors.transparent_blue },
    NeogitHunkHeaderHighlight  = { fg = colors.cyan, bg = colors.transparent_blue, bold = true },
    NeogitFilePath             = { fg = colors.bright_magenta, italic = true },
    NeogitCommitViewHeader     = { fg = colors.purple, bold = true },
    NeogitBranch               = { fg = colors.orange, bold = true },
    NeogitRemote               = { fg = colors.green, bold = true },
    NeogitTagName              = { fg = colors.yellow, bold = true },
    NeogitNotificationInfo     = { fg = colors.cyan },
    NeogitNotificationWarning  = { fg = colors.yellow },
    NeogitNotificationError    = { fg = colors.bright_red },

    -- Render-markdown
    RenderMarkdownH1         = { fg = colors.bright_red, bold = true },
    RenderMarkdownH2         = { fg = colors.orange, bold = true },
    RenderMarkdownH3         = { fg = colors.yellow, bold = true },
    RenderMarkdownH4         = { fg = colors.green, bold = true },
    RenderMarkdownH5         = { fg = colors.cyan, bold = true },
    RenderMarkdownH6         = { fg = colors.purple, bold = true },
    RenderMarkdownH1Bg       = { fg = colors.bright_red, bg = colors.transparent_red, bold = true },
    RenderMarkdownH2Bg       = { fg = colors.orange, bg = colors.transparent_yellow, bold = true },
    RenderMarkdownH3Bg       = { fg = colors.yellow, bg = colors.transparent_yellow, bold = true },
    RenderMarkdownH4Bg       = { fg = colors.green, bg = colors.transparent_green, bold = true },
    RenderMarkdownH5Bg       = { fg = colors.cyan, bg = colors.transparent_blue, bold = true },
    RenderMarkdownH6Bg       = { fg = colors.purple, bg = colors.transparent_blue, bold = true },
    RenderMarkdownCode       = { bg = colors.transparent_black },
    RenderMarkdownCodeInline = { fg = colors.yellow, bg = colors.transparent_black },
    RenderMarkdownQuote      = { fg = colors.lavender, italic = true },
    RenderMarkdownTableHead  = { fg = colors.cyan, bold = true },
    RenderMarkdownTableRow   = { fg = colors.fg },
    RenderMarkdownBullet     = { fg = colors.orange },
    RenderMarkdownDash       = { fg = colors.comment },
    RenderMarkdownTodo       = { fg = colors.purple, bold = true },
    RenderMarkdownLink       = { fg = colors.bright_magenta, underline = true },

    -- Visual-whitespace
    VisualNonText = { fg = colors.lilac, bg = colors.visual },

    -- Haunt
    HauntAnnotation = { fg = colors.lavender, italic = true },

    -- Copilot
    CopilotSuggestion = { link = "Comment" },
    CopilotAnnotation = { fg = colors.lavender, italic = true },

    -- Csvview
    CsvViewDelimiter = { fg = colors.comment },
    CsvViewCol0 = { fg = colors.cyan },
    CsvViewCol1 = { fg = colors.green },
    CsvViewCol2 = { fg = colors.yellow },
    CsvViewCol3 = { fg = colors.orange },
    CsvViewCol4 = { fg = colors.purple },
    CsvViewCol5 = { fg = colors.bright_magenta },
    CsvViewCol6 = { fg = colors.bright_blue },
    CsvViewCol7 = { fg = colors.fuchsia },

    -- vim-dadbod-ui
    dbui_tables           = { fg = colors.cyan },
    dbui_connection_ok    = { fg = colors.green },
    dbui_connection_error = { fg = colors.bright_red },
    dbui_saved_query      = { fg = colors.purple },
    dbui_databases        = { fg = colors.orange },
    dbui_schemas          = { fg = colors.yellow },
    dbui_buffers          = { fg = colors.bright_magenta },
    dbout_header          = { fg = colors.cyan, bold = true },
    dbout_separator       = { fg = colors.lilac },
    dbout_null            = { fg = colors.lavender, italic = true },
})

for group, opts in pairs(groups) do
    vim.api.nvim_set_hl(0, group, opts)
end
