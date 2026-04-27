-- cosmic-gleam (Light variant): gruvbox-material light, soothing parchment
-- Warm cream background with muted gruvbox accents. Easy on the eyes in daylight.

vim.cmd.highlight("clear")
if vim.fn.exists("syntax_on") then
    vim.cmd.syntax("reset")
end
vim.o.termguicolors = true
vim.g.colors_name = "cosmic-gleam-light"

local colors = {
    -- Backgrounds (warm parchment, gruvbox-material light medium)
    bg                 = "#f2e5bc",
    bg_dim             = "#ebdbb2",
    bg_0               = "#e8dab1",
    bg_1               = "#dec98a",
    bg_2               = "#d5c4a1",
    bg_statusline      = "#e8dab1",
    bg_visual          = "#d8c98a",
    bg_red             = "#f2d5cf",
    bg_green           = "#dfdfa6",
    bg_blue            = "#d6dccd",
    bg_yellow          = "#ecdca8",

    -- Foregrounds (deep warm brown for contrast)
    fg                 = "#4f3829",
    fg_dim             = "#5a4738",
    grey0              = "#a89984",
    grey1              = "#928374",
    grey2              = "#7c6f64",

    -- Light gruvbox-material palette (deeper, muted)
    red                = "#c14a4a",
    orange             = "#c35e0a",
    yellow             = "#b47109",
    green              = "#6c782e",
    aqua               = "#4c7a5d",
    blue               = "#45707a",
    purple             = "#945e80",

    bright_red         = "#c14a4a",
    bright_green       = "#6c782e",
    bright_yellow      = "#b47109",
    bright_blue        = "#45707a",
    bright_purple      = "#945e80",
    bright_aqua        = "#4c7a5d",

    selection          = "#d5c4a1",
    visual             = "#d8c98a",
    cursor_line        = "#ebdbb2",
    line_nr            = "#bdae93",
    line_nr_active     = "#b47109",
    comment            = "#a89984",
    nontext            = "#bdae93",
    sign_column        = "#f2e5bc",

    menu_bg            = "#ebdbb2",
    menu_sel           = "#d8c98a",

    diff_add_bg        = "#dfdfa6",
    diff_change_bg     = "#dde2d2",
    diff_delete_bg     = "#f2d5cf",
    diff_text_bg       = "#cdd6c0",

    black              = "#3c3836",
    white              = "#fbf1c7",
}

vim.g.terminal_color_0  = colors.fg
vim.g.terminal_color_1  = colors.red
vim.g.terminal_color_2  = colors.green
vim.g.terminal_color_3  = colors.yellow
vim.g.terminal_color_4  = colors.blue
vim.g.terminal_color_5  = colors.purple
vim.g.terminal_color_6  = colors.aqua
vim.g.terminal_color_7  = colors.bg_2
vim.g.terminal_color_8  = colors.grey1
vim.g.terminal_color_9  = colors.bright_red
vim.g.terminal_color_10 = colors.bright_green
vim.g.terminal_color_11 = colors.bright_yellow
vim.g.terminal_color_12 = colors.bright_blue
vim.g.terminal_color_13 = colors.bright_purple
vim.g.terminal_color_14 = colors.bright_aqua
vim.g.terminal_color_15 = colors.white
vim.g.terminal_color_background = colors.bg
vim.g.terminal_color_foreground = colors.fg

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
    WildMenu        = { fg = colors.bg, bg = colors.yellow },

    -- Treesitter
    ["@annotation"]               = { fg = colors.purple },
    ["@attribute"]                = { fg = colors.purple },
    ["@boolean"]                  = { fg = colors.purple },
    ["@character"]                = { fg = colors.aqua },
    ["@character.special"]        = { fg = colors.orange },
    ["@comment"]                  = { link = "Comment" },
    ["@constant"]                 = { fg = colors.purple },
    ["@constant.builtin"]         = { fg = colors.purple, italic = true },
    ["@constant.macro"]           = { fg = colors.aqua },
    ["@constructor"]              = { fg = colors.yellow },
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
    ["@markup.heading"]           = { fg = colors.red, bold = true },
    ["@markup.link"]              = { fg = colors.blue, underline = true },
    ["@markup.link.uri"]          = { fg = colors.aqua, italic = true, underline = true },
    ["@markup.list"]              = { fg = colors.orange },
    ["@markup.raw"]               = { fg = colors.aqua },
    ["@markup.strong"]            = { bold = true },
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

    -- Diagnostics
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
    LspInlayHint                    = { fg = colors.grey0, bg = colors.bg_1, italic = true },
    LspReferenceRead                = { bg = colors.bg_2 },
    LspReferenceText                = { bg = colors.bg_2 },
    LspReferenceWrite               = { bg = colors.bg_2, bold = true },

    -- Diff
    DiffAdd               = { bg = colors.diff_add_bg },
    DiffChange            = { bg = colors.diff_change_bg },
    DiffDelete            = { fg = colors.red, bg = colors.diff_delete_bg },
    DiffText              = { fg = colors.fg, bg = colors.diff_text_bg, bold = true },
    diffAdded             = { fg = colors.green, bold = true },
    diffChanged           = { fg = colors.yellow, bold = true },
    diffRemoved           = { fg = colors.red, bold = true },

    GitSignsAdd               = { fg = colors.green },
    GitSignsChange            = { fg = colors.aqua },
    GitSignsCurrentLineBlame  = { fg = colors.grey0, italic = true },
    GitSignsDelete            = { fg = colors.red },

    HighlightUrl = { fg = colors.blue, underline = true, sp = colors.blue },
})

for group, opts in pairs(groups) do
    vim.api.nvim_set_hl(0, group, opts)
end
