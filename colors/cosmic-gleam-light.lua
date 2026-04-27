-- cosmic-gleam (Light variant): gruvbox-material light medium
-- Warm cream paper, low-contrast accents — easy and soothing for daylight sessions.

vim.cmd.highlight("clear")
if vim.fn.exists("syntax_on") then
    vim.cmd.syntax("reset")
end
vim.o.background = "light"
vim.o.termguicolors = true
vim.g.colors_name = "cosmic-gleam-light"

local colors = {
    -- Backgrounds (warm cream paper, easy on the eyes)
    bg                 = "#fbf1c7", -- light0
    bg_dim             = "#f2e5bc", -- light0_soft
    bg_0               = "#f9f5d7", -- light0_hard
    bg_1               = "#ebdbb2", -- light1
    bg_2               = "#d5c4a1", -- light2
    bg_statusline      = "#f2e5bc",
    bg_visual          = "#d5c4a1",
    bg_red             = "#fbe6dc",
    bg_green           = "#eaebbc",
    bg_blue            = "#d8e6e7",
    bg_yellow          = "#fef0b9",

    -- Foregrounds (warm dark for legible reading)
    fg                 = "#3c3836", -- dark1
    fg_dim             = "#504945",
    grey0              = "#a89984",
    grey1              = "#928374",
    grey2              = "#7c6f64",

    -- Accents (gruvbox-material light medium, muted for soothing reading)
    red                = "#c14a4a",
    orange             = "#c35e0a",
    yellow             = "#b47109",
    green              = "#6c782e",
    aqua               = "#4c7a5d",
    blue               = "#45707a",
    purple             = "#945e80",

    -- Brighter set for strong signals (still tasteful, gruvbox light originals)
    bright_red         = "#9d0006",
    bright_green       = "#79740e",
    bright_yellow      = "#b57614",
    bright_blue        = "#076678",
    bright_purple      = "#8f3f71",
    bright_aqua        = "#427b58",

    -- Surfaces
    selection          = "#d5c4a1",
    visual             = "#d5c4a1",
    cursor_line        = "#f2e5bc",
    line_nr            = "#a89984",
    line_nr_active     = "#b57614",
    comment            = "#928374",
    nontext            = "#bdae93",
    sign_column        = "#fbf1c7",

    -- Pmenu / floats
    menu_bg            = "#f2e5bc",
    menu_sel           = "#ebdbb2",

    -- Diff backgrounds (subtle tinted)
    diff_add_bg        = "#e8e5b5",
    diff_change_bg     = "#dceaeb",
    diff_delete_bg     = "#f9d9d4",
    diff_text_bg       = "#cfe7e6",

    -- Pure
    black              = "#3c3836",
    white              = "#fbf1c7",
}

-- Terminal colors.
vim.g.terminal_color_0  = colors.bg_2
vim.g.terminal_color_1  = colors.red
vim.g.terminal_color_2  = colors.green
vim.g.terminal_color_3  = colors.yellow
vim.g.terminal_color_4  = colors.blue
vim.g.terminal_color_5  = colors.purple
vim.g.terminal_color_6  = colors.aqua
vim.g.terminal_color_7  = colors.fg
vim.g.terminal_color_8  = colors.grey1
vim.g.terminal_color_9  = colors.bright_red
vim.g.terminal_color_10 = colors.bright_green
vim.g.terminal_color_11 = colors.bright_yellow
vim.g.terminal_color_12 = colors.bright_blue
vim.g.terminal_color_13 = colors.bright_purple
vim.g.terminal_color_14 = colors.bright_aqua
vim.g.terminal_color_15 = colors.fg_dim
vim.g.terminal_color_background = colors.bg
vim.g.terminal_color_foreground = colors.fg

-- Statusline groups.
local statusline_groups = {}
for mode, color in pairs({
    Normal  = "fg",
    Pending = "orange",
    Visual  = "yellow",
    Insert  = "blue",
    Command = "green",
    Other   = "red",
}) do
    statusline_groups["StatuslineMode" .. mode] =
        { fg = colors.bg, bg = colors[color], bold = true }
    statusline_groups["StatuslineModeSeparator" .. mode] =
        { fg = colors[color], bg = colors.bg_statusline }
