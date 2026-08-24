-- TypeScript 7 native LSP preferences. nvim-lspconfig owns the command,
-- version check, project-local/global binary selection, and root detection.
local lang_settings = {
    suggest = {
        autoImports = true,
        includeAutomaticOptionalChainCompletions = true,
        includeCompletionsForImportStatements = true,
        classMemberSnippets = { enabled = true },
        objectLiteralMethodSnippets = { enabled = true },
    },
    preferences = {
        importModuleSpecifier = "shortest", -- "shortest" | "project-relative" | "relative" | "non-relative"
        importModuleSpecifierEnding = "auto", -- "auto" | "minimal" | "index" | "js"
        preferTypeOnlyAutoImports = false,
        quoteStyle = "auto", -- "auto" | "double" | "single"
        organizeImports = {
            typeOrder = "last", -- "auto" | "last" | "first" | "inline"
            caseSensitivity = "auto", -- "auto" | "caseInsensitive" | "caseSensitive"
        },
    },
    inlayHints = {
        variableTypes = {
            suppressWhenTypeMatchesName = true,
        },
    },
}

return {
    settings = {
        ["js/ts"] = lang_settings,
    },
}
