return {
	"catppuccin/nvim",
	name = "catppuccin",
	priority = 1000,
	enabled = true,
	config = function()
		vim.cmd.highlight("clear")
		if vim.g.syntax_on then
			vim.cmd.syntax("reset")
		end
		vim.g.colors_name = "gruvbox-material"

		--------------------------------------------------------------------------------
		-- Gruvbox Material Color Palette
		--------------------------------------------------------------------------------

		-- Background colors (dark to light)
		local bg = "#1d2021" -- Main background
		local bg_dark = "#191b1c" -- Darker background (statusline, floats)
		local bg_soft = "#282828" -- Soft background
		local bg_highlight = "#3c3836" -- Highlighted background
		local bg_visual = "#504945" -- Visual selection

		-- Foreground colors (light to dark)
		local fg = "#ebdbb2" -- Main foreground
		local fg_soft = "#ddc7a1" -- Soft foreground
		local fg_dark = "#d5c4a1" -- Darker foreground
		local fg_muted = "#a89984" -- Muted foreground

		-- Gruvbox Material core colors
		local red = "#ea6962"
		local orange = "#e78a4e"
		local yellow = "#d8a657"
		local green = "#a9b665"
		local aqua = "#89b482"
		local blue = "#7daea3"
		local purple = "#d3869b"

		-- UI colors
		local comment = "#928374" -- Comments and muted text
		local line_nr = "#3a4a3a" -- Line numbers
		local line_nr_active = "#89b482" -- Active line number
		local gutter = "#504945" -- Gutter/sign column neutral

		-- Semantic colors
		local error = red
		local warning = yellow
		local info = aqua
		local hint = green

		-- Surface colors (layered backgrounds)
		local surface0 = "#32302f" -- Subtle surface
		local surface1 = "#3c3836" -- Normal surface
		local surface2 = "#504945" -- Elevated surface
		local overlay = "#7c6f64" -- Overlay elements

		-- Diff colors
		local diff_add_bg = "#2a3320"
		local diff_change_bg = "#1a2a30"
		local diff_delete_bg = "#3a2020"

		-- Special colors
		local current_word_bg = "#32302f"
		local shadow = "#000000"
		local debug_pc_bg = "#324232"

		--------------------------------------------------------------------------------
		-- Terminal Colors
		--------------------------------------------------------------------------------
		vim.g.terminal_color_0 = gutter
		vim.g.terminal_color_1 = red
		vim.g.terminal_color_2 = green
		vim.g.terminal_color_3 = yellow
		vim.g.terminal_color_4 = blue
		vim.g.terminal_color_5 = purple
		vim.g.terminal_color_6 = aqua
		vim.g.terminal_color_7 = fg_dark
		vim.g.terminal_color_8 = gutter
		vim.g.terminal_color_9 = red
		vim.g.terminal_color_10 = green
		vim.g.terminal_color_11 = yellow
		vim.g.terminal_color_12 = blue
		vim.g.terminal_color_13 = purple
		vim.g.terminal_color_14 = aqua
		vim.g.terminal_color_15 = fg

		--------------------------------------------------------------------------------
		-- Highlight Groups
		--------------------------------------------------------------------------------
		local theme = {
			-- Base UI
			Normal = { fg = fg, bg = bg },
			NormalNC = {},
			NormalFloat = { fg = fg_soft, bg = bg_highlight },
			FloatBorder = { fg = comment, bg = bg },
			FloatTitle = { fg = yellow, bg = bg_highlight, bold = true },
			FloatShadow = { bg = shadow, blend = 80 },
			FloatShadowThrough = { bg = shadow, blend = 100 },

			-- Cursor
			Cursor = { reverse = true },
			lCursor = { fg = bg, bg = fg },
			CursorIM = { link = "Cursor" },
			vCursor = { link = "Cursor" },
			iCursor = { link = "Cursor" },
			CursorLine = { bg = bg_soft },
			CursorColumn = { bg = bg_soft },
			CursorLineNr = { fg = line_nr_active },
			CursorLineSign = { link = "SignColumn" },
			CursorLineFold = { link = "FoldColumn" },
			TermCursor = { reverse = true },
			TermCursorNC = {},

			-- Line Numbers
			LineNr = { fg = line_nr },
			LineNrAbove = { link = "LineNr" },
			LineNrBelow = { link = "LineNr" },
			SignColumn = { fg = fg },
			FoldColumn = { fg = gutter },
			Folded = { fg = comment, bg = bg_soft },

			-- Search
			Search = { fg = bg, bg = green },
			CurSearch = { fg = bg, bg = orange },
			IncSearch = { fg = bg, bg = red },
			Substitute = { fg = bg, bg = yellow },

			-- Selection
			Visual = { bg = bg_visual },
			VisualNC = {},
			VisualNOS = { bg = bg_visual },

			-- Splits & Windows
			VertSplit = { fg = gutter },
			WinSeparator = { link = "VertSplit" },
			WinBar = { bold = true },
			WinBarNC = { link = "Grey" },

			-- Status & Tab Lines
			StatusLine = { fg = fg_soft, bg = bg_dark },
			StatusLineNC = { fg = comment, bg = bg_dark },
			StatusLineTerm = { fg = fg_soft, bg = bg_soft },
			StatusLineTermNC = { fg = comment, bg = bg_soft },
			TabLine = { fg = fg_soft, bg = gutter },
			TabLineSel = { fg = bg, bg = fg_muted },
			TabLineFill = { fg = fg_soft, bg = bg_dark },

			-- Completions Menu
			Pmenu = { fg = fg_soft, bg = bg_highlight },
			PmenuSel = { fg = bg, bg = fg_muted },
			PmenuSbar = { bg = bg_highlight },
			PmenuThumb = { bg = overlay },
			PmenuExtra = { fg = fg_dark, bg = bg_highlight },
			WildMenu = { fg = bg, bg = yellow },

			-- Messages
			ModeMsg = { fg = fg, bold = true },
			MoreMsg = { fg = yellow, bold = true },
			WarningMsg = { fg = yellow, bold = true },
			ErrorMsg = { fg = red, bold = true, underline = true },
			Question = { fg = yellow },
			MsgArea = {},
			MsgSeparator = { link = "StatusLine" },

			-- Diffs
			DiffAdd = { bg = diff_add_bg },
			DiffChange = { bg = diff_change_bg },
			DiffDelete = { bg = diff_delete_bg },
			DiffText = { fg = bg, bg = blue },
			diffAdded = { link = "Green" },
			diffRemoved = { link = "Red" },
			diffChanged = { link = "Blue" },
			diffFile = { link = "Aqua" },
			diffNewFile = { link = "Orange" },
			diffOldFile = { link = "Yellow" },
			diffLine = { link = "Grey" },
			diffIndexLine = { link = "Purple" },

			-- Spelling
			SpellBad = { undercurl = true, special = red },
			SpellCap = { undercurl = true, special = blue },
			SpellRare = { undercurl = true, special = purple },
			SpellLocal = { undercurl = true, special = aqua },

			-- Misc UI
			ColorColumn = { bg = bg_soft },
			Conceal = { fg = gutter },
			Directory = { fg = green },
			EndOfBuffer = { fg = gutter, bg = bg },
			MatchParen = { fg = orange, bg = bg_highlight, bold = true },
			MatchParenCur = { fg = orange, bold = true },
			MatchWord = { bg = bg_highlight, underline = true },
			MatchWordCur = { bg = bg_highlight, underline = true },
			-- vim-matchup: highlight enclosing scope brackets
			MatchBackground = { bg = bg_soft },
			MatchParenOffscreen = { fg = orange, bg = bg_highlight, italic = true },
			MatchupVirtualText = { fg = orange, italic = true },
			NonText = { fg = gutter },
			SpecialKey = { fg = gutter },
			Title = { fg = orange, bold = true },
			Whitespace = { fg = gutter },
			QuickFixLine = { fg = purple, bold = true },
			CurrentWord = { bg = current_word_bg },
			CurrentWordTwins = { link = "CurrentWord" },
			CursorWord0 = { link = "CurrentWord" },
			CursorWord1 = { link = "CurrentWord" },

			-- Debug
			debugPC = { bg = debug_pc_bg },
			debugBreakpoint = { fg = bg, bg = red },

			-- Terminal
			Terminal = { fg = fg, bg = bg },

			--------------------------------------------------------------------------------
			-- Syntax Highlighting
			--------------------------------------------------------------------------------
			Comment = { fg = comment, italic = true },
			SpecialComment = { fg = comment, italic = true },

			Constant = { fg = aqua },
			String = { fg = green },
			Character = { fg = green },
			Number = { fg = purple },
			Boolean = { fg = purple },
			Float = { fg = purple },

			Identifier = { fg = fg },
			Function = { fg = green },

			Statement = { fg = red },
			Conditional = { fg = red },
			Repeat = { fg = red },
			Label = { fg = orange },
			Operator = { fg = orange },
			Keyword = { fg = red },
			Exception = { fg = red },

			PreProc = { fg = purple },
			Include = { fg = purple },
			Define = { fg = purple },
			Macro = { fg = aqua },
			PreCondit = { fg = purple },

			Type = { fg = yellow },
			StorageClass = { fg = orange },
			Structure = { fg = orange },
			Typedef = { fg = red },

			Special = { fg = yellow },
			SpecialChar = { fg = yellow },
			Tag = { fg = orange },
			Delimiter = { fg = fg },
			Debug = { fg = orange },

			Underlined = { underline = true },
			Bold = { bold = true },
			Italic = { italic = true },
			Ignore = { fg = comment },
			Error = { fg = red },
			Warning = {},
			Todo = { fg = purple, italic = true },

			--------------------------------------------------------------------------------
			-- Diagnostics
			--------------------------------------------------------------------------------
			DiagnosticError = { fg = error },
			DiagnosticWarn = { fg = warning },
			DiagnosticInfo = { fg = info },
			DiagnosticHint = { fg = hint },
			DiagnosticInformation = { link = "DiagnosticInfo" },
			DiagnosticWarning = { link = "DiagnosticWarn" },

			DiagnosticUnderlineError = { underline = true, special = error },
			DiagnosticUnderlineWarn = { underline = true, special = warning },
			DiagnosticUnderlineInfo = { underline = true, special = info },
			DiagnosticUnderlineHint = { underline = true, special = hint },

			DiagnosticVirtualTextError = { link = "Grey" },
			DiagnosticVirtualTextWarn = { link = "Grey" },
			DiagnosticVirtualTextInfo = { link = "Grey" },
			DiagnosticVirtualTextHint = { link = "Grey" },

			DiagnosticFloatingError = { link = "ErrorFloat" },
			DiagnosticFloatingWarn = { link = "WarningFloat" },
			DiagnosticFloatingInfo = { link = "InfoFloat" },
			DiagnosticFloatingHint = { link = "HintFloat" },

			DiagnosticSignError = { link = "RedSign" },
			DiagnosticSignWarn = { link = "YellowSign" },
			DiagnosticSignInfo = { link = "BlueSign" },
			DiagnosticSignHint = { link = "GreenSign" },

			ErrorFloat = { fg = red, bg = bg_highlight },
			WarningFloat = { fg = yellow, bg = bg_highlight },
			InfoFloat = { fg = blue, bg = bg_highlight },
			HintFloat = { fg = green, bg = bg_highlight },

			ErrorText = { undercurl = true, special = red },
			WarningText = { undercurl = true, special = yellow },
			InfoText = { undercurl = true, special = blue },
			HintText = { undercurl = true, special = green },

			VirtualTextError = { link = "Grey" },
			VirtualTextWarning = { link = "Grey" },
			VirtualTextInfo = { link = "Grey" },
			VirtualTextHint = { link = "Grey" },

			--------------------------------------------------------------------------------
			-- LSP
			--------------------------------------------------------------------------------
			LspReferenceText = { link = "CurrentWord" },
			LspReferenceRead = { link = "CurrentWord" },
			LspReferenceWrite = { link = "CurrentWord" },
			LspSignatureActiveParameter = { link = "Search" },
			LspCodeLens = { link = "VirtualTextInfo" },
			LspCodeLensSeparator = { link = "VirtualTextHint" },
			LspErrorHighlight = { link = "ErrorText" },
			LspWarningHighlight = { link = "WarningText" },
			LspInformationHighlight = { link = "InfoText" },
			LspHintHighlight = { link = "HintText" },
			LspErrorVirtual = { link = "VirtualTextError" },
			LspWarningVirtual = { link = "VirtualTextWarning" },
			LspInformationVirtual = { link = "VirtualTextInfo" },
			LspHintVirtual = { link = "VirtualTextHint" },
			LspLinesDiagBorder = { link = "Yellow" },
			LineDiagTuncateLine = { link = "Yellow" },

			lspInlayHintsParameter = { link = "LineNr" },
			lspInlayHintsType = { link = "LineNr" },
			lspReference = { link = "CurrentWord" },

			["@lsp.type.class"] = { fg = yellow },
			["@lsp.type.decorator"] = { fg = orange },
			["@lsp.type.enum"] = { fg = yellow },
			["@lsp.type.enumMember"] = { fg = purple },
			["@lsp.type.function"] = { fg = green },
			["@lsp.type.interface"] = { fg = yellow },
			["@lsp.type.macro"] = { fg = aqua },
			["@lsp.type.member"] = { fg = green },
			["@lsp.type.method"] = { fg = green },
			["@lsp.type.namespace"] = { fg = aqua },
			["@lsp.type.parameter"] = { fg = orange },
			["@lsp.type.property"] = { fg = fg },
			["@lsp.type.struct"] = { fg = yellow },
			["@lsp.type.type"] = { fg = yellow },
			["@lsp.type.typeParameter"] = { fg = yellow },
			["@lsp.type.variable"] = { fg = fg },

			-- TypeScript LSP specific
			["@lsp.type.member.typescript"] = { fg = green },
			["@lsp.type.member.typescriptreact"] = { fg = green },

			--------------------------------------------------------------------------------
			-- Treesitter
			--------------------------------------------------------------------------------
			["@variable"] = { fg = fg },
			["@variable.builtin"] = { fg = orange },
			["@variable.parameter"] = { fg = orange },
			["@variable.member"] = { fg = fg },
			["@property"] = { fg = fg },
			["@constant"] = { fg = aqua },
			["@constant.builtin"] = { fg = purple },
			["@module"] = { fg = aqua },
			["@label"] = { fg = orange },
			["@string"] = { fg = green },
			["@string.regexp"] = { fg = orange },
			["@string.escape"] = { fg = yellow },
			["@character"] = { fg = green },
			["@number"] = { fg = purple },
			["@boolean"] = { fg = purple },
			["@function"] = { fg = green },
			["@function.builtin"] = { fg = green },
			["@function.call"] = { fg = green },
			["@function.macro"] = { fg = aqua },
			["@method"] = { fg = green },
			["@method.call"] = { fg = green },
			["@constructor"] = { fg = yellow },
			["@type"] = { fg = yellow },
			["@type.builtin"] = { fg = orange },
			["@type.definition"] = { fg = yellow },
			["@attribute"] = { fg = orange },
			["@keyword"] = { fg = red },
			["@keyword.function"] = { fg = red },
			["@keyword.operator"] = { fg = red },
			["@keyword.return"] = { fg = red },
			["@keyword.conditional"] = { fg = red },
			["@keyword.repeat"] = { fg = red },
			["@keyword.import"] = { fg = purple },
			["@operator"] = { fg = orange },
			["@punctuation.delimiter"] = { fg = fg },
			-- ["@punctuation.bracket"] = { fg = fg },
			["@punctuation.special"] = { fg = orange },
			["@comment"] = { fg = comment, italic = true },
			["@tag"] = { fg = orange },
			["@tag.attribute"] = { fg = blue },
			["@tag.delimiter"] = { fg = fg },
			["@markup.strong"] = { bold = true },
			["@markup.italic"] = { italic = true },
			["@markup.underline"] = { underline = true },
			["@markup.heading"] = { fg = yellow, bold = true },
			["@markup.link"] = { fg = blue, underline = true },
			["@markup.link.url"] = { fg = aqua, underline = true },
			["@markup.list"] = { fg = orange },
			["@markup.raw"] = { fg = green },
			["@diff.plus"] = { fg = green },
			["@diff.minus"] = { fg = red },
			["@diff.delta"] = { fg = blue },

			-- TypeScript specific
			typescriptBlock = { fg = fg },
			typescriptVariableDeclaration = { fg = red },
			typescriptVariable = { fg = red },
			typescriptIdentifierName = { fg = fg },
			typescriptReserved = { fg = red },
			typescriptOperator = { fg = orange },
			typescriptCall = { fg = green },
			typescriptMember = { fg = green },
			typescriptMemberExpression = { fg = green },
			typescriptFuncCallArg = { fg = fg },
			typescriptPropertySignature = { fg = fg },
			typescriptMethodSignature = { fg = green },
			typescriptFuncName = { fg = green },
			typescriptFuncKeyword = { fg = red },
			typescriptArrowFunc = { fg = red },
			typescriptArrowFuncArg = { fg = orange },
			typescriptProp = { fg = fg },
			typescriptConditional = { fg = red },
			typescriptRepeat = { fg = red },
			typescriptStatementKeyword = { fg = red },
			typescriptImport = { fg = purple },
			typescriptExport = { fg = purple },
			typescriptTypeReference = { fg = yellow },
			typescriptString = { fg = green },
			typescriptNumber = { fg = purple },
			typescriptBoolean = { fg = purple },
			typescriptNull = { fg = purple },

			-- JavaScript/TypeScript function calls
			["@function.method"] = { fg = green },
			["@function.method.call"] = { fg = green },
			["@lsp.typemod.function.defaultLibrary"] = { fg = green },
			["@lsp.typemod.method.defaultLibrary"] = { fg = green },
			["@lsp.mod.defaultLibrary"] = {},

			--------------------------------------------------------------------------------
			-- Plugin: Snacks Pickers
			--------------------------------------------------------------------------------
			SnacksPickerDir = { fg = blue, bold = true },
			SnacksPickerFile = { fg = fg },
			SnacksPickerMatch = { fg = orange, bold = true },
			SnacksPickerIcon = { fg = aqua },
			SnacksPickerTitle = { fg = yellow, bold = true },
			SnacksPickerBorder = { fg = comment, bg = bg },
			SnacksPickerCursor = { fg = fg, bg = bg_visual, bold = true },
			SnacksPickerCursorLine = { bg = bg_visual },
			SnacksPickerSelected = { fg = orange, bg = bg_highlight, bold = true },
			SnacksPickerPreview = { fg = fg_dark, bg = bg_dark },
			SnacksPickerPrompt = { fg = fg, bg = bg },
			SnacksPickerNormal = { fg = fg, bg = bg },
			SnacksPickerInput = { fg = fg, bg = bg_dark },
			SnacksPickerInputBorder = { fg = line_nr_active, bg = bg_dark },

			--------------------------------------------------------------------------------
			-- Plugin: GitSigns
			--------------------------------------------------------------------------------
			GitSignsAdd = { fg = green },
			GitSignsChange = { fg = blue },
			GitSignsDelete = { fg = red },
			GitSignsAddNr = { fg = green },
			GitSignsChangeNr = { fg = blue },
			GitSignsDeleteNr = { fg = red },
			GitSignsAddLn = { bg = diff_add_bg },
			GitSignsChangeLn = { bg = diff_change_bg },
			GitSignsDeleteLn = { bg = diff_delete_bg },
			GitSignsAddInline = { bg = diff_add_bg },
			GitSignsChangeInline = { bg = diff_change_bg },
			GitSignsDeleteInline = { bg = diff_delete_bg },
			GitSignsCurrentLineBlame = { fg = comment, italic = true },
			GitSignsAddPreview = { link = "GitSignsAddLn" },
			GitSignsDeletePreview = { link = "GitSignsDeleteLn" },
			GitGutterChange = { link = "BlueSign" },

			--------------------------------------------------------------------------------
			-- Plugin: DiffView
			--------------------------------------------------------------------------------
			DiffviewPrimary = { fg = purple },
			DiffviewSecondary = { fg = blue },
			DiffviewStatusAdded = { fg = green },
			DiffviewStatusModified = { fg = blue },
			DiffviewStatusRenamed = { fg = blue },
			DiffviewStatusCopied = { fg = blue },
			DiffviewStatusTypeChange = { fg = blue },
			DiffviewStatusUnmerged = { fg = orange },
			DiffviewStatusUnknown = { fg = red },
			DiffviewStatusDeleted = { fg = red },
			DiffviewStatusBroken = { fg = red },
			DiffviewStatusIgnored = { fg = comment },
			DiffviewStatusUntracked = { fg = comment },
			DiffviewFilePanelTitle = { fg = yellow, bold = true },
			DiffviewFilePanelCounter = { fg = purple, bold = true },
			DiffviewFilePanelFileName = { fg = fg },
			DiffviewFilePanelPath = { fg = comment },
			DiffviewFilePanelInsertions = { fg = green },
			DiffviewFilePanelDeletions = { fg = red },
			DiffviewFilePanelSelected = { fg = yellow, bold = true },
			DiffviewFilePanelConflicts = { fg = red, bold = true },
			DiffviewFolderName = { fg = blue },
			DiffviewFolderSign = { fg = comment },
			DiffviewReference = { fg = purple, bold = true },
			DiffviewHash = { fg = aqua },
			DiffviewStatusLine = { fg = fg_dark, bg = bg_dark },
			DiffviewStatusLineNC = { fg = comment, bg = bg_dark },
			DiffviewNormal = { fg = fg, bg = bg },
			DiffviewCursorLine = { bg = bg_soft },
			DiffviewVertSplit = { fg = gutter },
			DiffviewSignColumn = { fg = fg, bg = bg },
			DiffviewDiffAdd = { bg = diff_add_bg },
			DiffviewDiffChange = { bg = diff_change_bg },
			DiffviewDiffDelete = { bg = diff_delete_bg, fg = comment },
			DiffviewDiffText = { bg = diff_change_bg },
			DiffviewDiffAddAsDelete = { bg = diff_delete_bg, fg = comment },

			--------------------------------------------------------------------------------
			-- Plugin: Blink.cmp (completion)
			--------------------------------------------------------------------------------
			BlinkCmpMenu = { fg = fg_dark, bg = bg_highlight },
			BlinkCmpMenuBorder = { fg = comment, bg = bg_highlight },
			BlinkCmpMenuSelection = { fg = bg, bg = line_nr_active },
			BlinkCmpLabel = { fg = fg },
			BlinkCmpLabelDeprecated = { fg = comment, strikethrough = true },
			BlinkCmpLabelMatch = { fg = orange, bold = true },
			BlinkCmpLabelDescription = { fg = comment },
			BlinkCmpLabelDetail = { fg = blue },
			BlinkCmpKind = { fg = purple },
			BlinkCmpKindText = { fg = fg },
			BlinkCmpKindMethod = { fg = blue },
			BlinkCmpKindFunction = { fg = green },
			BlinkCmpKindConstructor = { fg = yellow },
			BlinkCmpKindField = { fg = fg },
			BlinkCmpKindVariable = { fg = fg },
			BlinkCmpKindClass = { fg = yellow },
			BlinkCmpKindInterface = { fg = yellow },
			BlinkCmpKindModule = { fg = aqua },
			BlinkCmpKindProperty = { fg = fg },
			BlinkCmpKindUnit = { fg = purple },
			BlinkCmpKindValue = { fg = purple },
			BlinkCmpKindEnum = { fg = yellow },
			BlinkCmpKindKeyword = { fg = red },
			BlinkCmpKindSnippet = { fg = green },
			BlinkCmpKindColor = { fg = aqua },
			BlinkCmpKindFile = { fg = blue },
			BlinkCmpKindReference = { fg = orange },
			BlinkCmpKindFolder = { fg = blue },
			BlinkCmpKindEnumMember = { fg = purple },
			BlinkCmpKindConstant = { fg = aqua },
			BlinkCmpKindStruct = { fg = yellow },
			BlinkCmpKindEvent = { fg = orange },
			BlinkCmpKindOperator = { fg = orange },
			BlinkCmpKindTypeParameter = { fg = yellow },
			BlinkCmpDoc = { fg = fg_dark, bg = bg_highlight },
			BlinkCmpDocBorder = { fg = comment, bg = bg_highlight },
			BlinkCmpSignatureHelp = { fg = fg_dark, bg = bg_highlight },
			BlinkCmpSignatureHelpBorder = { fg = comment, bg = bg_highlight },
			BlinkCmpSignatureHelpActiveParameter = { fg = orange, bold = true },
			BlinkCmpGhostText = { fg = comment },
			BlinkCmpScrollBarThumb = { bg = surface2 },
			BlinkCmpScrollBarGutter = { bg = surface0 },
			BlinkCmpSource = { fg = overlay, bg = bg_dark },
			BlinkCmpDocSeparator = { fg = surface1, bg = bg_dark },
			BlinkCmpDocCursorLine = { bg = surface0 },

			--------------------------------------------------------------------------------
			-- Plugin: Mini.nvim
			--------------------------------------------------------------------------------
			MiniAnimateNormalFloat = { link = "NormalFloat" },
			MiniCursorword = { bg = bg_highlight },
			MiniCursorwordCurrent = { bg = bg_highlight },
			MiniIndentscopeSymbol = { fg = line_nr_active },
			MiniIndentscopePrefix = { nocombine = true },
			MiniOperatorsExchangeFrom = { bg = bg_visual },
			MiniSurround = { bg = bg_visual },
			MiniIconsAzure = { fg = blue },
			MiniIconsBlue = { fg = blue },
			MiniIconsCyan = { fg = aqua },
			MiniIconsGreen = { fg = green },
			MiniIconsGrey = { fg = comment },
			MiniIconsOrange = { fg = orange },
			MiniIconsPurple = { fg = purple },
			MiniIconsRed = { fg = red },
			MiniIconsYellow = { fg = yellow },

			--------------------------------------------------------------------------------
			-- Plugin: Harpoon
			--------------------------------------------------------------------------------
			HarpoonWindow = { fg = fg, bg = bg },
			HarpoonBorder = { fg = comment, bg = bg },
			HarpoonTitle = { fg = yellow, bold = true },
			HarpoonNumberActive = { fg = orange, bold = true },
			HarpoonNumberInactive = { fg = comment },

			--------------------------------------------------------------------------------
			-- Plugin: Render Markdown
			--------------------------------------------------------------------------------
			RenderMarkdownH1Bg = { bg = bg_dark },
			RenderMarkdownH2Bg = { bg = bg_dark },
			RenderMarkdownH3Bg = { bg = bg_dark },
			RenderMarkdownH4Bg = { bg = bg_dark },
			RenderMarkdownH5Bg = { bg = bg_dark },
			RenderMarkdownH6Bg = { bg = bg_dark },
			RenderMarkdownCode = { bg = bg_dark },
			RenderMarkdownCodeInline = { fg = green, bg = bg_dark },
			RenderMarkdownBullet = { fg = orange },
			RenderMarkdownTableHead = { fg = yellow },
			RenderMarkdownTableRow = { fg = fg },
			RenderMarkdownSuccess = { fg = green },
			RenderMarkdownInfo = { fg = blue },
			RenderMarkdownHint = { fg = aqua },
			RenderMarkdownWarn = { fg = yellow },
			RenderMarkdownError = { fg = red },
			RenderMarkdownQuote = { fg = comment, italic = true },
			RenderMarkdownLink = { fg = blue, underline = true },

			--------------------------------------------------------------------------------
			-- Plugin: Fyler (file explorer)
			--------------------------------------------------------------------------------
			FylerNormal = { fg = fg, bg = bg },
			FylerBorder = { fg = comment, bg = bg },
			FylerTitle = { fg = yellow, bold = true },
			FylerDirectory = { fg = blue, bold = true },
			FylerFile = { fg = fg },
			FylerExecutable = { fg = green },
			FylerLink = { fg = aqua },
			FylerSelected = { fg = orange, bold = true },
			FylerCursor = { bg = bg_highlight },

			--------------------------------------------------------------------------------
			-- Plugin: Incline
			--------------------------------------------------------------------------------
			InclineNormalNC = { fg = comment, bg = surface1 },

			--------------------------------------------------------------------------------
			-- Plugin: Hop
			--------------------------------------------------------------------------------
			HopNextKey = { fg = orange, bold = true },
			HopNextKey1 = { fg = green, bold = true },
			HopNextKey2 = { link = "Green" },
			HopPreview = { fg = aqua, bold = true },
			HopUnmatched = { link = "Grey" },
			HopCursor = { link = "Cursor" },

			--------------------------------------------------------------------------------
			-- Plugin: Indent Blankline
			--------------------------------------------------------------------------------
			IndentBlanklineSpaceCharBlankline = { link = "LineNr" },
			IndentBlanklineSpaceChar = { link = "LineNr" },
			IndentBlanklineChar = { link = "LineNr" },
			IndentBlanklineContextChar = { fg = orange },
			IndentBlanklineContextStart = { underline = true, special = orange },
			IblIndent = { fg = gutter },
			IblWhitespace = { fg = gutter },
			IblScope = { fg = orange },

			--------------------------------------------------------------------------------
			-- Plugin: Rainbow Delimiters (scope brackets)
			--------------------------------------------------------------------------------
			-- RainbowDelimiterRed = { fg = red },
			-- RainbowDelimiterYellow = { fg = yellow },
			-- RainbowDelimiterBlue = { fg = blue },
			-- RainbowDelimiterOrange = { fg = orange },
			-- RainbowDelimiterGreen = { fg = green },
			-- RainbowDelimiterViolet = { fg = purple },
			-- RainbowDelimiterCyan = { fg = aqua },

			--------------------------------------------------------------------------------
			-- Plugin: nvim-ts-rainbow2 / rainbow-delimiters
			--------------------------------------------------------------------------------
			TSRainbowRed = { fg = red },
			TSRainbowYellow = { fg = yellow },
			TSRainbowBlue = { fg = blue },
			TSRainbowOrange = { fg = orange },
			TSRainbowGreen = { fg = green },
			TSRainbowViolet = { fg = purple },
			TSRainbowCyan = { fg = aqua },

			--------------------------------------------------------------------------------
			-- Plugin: Trouble
			--------------------------------------------------------------------------------
			TroubleCode = { link = "Grey" },
			TroubleSource = { link = "Grey" },
			TroubleText = { link = "Fg" },

			--------------------------------------------------------------------------------
			-- Plugin: Floaterm
			--------------------------------------------------------------------------------
			FloatermBorder = { link = "Grey" },

			--------------------------------------------------------------------------------
			-- Plugin: Blamer
			--------------------------------------------------------------------------------
			Blamer = { link = "Grey" },

			--------------------------------------------------------------------------------
			-- Plugin: Multiple Cursors
			--------------------------------------------------------------------------------
			multiple_cursors_cursor = { link = "Cursor" },

			--------------------------------------------------------------------------------
			-- Plugin: Highlighted Yank
			--------------------------------------------------------------------------------
			HighlightedyankRegion = { link = "Visual" },

			--------------------------------------------------------------------------------
			-- Health
			--------------------------------------------------------------------------------
			healthError = { link = "Red" },
			healthSuccess = { link = "Green" },
			healthWarning = { link = "Yellow" },

			--------------------------------------------------------------------------------
			-- Misc Plugin Highlights
			--------------------------------------------------------------------------------
			DefinitionIcon = { link = "Blue" },
			DefinitionCount = { link = "Grey" },
			DefinitionPreviewTitle = { fg = blue, bold = true },
			ReferencesCount = { link = "Grey" },
			TargetFileName = { link = "Grey" },
			SignatureMarkerText = { link = "PurpleSign" },
			SignatureMarkText = { link = "BlueSign" },

			--------------------------------------------------------------------------------
			-- GPG
			--------------------------------------------------------------------------------
			GPGHighlightUnknownRecipient = { link = "ErrorMsg" },
			GPGError = { link = "ErrorMsg" },
			GPGWarning = { link = "WarningMsg" },

			--------------------------------------------------------------------------------
			-- Toolbar
			--------------------------------------------------------------------------------
			ToolbarLine = { fg = fg_soft, bg = bg_highlight },
			ToolbarButton = { fg = bg, bg = fg_muted },

			--------------------------------------------------------------------------------
			-- Markdown (legacy)
			--------------------------------------------------------------------------------
			MarkdownH1 = { fg = red, bold = true },
			MarkdownH2 = { fg = orange, bold = true },
			MarkdownH3 = { fg = yellow, bold = true },
			MarkdownH4 = { fg = green, bold = true },
			MarkdownH5 = { fg = blue, bold = true },
			MarkdownH6 = { fg = purple, bold = true },
			MarkdownHeading = {},
			MarkdownHeadingDelimiter = {},
			MarkdownHeadingRule = {},
			MarkdownBold = { bold = true },
			MarkdownBoldDelimiter = {},
			MarkdownItalic = { italic = true },
			MarkdownItalicDelimiter = {},
			MarkdownCode = { fg = green },
			MarkdownCodeBlock = { fg = green },
			MarkdownCodeDelimiter = { fg = comment },
			MarkdownUrl = { fg = aqua, underline = true },
			MarkdownLinkText = { fg = blue },
			MarkdownLinkDelimiter = { fg = comment },
			MarkdownLinkTextDelimiter = { fg = comment },
			MarkdownListMarker = { fg = orange },
			MarkdownOrderedListMarker = { fg = orange },
			MarkdownRule = { fg = comment },

			--------------------------------------------------------------------------------
			-- Nvim Internal Highlights
			--------------------------------------------------------------------------------
			NvimInternalError = { fg = red, bg = red },
			NvimAssignment = { link = "Operator" },
			NvimPlainAssignment = { link = "NvimAssignment" },
			NvimAugmentedAssignment = { link = "NvimAssignment" },
			NvimAssignmentWithAddition = { link = "NvimAugmentedAssignment" },
			NvimAssignmentWithSubtraction = { link = "NvimAugmentedAssignment" },
			NvimAssignmentWithConcatenation = { link = "NvimAugmentedAssignment" },
			NvimOperator = { link = "Operator" },
			NvimUnaryOperator = { link = "NvimOperator" },
			NvimUnaryPlus = { link = "NvimUnaryOperator" },
			NvimUnaryMinus = { link = "NvimUnaryOperator" },
			NvimNot = { link = "NvimUnaryOperator" },
			NvimBinaryOperator = { link = "NvimOperator" },
			NvimComparison = { link = "NvimBinaryOperator" },
			NvimComparisonModifier = { link = "NvimComparison" },
			NvimBinaryPlus = { link = "NvimBinaryOperator" },
			NvimBinaryMinus = { link = "NvimBinaryOperator" },
			NvimConcat = { link = "NvimBinaryOperator" },
			NvimConcatOrSubscript = { link = "NvimConcat" },
			NvimOr = { link = "NvimBinaryOperator" },
			NvimAnd = { link = "NvimBinaryOperator" },
			NvimMultiplication = { link = "NvimBinaryOperator" },
			NvimDivision = { link = "NvimBinaryOperator" },
			NvimMod = { link = "NvimBinaryOperator" },
			NvimTernary = { link = "NvimOperator" },
			NvimTernaryColon = { link = "NvimTernary" },
			NvimParenthesis = { link = "Delimiter" },
			NvimLambda = { link = "NvimParenthesis" },
			NvimNestingParenthesis = { link = "NvimParenthesis" },
			NvimCallingParenthesis = { link = "NvimParenthesis" },
			NvimSubscript = { link = "NvimParenthesis" },
			-- NvimSubscriptBracket = { link = "NvimSubscript" },
			NvimSubscriptColon = { link = "NvimSubscript" },
			NvimCurly = { link = "NvimSubscript" },
			NvimContainer = { link = "NvimParenthesis" },
			NvimDict = { link = "NvimContainer" },
			NvimList = { link = "NvimContainer" },
			NvimIdentifier = { link = "Identifier" },
			NvimIdentifierScope = { link = "NvimIdentifier" },
			NvimIdentifierScopeDelimiter = { link = "NvimIdentifier" },
			NvimIdentifierName = { link = "NvimIdentifier" },
			NvimIdentifierKey = { link = "NvimIdentifier" },
			NvimColon = { link = "Delimiter" },
			NvimComma = { link = "Delimiter" },
			NvimArrow = { link = "Delimiter" },
			NvimRegister = { link = "SpecialChar" },
			NvimNumber = { link = "Number" },
			NvimFloat = { link = "NvimNumber" },
			NvimNumberPrefix = { link = "Type" },
			NvimOptionSigil = { link = "Type" },
			NvimOptionName = { link = "NvimIdentifier" },
			NvimOptionScope = { link = "NvimIdentifierScope" },
			NvimOptionScopeDelimiter = { link = "NvimIdentifierScopeDelimiter" },
			NvimEnvironmentSigil = { link = "NvimOptionSigil" },
			NvimEnvironmentName = { link = "NvimIdentifier" },
			NvimString = { link = "String" },
			NvimStringBody = { link = "NvimString" },
			NvimStringQuote = { link = "NvimString" },
			NvimStringSpecial = { link = "SpecialChar" },
			NvimSingleQuote = { link = "NvimStringQuote" },
			NvimSingleQuotedBody = { link = "NvimStringBody" },
			NvimSingleQuotedQuote = { link = "NvimStringSpecial" },
			NvimDoubleQuote = { link = "NvimStringQuote" },
			NvimDoubleQuotedBody = { link = "NvimStringBody" },
			NvimDoubleQuotedEscape = { link = "NvimStringSpecial" },
			NvimFigureBrace = { link = "NvimInternalError" },
			NvimSingleQuotedUnknownEscape = { link = "NvimInternalError" },
			NvimSpacing = { link = "Normal" },
			NvimDoubleQuotedUnknownEscape = { link = "NvimInvalidValue" },
			NvimInvalid = { link = "Error" },
			NvimInvalidAssignment = { link = "NvimInvalid" },
			NvimInvalidPlainAssignment = { link = "NvimInvalidAssignment" },
			NvimInvalidAugmentedAssignment = { link = "NvimInvalidAssignment" },
			NvimInvalidAssignmentWithAddition = { link = "NvimInvalidAugmentedAssignment" },
			NvimInvalidAssignmentWithSubtraction = { link = "NvimInvalidAugmentedAssignment" },
			NvimInvalidAssignmentWithConcatenation = { link = "NvimInvalidAugmentedAssignment" },
			NvimInvalidOperator = { link = "NvimInvalid" },
			NvimInvalidUnaryOperator = { link = "NvimInvalidOperator" },
			NvimInvalidUnaryPlus = { link = "NvimInvalidUnaryOperator" },
			NvimInvalidUnaryMinus = { link = "NvimInvalidUnaryOperator" },
			NvimInvalidNot = { link = "NvimInvalidUnaryOperator" },
			NvimInvalidBinaryOperator = { link = "NvimInvalidOperator" },
			NvimInvalidComparison = { link = "NvimInvalidBinaryOperator" },
			NvimInvalidComparisonModifier = { link = "NvimInvalidComparison" },
			NvimInvalidBinaryPlus = { link = "NvimInvalidBinaryOperator" },
			NvimInvalidBinaryMinus = { link = "NvimInvalidBinaryOperator" },
			NvimInvalidConcat = { link = "NvimInvalidBinaryOperator" },
			NvimInvalidConcatOrSubscript = { link = "NvimInvalidConcat" },
			NvimInvalidOr = { link = "NvimInvalidBinaryOperator" },
			NvimInvalidAnd = { link = "NvimInvalidBinaryOperator" },
			NvimInvalidMultiplication = { link = "NvimInvalidBinaryOperator" },
			NvimInvalidDivision = { link = "NvimInvalidBinaryOperator" },
			NvimInvalidMod = { link = "NvimInvalidBinaryOperator" },
			NvimInvalidTernary = { link = "NvimInvalidOperator" },
			NvimInvalidTernaryColon = { link = "NvimInvalidTernary" },
			NvimInvalidDelimiter = { link = "NvimInvalid" },
			NvimInvalidParenthesis = { link = "NvimInvalidDelimiter" },
			NvimInvalidLambda = { link = "NvimInvalidParenthesis" },
			NvimInvalidNestingParenthesis = { link = "NvimInvalidParenthesis" },
			NvimInvalidCallingParenthesis = { link = "NvimInvalidParenthesis" },
			NvimInvalidSubscript = { link = "NvimInvalidParenthesis" },
			-- NvimInvalidSubscriptBracket = { link = "NvimInvalidSubscript" },
			NvimInvalidSubscriptColon = { link = "NvimInvalidSubscript" },
			NvimInvalidCurly = { link = "NvimInvalidSubscript" },
			NvimInvalidContainer = { link = "NvimInvalidParenthesis" },
			NvimInvalidDict = { link = "NvimInvalidContainer" },
			NvimInvalidList = { link = "NvimInvalidContainer" },
			NvimInvalidValue = { link = "NvimInvalid" },
			NvimInvalidIdentifier = { link = "NvimInvalidValue" },
			NvimInvalidIdentifierScope = { link = "NvimInvalidIdentifier" },
			NvimInvalidIdentifierScopeDelimiter = { link = "NvimInvalidIdentifier" },
			NvimInvalidIdentifierName = { link = "NvimInvalidIdentifier" },
			NvimInvalidIdentifierKey = { link = "NvimInvalidIdentifier" },
			NvimInvalidColon = { link = "NvimInvalidDelimiter" },
			NvimInvalidComma = { link = "NvimInvalidDelimiter" },
			NvimInvalidArrow = { link = "NvimInvalidDelimiter" },
			NvimInvalidRegister = { link = "NvimInvalidValue" },
			NvimInvalidNumber = { link = "NvimInvalidValue" },
			NvimInvalidFloat = { link = "NvimInvalidNumber" },
			NvimInvalidNumberPrefix = { link = "NvimInvalidNumber" },
			NvimInvalidOptionSigil = { link = "NvimInvalidIdentifier" },
			NvimInvalidOptionName = { link = "NvimInvalidIdentifier" },
			NvimInvalidOptionScope = { link = "NvimInvalidIdentifierScope" },
			NvimInvalidOptionScopeDelimiter = { link = "NvimInvalidIdentifierScopeDelimiter" },
			NvimInvalidEnvironmentSigil = { link = "NvimInvalidOptionSigil" },
			NvimInvalidEnvironmentName = { link = "NvimInvalidIdentifier" },
			NvimInvalidString = { link = "NvimInvalidValue" },
			NvimInvalidStringBody = { link = "NvimStringBody" },
			NvimInvalidStringQuote = { link = "NvimInvalidString" },
			NvimInvalidStringSpecial = { link = "NvimStringSpecial" },
			NvimInvalidSingleQuote = { link = "NvimInvalidStringQuote" },
			NvimInvalidSingleQuotedBody = { link = "NvimInvalidStringBody" },
			NvimInvalidSingleQuotedQuote = { link = "NvimInvalidStringSpecial" },
			NvimInvalidDoubleQuote = { link = "NvimInvalidStringQuote" },
			NvimInvalidDoubleQuotedBody = { link = "NvimInvalidStringBody" },
			NvimInvalidDoubleQuotedEscape = { link = "NvimInvalidStringSpecial" },
			NvimInvalidDoubleQuotedUnknownEscape = { link = "NvimInvalidValue" },
			NvimInvalidFigureBrace = { link = "NvimInvalidDelimiter" },
			NvimInvalidSingleQuotedUnknownEscape = { link = "NvimInternalError" },
			NvimInvalidSpacing = { link = "ErrorMsg" },

			--------------------------------------------------------------------------------
			-- Color Groups (for linking)
			--------------------------------------------------------------------------------
			Grey = { fg = comment },
			Fg = { fg = fg },
			Red = { fg = red },
			Orange = { fg = orange },
			Yellow = { fg = yellow },
			Green = { fg = green },
			Aqua = { fg = aqua },
			Blue = { fg = blue },
			Purple = { fg = purple },

			RedItalic = { fg = red, italic = true },
			OrangeItalic = { fg = orange, italic = true },
			YellowItalic = { fg = yellow, italic = true },
			GreenItalic = { fg = green, italic = true },
			AquaItalic = { fg = aqua, italic = true },
			BlueItalic = { fg = blue, italic = true },
			PurpleItalic = { fg = purple, italic = true },

			RedBold = { fg = red, bold = true },
			OrangeBold = { fg = orange, bold = true },
			YellowBold = { fg = yellow, bold = true },
			GreenBold = { fg = green, bold = true },
			AquaBold = { fg = aqua, bold = true },
			BlueBold = { fg = blue, bold = true },
			PurpleBold = { fg = purple, bold = true },

			RedSign = { fg = red },
			OrangeSign = { fg = orange },
			YellowSign = { fg = yellow },
			GreenSign = { fg = green },
			AquaSign = { fg = aqua },
			BlueSign = { fg = blue },
			PurpleSign = { fg = purple },

			ErrorLine = {},
			WarningLine = {},
			InfoLine = {},
			HintLine = {},

			--------------------------------------------------------------------------------
			-- Vim Groups (legacy)
			--------------------------------------------------------------------------------
			VimOption = {},
			VimGroup = {},
			Delimeter = {},
		}

		-- Apply all highlights
		for k, v in pairs(theme) do
			vim.api.nvim_set_hl(0, k, v)
		end
	end,
}
