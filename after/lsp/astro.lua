-- Astro Language Server Configuration
-- Ensure `@astrojs/language-server` and `typescript` are installed globally.

local function get_typescript_tsdk()
    local home = os.getenv("HOME")
    local search_paths = {
        -- Bun global
        home .. "/.bun/install/global/node_modules/typescript/lib",
        -- Npm global
        "/usr/local/lib/node_modules/typescript/lib",
        "/usr/lib/node_modules/typescript/lib",
        -- Brew macOS
        "/opt/homebrew/opt/typescript/libexec/lib/node_modules/typescript/lib",
        -- Brew Linux
        "/home/linuxbrew/.linuxbrew/opt/typescript/libexec/lib/node_modules/typescript/lib",
    }
    for _, path in ipairs(search_paths) do
        if vim.fn.isdirectory(path) == 1 then
            return path
        end
    end
    return ""
end

return {
    root_markers = {
        "astro.config.mjs",
        "astro.config.js",
        "astro.config.cjs",
        "astro.config.ts",
    },
    init_options = {
        typescript = {
            tsdk = get_typescript_tsdk(),
        },
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
            -- Enable TypeScript features within Astro files
            tsdk = "node_modules/typescript/lib", -- Use workspace tsdk if available

            -- Import Preferences
            preferences = {
                importModuleSpecifierPreference = "shortest",
                importModuleSpecifierEnding = "auto",
                quoteStyle = "auto",
            },

            -- Inlay Hints (same configuration as tsgo)
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
