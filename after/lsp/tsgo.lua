-- tsgo configuration (native TypeScript server from Microsoft)
local lang_settings = {
    suggest = {
        autoImports = true,
        includeAutomaticOptionalChainCompletions = true,
        includeCompletionsForImportStatements = true,
        classMemberSnippets = { enabled = true },
        objectLiteralMethodSnippets = { enabled = true },
    },
    preferences = {
        importModuleSpecifierPreference = "shortest", -- "shortest" | "project-relative" | "relative" | "non-relative"
        importModuleSpecifierEnding = "auto", -- "auto" | "minimal" | "index" | "js"
        includePackageJsonAutoImports = "auto", -- "auto" | "on" | "off"
        preferTypeOnlyAutoImports = false,
        quoteStyle = "auto", -- "auto" | "double" | "single"
        organizeImports = {
            typeOrder = "last", -- "auto" | "last" | "first" | "inline"
            caseSensitivity = "auto", -- "auto" | "caseInsensitive" | "caseSensitive"
        },
    },
    inlayHints = {
        parameterNames = {
            enabled = "literals", -- "none" | "literals" | "all"
            suppressWhenArgumentMatchesName = true,
        },
        parameterTypes = { enabled = true },
        variableTypes = {
            enabled = true,
            suppressWhenTypeMatchesName = true,
        },
        propertyDeclarationTypes = { enabled = true },
        functionLikeReturnTypes = { enabled = true },
        enumMemberValues = { enabled = true },
    },
}

return {
    capabilities = {
        workspace = {
            didChangeWatchedFiles = {
                dynamicRegistration = true,
            },
        },
    },
    init_options = {
        maxTsServerMemory = 4096,
    },
    settings = {
        typescript = lang_settings,
        javascript = lang_settings,
    },
}