end
statusline_groups = vim.tbl_extend("error", statusline_groups, {
    StatuslineItalic  = { fg = colors.grey2,  bg = colors.bg_statusline, italic = true },
    StatuslineSpinner = { fg = colors.green,  bg = colors.bg_statusline, bold = true },
    StatuslineTitle   = { fg = colors.fg,     bg = colors.bg_statusline, bold = true },
})

local groups = vim.tbl_extend("error", statusline_groups, {
    -- Builtins
    Boolean         = { fg = colors.purple },
    Character       = { fg = colors.aqua },
    ColorColumn     = { bg = colors.bg_1 },
    Comment         = { fg = colors.comment, italic = true },
    Conceal         = { fg = colors.grey1 },
    Conditional     = { fg = colors.red, italic = true },
    Constant        = { fg = colors.purple },
    CurSearch       = { fg = colors.bg, bg = colors.orange, bold = true },
    Cursor          = { fg = colors.bg, bg = colors.fg },
    CursorColumn    = { bg = colors.cursor_line },
    CursorLine      = { bg = colors.cursor_line },
    CursorLineNr    = { fg = colors.yellow, bold = true },
    Define          = { fg = colors.purple, italic = true },
    Directory       = { fg = colors.green, bold = true },
    EndOfBuffer     = { fg = colors.bg },
    Error           = { fg = colors.red },
    ErrorMsg        = { fg = colors.red, bold = true },
    FloatBorder     = { fg = colors.grey0, bg = colors.menu_bg },
    FloatTitle      = { fg = colors.aqua, bg = colors.menu_bg, bold = true },
    FoldColumn      = { fg = colors.grey0, bg = colors.bg },
    Folded          = { fg = colors.grey1, bg = colors.bg_1 },
    Function        = { fg = colors.green, bold = true },
    Identifier      = { fg = colors.fg },
    IncSearch       = { link = "CurSearch" },
    Include         = { fg = colors.red, italic = true },
    Keyword         = { fg = colors.red, italic = true },
    Label           = { fg = colors.orange },
    LineNr          = { fg = colors.line_nr },
    Macro           = { fg = colors.aqua },
    MatchParen      = { fg = colors.orange, bg = colors.bg_2, bold = true },
    NonText         = { fg = colors.nontext },
    Normal          = { fg = colors.fg, bg = colors.bg },
    NormalFloat     = { fg = colors.fg, bg = colors.menu_bg },
    Number          = { fg = colors.purple },
    Pmenu           = { fg = colors.fg, bg = colors.menu_bg },
    PmenuSbar       = { bg = colors.bg_1 },
    PmenuSel        = { fg = colors.fg, bg = colors.menu_sel, bold = true },
    PmenuThumb      = { bg = colors.grey0 },
    PreCondit       = { fg = colors.purple, italic = true },
    PreProc         = { fg = colors.aqua },
    Question        = { fg = colors.yellow },
    Repeat          = { fg = colors.red, italic = true },
    Search          = { fg = colors.bg, bg = colors.yellow, bold = true },
    SignColumn      = { bg = colors.bg },
    Special         = { fg = colors.orange },
    SpecialComment  = { fg = colors.grey1, italic = true },
    SpecialKey      = { fg = colors.grey0 },
    SpellBad        = { sp = colors.red, undercurl = true },
    SpellCap        = { sp = colors.yellow, undercurl = true },
    SpellLocal      = { sp = colors.aqua, undercurl = true },
    SpellRare       = { sp = colors.purple, undercurl = true },
    Statement       = { fg = colors.red, italic = true },
    StatusLine      = { fg = colors.fg, bg = colors.bg_statusline },
    StatusLineNC    = { fg = colors.grey1, bg = colors.bg_statusline },
    StorageClass    = { fg = colors.orange, italic = true },
    Structure       = { fg = colors.yellow },
    Substitute      = { fg = colors.bg, bg = colors.orange, bold = true },
    TabLine         = { fg = colors.grey1, bg = colors.bg_1 },
    TabLineFill     = { bg = colors.bg_1 },
    TabLineSel      = { fg = colors.fg, bg = colors.bg, bold = true },
    Title           = { fg = colors.green, bold = true },
    Todo            = { fg = colors.purple, bold = true, italic = true },
    Type            = { fg = colors.yellow },
    Typedef         = { fg = colors.yellow },
    Underlined      = { fg = colors.blue, underline = true },
    VertSplit       = { fg = colors.bg_2 },
    WinSeparator    = { fg = colors.bg_2 },
    Visual          = { bg = colors.bg_visual },
    VisualNOS       = { bg = colors.bg_visual },
    WarningMsg      = { fg = colors.yellow, bold = true },
    Whitespace      = { fg = colors.bg_2 },
    WildMenu        = { fg = colors.bg, bg = colors.yellow },
    WinBar          = { fg = colors.fg, bg = colors.bg_statusline },
    WinBarNC        = { fg = colors.grey1, bg = colors.bg_statusline },

    -- Treesitter
    ["@annotation"]               = { fg = colors.purple },
    ["@attribute"]                = { fg = colors.purple },
    ["@boolean"]                  = { fg = colors.purple },
    ["@character"]                = { fg = colors.aqua },
    ["@character.special"]        = { fg = colors.orange },
    ["@comment"]                  = { link = "Comment" },
    ["@comment.error"]            = { fg = colors.red, bold = true },
    ["@comment.warning"]          = { fg = colors.yellow, bold = true },
    ["@comment.todo"]             = { fg = colors.purple, bold = true },
    ["@comment.note"]             = { fg = colors.aqua, bold = true },
    ["@constant"]                 = { fg = colors.purple },
    ["@constant.builtin"]         = { fg = colors.purple, italic = true },
    ["@constant.macro"]           = { fg = colors.aqua },
    ["@constructor"]              = { fg = colors.yellow },
    ["@diff.plus"]                = { fg = colors.green },
    ["@diff.minus"]               = { fg = colors.red },
    ["@diff.delta"]               = { fg = colors.yellow },
    ["@error"]                    = { fg = colors.red },
    ["@function"]                 = { fg = colors.green, bold = true },
    ["@function.builtin"]         = { fg = colors.green, italic = true },
    ["@function.macro"]           = { fg = colors.aqua },
    ["@function.method"]          = { fg = colors.green, bold = true },
    ["@function.call"]            = { fg = colors.green },
    ["@keyword"]                  = { fg = colors.red, italic = true },
    ["@keyword.conditional"]      = { fg = colors.red, italic = true },
    ["@keyword.exception"]        = { fg = colors.red, italic = true },
    ["@keyword.function"]         = { fg = colors.red, italic = true },
    ["@keyword.import"]           = { fg = colors.red, italic = true },
    ["@keyword.include"]          = { fg = colors.red, italic = true },
    ["@keyword.operator"]         = { fg = colors.orange },
    ["@keyword.repeat"]           = { fg = colors.red, italic = true },
    ["@keyword.return"]           = { fg = colors.red, italic = true },
    ["@label"]                    = { fg = colors.orange },
    ["@markup"]                   = { fg = colors.fg },
    ["@markup.emphasis"]          = { italic = true },
    ["@markup.heading"]           = { fg = colors.red, bold = true },
    ["@markup.link"]              = { fg = colors.blue, underline = true },
    ["@markup.link.uri"]          = { fg = colors.aqua, italic = true, underline = true },
    ["@markup.list"]              = { fg = colors.orange },
    ["@markup.quote"]             = { fg = colors.grey1, italic = true },
    ["@markup.raw"]               = { fg = colors.aqua },
    ["@markup.strong"]            = { bold = true },
    ["@markup.underline"]         = { underline = true },
    ["@module"]                   = { fg = colors.fg_dim },
    ["@number"]                   = { fg = colors.purple },
    ["@number.float"]             = { fg = colors.purple },
    ["@operator"]                 = { fg = colors.orange },
    ["@parameter.reference"]      = { fg = colors.fg },
    ["@property"]                 = { fg = colors.blue },
    ["@punctuation.bracket"]      = { fg = colors.grey2 },
    ["@punctuation.delimiter"]    = { fg = colors.grey2 },
    ["@punctuation.special"]      = { fg = colors.orange },
    ["@string"]                   = { fg = colors.aqua },
    ["@string.escape"]            = { fg = colors.orange },
    ["@string.regexp"]            = { fg = colors.orange },
    ["@string.special.symbol"]    = { fg = colors.purple },
    ["@structure"]                = { fg = colors.yellow },
    ["@tag"]                      = { fg = colors.orange },
    ["@tag.attribute"]            = { fg = colors.green, italic = true },
    ["@tag.delimiter"]            = { fg = colors.grey2 },
    ["@type"]                     = { fg = colors.yellow },
    ["@type.builtin"]             = { fg = colors.yellow, italic = true },
    ["@type.qualifier"]           = { fg = colors.red, italic = true },
    ["@variable"]                 = { fg = colors.fg },
    ["@variable.builtin"]         = { fg = colors.purple, italic = true },
    ["@variable.member"]          = { fg = colors.blue },
    ["@variable.parameter"]       = { fg = colors.fg, italic = true },

    -- Semantic tokens
    ["@lsp.type.class"]           = { fg = colors.yellow },
    ["@lsp.type.decorator"]       = { fg = colors.aqua },
    ["@lsp.type.enum"]            = { fg = colors.yellow },
    ["@lsp.type.enumMember"]      = { fg = colors.purple },
    ["@lsp.type.function"]        = { fg = colors.green, bold = true },
    ["@lsp.type.interface"]       = { fg = colors.yellow },
    ["@lsp.type.macro"]           = { fg = colors.aqua },
    ["@lsp.type.method"]          = { fg = colors.green, bold = true },
    ["@lsp.type.namespace"]       = { fg = colors.fg_dim },
    ["@lsp.type.parameter"]       = { fg = colors.fg, italic = true },
    ["@lsp.type.property"]        = { fg = colors.blue },
    ["@lsp.type.struct"]          = { fg = colors.yellow },
    ["@lsp.type.type"]            = { fg = colors.yellow },
    ["@lsp.type.variable"]        = { fg = colors.fg },

    -- LSP / Diagnostics
    ComplHint                       = { link = "Comment" },
    DiagnosticDeprecated            = { strikethrough = true, fg = colors.grey1 },
    DiagnosticError                 = { fg = colors.red },
    DiagnosticHint                  = { fg = colors.aqua },
    DiagnosticInfo                  = { fg = colors.blue },
    DiagnosticWarn                  = { fg = colors.yellow },
    DiagnosticUnderlineError        = { undercurl = true, sp = colors.red },
    DiagnosticUnderlineHint         = { undercurl = true, sp = colors.aqua },
    DiagnosticUnderlineInfo         = { undercurl = true, sp = colors.blue },
    DiagnosticUnderlineWarn         = { undercurl = true, sp = colors.yellow },
    DiagnosticUnnecessary           = { fg = colors.grey1, italic = true },
    DiagnosticVirtualTextError      = { fg = colors.red, bg = colors.bg_red },
    DiagnosticVirtualTextHint       = { fg = colors.aqua, bg = colors.bg_blue },
    DiagnosticVirtualTextInfo       = { fg = colors.blue, bg = colors.bg_blue },
    DiagnosticVirtualTextWarn       = { fg = colors.yellow, bg = colors.bg_yellow },
    LspCodeLens                     = { fg = colors.grey2, italic = true },
    LspInlayHint                    = { fg = colors.grey0, bg = colors.bg_1, italic = true },
    LspReferenceRead                = { bg = colors.bg_2 },
    LspReferenceText                = { bg = colors.bg_2 },
    LspReferenceWrite               = { bg = colors.bg_2, bold = true },
    LspSignatureActiveParameter     = { fg = colors.orange, bold = true },

    -- Completions (Blink)
    BlinkCmpKindClass         = { link = "@type" },
    BlinkCmpKindColor         = { fg = colors.purple },
    BlinkCmpKindConstant      = { link = "@constant" },
    BlinkCmpKindConstructor   = { link = "@type" },
    BlinkCmpKindEnum          = { link = "@variable.member" },
    BlinkCmpKindEnumMember    = { link = "@variable.member" },
    BlinkCmpKindEvent         = { link = "@constant" },
    BlinkCmpKindField         = { link = "@variable.member" },
    BlinkCmpKindFile          = { link = "Directory" },
    BlinkCmpKindFolder        = { link = "Directory" },
    BlinkCmpKindFunction      = { link = "@function" },
    BlinkCmpKindInterface     = { link = "@type" },
    BlinkCmpKindKeyword       = { link = "@keyword" },
    BlinkCmpKindMethod        = { link = "@function.method" },
    BlinkCmpKindModule        = { link = "@module" },
    BlinkCmpKindOperator      = { link = "@operator" },
    BlinkCmpKindProperty      = { link = "@property" },
    BlinkCmpKindReference     = { link = "@parameter.reference" },
    BlinkCmpKindSnippet       = { link = "@markup" },
    BlinkCmpKindStruct        = { link = "@structure" },
    BlinkCmpKindText          = { link = "@markup" },
    BlinkCmpKindTypeParameter = { link = "@variable.parameter" },
    BlinkCmpKindUnit          = { link = "@variable.member" },
    BlinkCmpKindValue         = { link = "@variable.member" },
    BlinkCmpKindVariable      = { link = "@variable" },
    BlinkCmpLabelDeprecated   = { link = "DiagnosticDeprecated" },
    BlinkCmpLabelDescription  = { fg = colors.grey1, italic = true },
    BlinkCmpLabelDetail       = { fg = colors.grey1, bg = colors.menu_bg },
    BlinkCmpMenu              = { bg = colors.menu_bg },
    BlinkCmpMenuBorder        = { fg = colors.grey0, bg = colors.menu_bg },

    -- Diff
    DiffAdd               = { bg = colors.diff_add_bg },
    DiffChange            = { bg = colors.diff_change_bg },
    DiffDelete            = { fg = colors.red, bg = colors.diff_delete_bg },
    DiffText              = { fg = colors.fg, bg = colors.diff_text_bg, bold = true },
    diffAdded             = { fg = colors.green, bold = true },
    diffChanged           = { fg = colors.yellow, bold = true },
    diffRemoved           = { fg = colors.red, bold = true },

    -- Gitsigns
    GitSignsAdd               = { fg = colors.green },
    GitSignsChange            = { fg = colors.aqua },
    GitSignsCurrentLineBlame  = { fg = colors.grey0, italic = true },
    GitSignsDelete            = { fg = colors.red },
    GitSignsStagedAdd         = { fg = colors.green },
    GitSignsStagedChange      = { fg = colors.aqua },
    GitSignsStagedDelete      = { fg = colors.red },

    -- Gitlinker
    NvimGitLinkerHighlightTextObject = { link = "Visual" },

    -- Treesitter context
    TreesitterContextBottom = { underline = true, sp = colors.bg_2 },

    -- Flash
    FlashBackdrop = { fg = colors.grey0, italic = true },
    FlashPrompt   = { link = "Normal" },
    FlashLabel    = { fg = colors.bg, bg = colors.orange, bold = true },
    FlashMatch    = { fg = colors.bg, bg = colors.aqua },
    FlashCurrent  = { fg = colors.bg, bg = colors.purple, bold = true },

    -- Mini
    MiniClueTitle         = { bold = true, fg = colors.yellow },
    MiniFilesTitleFocused = { bold = true, fg = colors.yellow },
    MiniFilesBorder         = { fg = colors.grey0, bg = colors.menu_bg },
    MiniFilesBorderModified = { fg = colors.yellow, bg = colors.menu_bg },
    MiniFilesNormal         = { fg = colors.fg, bg = colors.menu_bg },
    MiniFilesTitle          = { fg = colors.grey1, bg = colors.menu_bg },
    MiniFilesCursorLine     = { bg = colors.bg_1 },
    MiniFilesDirectory      = { fg = colors.aqua, bold = true },
    MiniFilesFile           = { fg = colors.fg },
    MiniIconsAzure  = { fg = colors.blue },
    MiniIconsBlue   = { fg = colors.blue },
    MiniIconsCyan   = { fg = colors.aqua },
    MiniIconsGreen  = { fg = colors.green },
    MiniIconsGrey   = { fg = colors.grey1 },
    MiniIconsOrange = { fg = colors.orange },
    MiniIconsPurple = { fg = colors.purple },
    MiniIconsRed    = { fg = colors.red },
    MiniIconsYellow = { fg = colors.yellow },

    -- Yanky
    YankyPut    = { link = "Visual" },
    YankyYanked = { link = "Visual" },

    -- Fzf
    FzfLuaBorder       = { fg = colors.grey0 },
    FzfLuaHeaderBind   = { fg = colors.grey2 },
    FzfLuaHeaderText   = { fg = colors.orange },
    FzfLuaLivePrompt   = { link = "Normal" },
    FzfLuaLiveSym      = { fg = colors.orange },
    FzfLuaPreviewTitle = { fg = colors.fg, bold = true },
    FzfLuaSearch       = { fg = colors.bg, bg = colors.yellow, bold = true },

    -- Trouble.nvim
    TroubleNormal     = { fg = colors.fg, bg = colors.bg },
    TroubleNormalNC   = { fg = colors.fg, bg = colors.bg },
    TroubleText       = { fg = colors.fg },
    TroubleCount      = { fg = colors.purple, bg = colors.bg_1 },
    TroubleSource     = { fg = colors.grey1 },
    TroubleFilename   = { fg = colors.aqua, bold = true },
    TroubleIcon       = { fg = colors.purple },
    TroubleIndent     = { fg = colors.grey0 },
    TroubleFoldIcon   = { fg = colors.purple },
    TroubleLocation   = { fg = colors.grey0 },
    TroublePos        = { fg = colors.grey0 },
    TroubleDirectory  = { fg = colors.purple, italic = true },

    -- Tiny-inline-diagnostic
    TinyInlineDiagnosticVirtualTextError = { link = "DiagnosticVirtualTextError" },
    TinyInlineDiagnosticVirtualTextWarn  = { link = "DiagnosticVirtualTextWarn" },
    TinyInlineDiagnosticVirtualTextInfo  = { link = "DiagnosticVirtualTextInfo" },
    TinyInlineDiagnosticVirtualTextHint  = { link = "DiagnosticVirtualTextHint" },
    TinyInlineDiagnosticVirtualTextArrow = { fg = colors.red },
    TinyInlineDiagnosticVirtualTextBg    = { bg = colors.bg_red },

    -- Todo-comments
    TodoBgFix    = { fg = colors.bg, bg = colors.red, bold = true },
    TodoBgHack   = { fg = colors.bg, bg = colors.orange, bold = true },
    TodoBgPerf   = { fg = colors.bg, bg = colors.purple, bold = true },
    TodoBgNote   = { fg = colors.bg, bg = colors.aqua, bold = true },
    TodoBgTodo   = { fg = colors.bg, bg = colors.green, bold = true },
    TodoBgWarn   = { fg = colors.bg, bg = colors.yellow, bold = true },
    TodoBgTest   = { fg = colors.bg, bg = colors.purple, bold = true },
    TodoFgFix    = { fg = colors.red },
    TodoFgHack   = { fg = colors.orange },
    TodoFgPerf   = { fg = colors.purple },
    TodoFgNote   = { fg = colors.aqua },
    TodoFgTodo   = { fg = colors.green },
    TodoFgWarn   = { fg = colors.yellow },
    TodoFgTest   = { fg = colors.purple },
    TodoSignFix  = { link = "TodoFgFix" },
    TodoSignHack = { link = "TodoFgHack" },
    TodoSignPerf = { link = "TodoFgPerf" },
    TodoSignNote = { link = "TodoFgNote" },
    TodoSignTodo = { link = "TodoFgTodo" },
    TodoSignWarn = { link = "TodoFgWarn" },
    TodoSignTest = { link = "TodoFgTest" },

    -- Indent-blankline
    IblIndent     = { fg = colors.bg_2 },
    IblWhitespace = { fg = colors.bg_2 },
    IblScope      = { fg = colors.grey0 },

    -- Which-key
    WhichKey          = { fg = colors.aqua },
    WhichKeyDesc      = { fg = colors.fg },
    WhichKeyGroup     = { fg = colors.purple, italic = true },
    WhichKeySeparator = { fg = colors.grey0 },
    WhichKeyValue     = { fg = colors.grey1 },
    WhichKeyFloat     = { bg = colors.menu_bg },
    WhichKeyTitle     = { fg = colors.yellow, bold = true },
    WhichKeyBorder    = { fg = colors.grey0, bg = colors.menu_bg },
    WhichKeyNormal    = { bg = colors.menu_bg },

    -- Neogit
    NeogitDiffAdd                = { fg = colors.green, bg = colors.diff_add_bg },
    NeogitDiffAddHighlight       = { fg = colors.green, bg = colors.diff_add_bg, bold = true },
    NeogitDiffDelete             = { fg = colors.red, bg = colors.diff_delete_bg },
    NeogitDiffDeleteHighlight    = { fg = colors.red, bg = colors.diff_delete_bg, bold = true },
    NeogitDiffContext            = { fg = colors.fg },
    NeogitDiffContextHighlight   = { fg = colors.fg, bg = colors.bg_1 },
    NeogitHunkHeader             = { fg = colors.aqua, bg = colors.bg_1 },
    NeogitHunkHeaderHighlight    = { fg = colors.aqua, bg = colors.bg_1, bold = true },
    NeogitFilePath               = { fg = colors.purple, italic = true },
    NeogitCommitViewHeader       = { fg = colors.purple, bold = true },
    NeogitBranch                 = { fg = colors.orange, bold = true },
    NeogitRemote                 = { fg = colors.green, bold = true },
    NeogitTagName                = { fg = colors.yellow, bold = true },
    NeogitNotificationInfo       = { fg = colors.blue },
    NeogitNotificationWarning    = { fg = colors.yellow },
    NeogitNotificationError      = { fg = colors.red },

    -- Render-markdown
    RenderMarkdownH1         = { fg = colors.red, bold = true },
    RenderMarkdownH2         = { fg = colors.orange, bold = true },
    RenderMarkdownH3         = { fg = colors.yellow, bold = true },
    RenderMarkdownH4         = { fg = colors.green, bold = true },
    RenderMarkdownH5         = { fg = colors.aqua, bold = true },
    RenderMarkdownH6         = { fg = colors.purple, bold = true },
    RenderMarkdownH1Bg       = { fg = colors.red, bg = colors.bg_red, bold = true },
    RenderMarkdownH2Bg       = { fg = colors.orange, bg = colors.bg_yellow, bold = true },
    RenderMarkdownH3Bg       = { fg = colors.yellow, bg = colors.bg_yellow, bold = true },
    RenderMarkdownH4Bg       = { fg = colors.green, bg = colors.bg_green, bold = true },
    RenderMarkdownH5Bg       = { fg = colors.aqua, bg = colors.bg_blue, bold = true },
    RenderMarkdownH6Bg       = { fg = colors.purple, bg = colors.bg_blue, bold = true },
    RenderMarkdownCode       = { bg = colors.bg_dim },
    RenderMarkdownCodeInline = { fg = colors.yellow, bg = colors.bg_dim },
    RenderMarkdownQuote      = { fg = colors.grey1, italic = true },
    RenderMarkdownTableHead  = { fg = colors.aqua, bold = true },
    RenderMarkdownTableRow   = { fg = colors.fg },
    RenderMarkdownBullet     = { fg = colors.orange },
    RenderMarkdownDash       = { fg = colors.grey0 },
    RenderMarkdownTodo       = { fg = colors.purple, bold = true },
    RenderMarkdownLink       = { fg = colors.purple, underline = true },

    -- Bufferline
    BufferLineBufferSelected = { bg = colors.bg, underline = true, sp = colors.yellow },
    BufferLineFill           = { bg = colors.bg_dim },

    -- Barbar
    BufferCurrent       = { fg = colors.fg, bg = colors.bg },
    BufferCurrentIndex  = { fg = colors.grey1, bg = colors.bg },
    BufferCurrentMod    = { fg = colors.yellow, bg = colors.bg },
    BufferCurrentSign   = { fg = colors.yellow, bg = colors.bg },
    BufferCurrentTarget = { fg = colors.red, bg = colors.bg, bold = true },
    BufferCurrentERROR  = { fg = colors.red, bg = colors.bg },
    BufferCurrentWARN   = { fg = colors.yellow, bg = colors.bg },
    BufferCurrentINFO   = { fg = colors.blue, bg = colors.bg },
    BufferCurrentHINT   = { fg = colors.aqua, bg = colors.bg },

    BufferVisible       = { fg = colors.fg_dim, bg = colors.bg_dim },
    BufferVisibleIndex  = { fg = colors.fg_dim, bg = colors.bg_dim },
    BufferVisibleMod    = { fg = colors.yellow, bg = colors.bg_dim },
    BufferVisibleSign   = { fg = colors.grey1, bg = colors.bg_dim },
    BufferVisibleTarget = { fg = colors.red, bg = colors.bg_dim, bold = true },
    BufferVisibleERROR  = { fg = colors.red, bg = colors.bg_dim },
    BufferVisibleWARN   = { fg = colors.yellow, bg = colors.bg_dim },
    BufferVisibleINFO   = { fg = colors.blue, bg = colors.bg_dim },
    BufferVisibleHINT   = { fg = colors.aqua, bg = colors.bg_dim },

    BufferInactive       = { fg = colors.grey1, bg = colors.bg_dim },
    BufferInactiveIndex  = { fg = colors.grey1, bg = colors.bg_dim },
    BufferInactiveMod    = { fg = colors.yellow, bg = colors.bg_dim },
    BufferInactiveSign   = { fg = colors.grey0, bg = colors.bg_dim },
    BufferInactiveTarget = { fg = colors.red, bg = colors.bg_dim, bold = true },
    BufferInactiveERROR  = { fg = colors.red, bg = colors.bg_dim },
    BufferInactiveWARN   = { fg = colors.yellow, bg = colors.bg_dim },
    BufferInactiveINFO   = { fg = colors.blue, bg = colors.bg_dim },
    BufferInactiveHINT   = { fg = colors.aqua, bg = colors.bg_dim },

    BufferTabpages    = { fg = colors.yellow, bg = colors.bg_dim, bold = true },
    BufferTabpageFill = { fg = colors.grey0, bg = colors.bg_dim },
    BufferOffset      = { fg = colors.grey1, bg = colors.bg, bold = true },
    BufferScrollArrow = { fg = colors.fg, bg = colors.bg_dim, bold = true },
    BufferPart        = { fg = colors.aqua, bg = colors.bg_1, bold = true },

    -- Visual-whitespace
    VisualNonText = { fg = colors.grey0, bg = colors.bg_visual },

    -- Haunt
    HauntAnnotation = { fg = colors.grey1, italic = true },

    -- Copilot / AI
    CopilotSuggestion    = { link = "Comment" },
    CopilotAnnotation    = { fg = colors.grey1, italic = true },
    NeoCodeiumSuggestion = { link = "Comment" },

    -- Csvview
    CsvViewDelimiter = { fg = colors.grey0 },
    CsvViewCol0 = { fg = colors.aqua },
    CsvViewCol1 = { fg = colors.green },
    CsvViewCol2 = { fg = colors.yellow },
    CsvViewCol3 = { fg = colors.orange },
    CsvViewCol4 = { fg = colors.purple },
    CsvViewCol5 = { fg = colors.blue },

    -- vim-dadbod-ui
    dbui_tables           = { fg = colors.aqua },
    dbui_connection_ok    = { fg = colors.green },
    dbui_connection_error = { fg = colors.red },
    dbui_saved_query      = { fg = colors.purple },
    dbui_databases        = { fg = colors.orange },
    dbui_schemas          = { fg = colors.yellow },
    dbui_buffers          = { fg = colors.purple },
    dbout_header          = { fg = colors.aqua, bold = true },
    dbout_separator       = { fg = colors.grey1 },
    dbout_null            = { fg = colors.grey1, italic = true },

    -- grug-far
    GrugFarResultsChangeIndicator = { link = "Changed" },
    GrugFarResultsRemoveIndicator = { link = "Removed" },
    GrugFarResultsAddIndicator    = { link = "Added" },

    -- DAP
    DapStoppedLine     = { default = true, link = "Visual" },
    NvimDapVirtualText = { fg = colors.grey2, italic = true },

    -- Lazy / package manager
    LazyDimmed = { fg = colors.grey1 },

    -- Command line
    MoreMsg      = { fg = colors.yellow, bold = true },
    MsgArea      = { fg = colors.fg },
    MsgSeparator = { fg = colors.grey1, bg = colors.bg_statusline },

    -- Quickfix
    QuickFixLine = { italic = true, bg = colors.bg_2 },

    -- URLs
    HighlightUrl = { fg = colors.blue, underline = true, sp = colors.blue },
})

for group, opts in pairs(groups) do
    vim.api.nvim_set_hl(0, group, opts)
end
