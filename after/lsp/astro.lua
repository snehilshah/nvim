-- Astro Language Server Configuration
-- nvim-lspconfig resolves Astro's project-local TypeScript SDK. Do not point
-- this server at global TypeScript 7, which has no tsserverlibrary.js.

return {
    root_markers = {
        "astro.config.mjs",
        "astro.config.js",
        "astro.config.cjs",
        "astro.config.ts",
    },
    settings = {
        astro = {
            -- Format settings (usually deferred to prettier/biome via conform, but good for fallbacks)
            format = {
                html = {
                    -- Prettier handles html natively, but this ensures fallback rules are aligned
                    wrapLineLength = 120,
                },
            },
        },
        typescript = {
            preferences = {
                importModuleSpecifier = "shortest",
                importModuleSpecifierEnding = "auto",
                quoteStyle = "auto",
            },

            -- Astro deliberately uses more verbose hints than regular TS files.
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
        javascript = {
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
