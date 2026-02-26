-- tsgo configuration (native TypeScript server from Microsoft)
-- To switch to ts_ls: rename this file to tsgo.lua.bak and rename ts_ls.lua.bak to ts_ls.lua
return {
  capabilities = {
    workspace = {
      didChangeWatchedFiles = {
        dynamicRegistration = true,
      },
    },
  },
  init_options = {
    maxTsServerMemory = 8192,
  },
  settings = {
    typescript = {
      -- Completions / Auto-imports
      suggest = {
        autoImports = true,
        includeAutomaticOptionalChainCompletions = true,
        includeCompletionsForImportStatements = true,
        classMemberSnippets = { enabled = true },
        objectLiteralMethodSnippets = { enabled = true },
      },
      -- Preferences
      preferences = {
        importModuleSpecifierPreference = "shortest", -- "shortest" | "project-relative" | "relative" | "non-relative"
        importModuleSpecifierEnding = "auto", -- "auto" | "minimal" | "index" | "js"
        includePackageJsonAutoImports = "auto", -- "auto" | "on" | "off"
        preferTypeOnlyAutoImports = false,
        quoteStyle = "auto", -- "auto" | "double" | "single"
        -- Organize imports
        organizeImports = {
          typeOrder = "last", -- "auto" | "last" | "first" | "inline"
          caseSensitivity = "auto", -- "auto" | "caseInsensitive" | "caseSensitive"
        },
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
      -- Inlay Hints (tsgo uses VS Code-style nested format)
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
      preferences = {
        importModuleSpecifierPreference = "shortest",
        importModuleSpecifierEnding = "auto",
        includePackageJsonAutoImports = "auto",
        quoteStyle = "auto",
        organizeImports = {
          typeOrder = "last",
          caseSensitivity = "auto",
        },
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
