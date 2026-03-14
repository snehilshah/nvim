-- vtsls configuration (using native VS Code-style typescript settings)
return {
  settings = {
    vtsls = {
      enableMoveToFileCodeAction = true,
      autoUseWorkspaceTsdk = true,
      experimental = {
        completion = {
          enableServerSideFuzzyMatch = true,
        },
      },
    },
    typescript = {
      -- Completions / Auto-imports
      suggest = {
        autoImports = true,
        includeAutomaticOptionalChainCompletions = true,
        includeCompletionsForImportStatements = true,
        classMemberSnippets = { enabled = true },
        objectLiteralMethodSnippets = { enabled = true },
      },
      updateImportsOnFileMove = { enabled = "always" },
      -- Preferences
      preferences = {
        importModuleSpecifierPreference = "shortest",
        importModuleSpecifierEnding = "auto",
        includePackageJsonAutoImports = "auto",
        preferTypeOnlyAutoImports = false,
        quoteStyle = "auto",
      },
      -- Format
      format = {
        trimTrailingWhitespace = true,
      },
      -- Code Lens
      implementationsCodeLens = {
        enabled = true,
        showOnInterfaceMethods = true,
        showOnAllClassMethods = true,
      },
      referencesCodeLens = {
        enabled = true,
        showOnAllFunctions = true,
      },
      -- Inlay Hints (vtsls uses VS Code-style nested format)
      inlayHints = {
        parameterNames = {
          enabled = "all", -- "none" | "literals" | "all"
          suppressWhenArgumentMatchesName = false,
        },
        parameterTypes = {
          enabled = true,
        },
        variableTypes = {
          enabled = true,
          suppressWhenTypeMatchesName = false,
        },
        propertyDeclarationTypes = {
          enabled = true,
        },
        functionLikeReturnTypes = {
          enabled = true,
        },
        enumMemberValues = {
          enabled = true,
        },
      },
    },
    javascript = {
      suggest = {
        autoImports = true,
        includeAutomaticOptionalChainCompletions = true,
        includeCompletionsForImportStatements = true,
        classMemberSnippets = { enabled = true },
        objectLiteralMethodSnippets = { enabled = true },
      },
      updateImportsOnFileMove = { enabled = "prompt" },
      preferences = {
        importModuleSpecifierPreference = "shortest",
        importModuleSpecifierEnding = "auto",
        includePackageJsonAutoImports = "auto",
        quoteStyle = "auto",
      },
      format = {
        trimTrailingWhitespace = true,
      },
      implementationsCodeLens = {
        enabled = true,
        showOnInterfaceMethods = true,
        showOnAllClassMethods = true,
      },
      referencesCodeLens = {
        enabled = true,
        showOnAllFunctions = true,
      },
      inlayHints = {
        parameterNames = {
          enabled = "all",
          suppressWhenArgumentMatchesName = false,
        },
        parameterTypes = {
          enabled = true,
        },
        variableTypes = {
          enabled = true,
          suppressWhenTypeMatchesName = false,
        },
        propertyDeclarationTypes = {
          enabled = true,
        },
        functionLikeReturnTypes = {
          enabled = true,
        },
        enumMemberValues = {
          enabled = true,
        },
      },
    },
  },
}
