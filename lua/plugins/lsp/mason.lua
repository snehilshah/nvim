return {
    {
        "williamboman/mason-lspconfig.nvim",
        opts = {
            -- list of servers for mason to install
            ensure_installed = {
                "html",
                "cssls",
                "tailwindcss",
                "biome",
                "clangd",
                "lua_ls",
                "eslint",
                -- "ts_ls", managed by typescript-tools.nvim plugin in lua/plugins/typescript.lua_set
                -- "gopls",  managed by go.nvim plugin in lua/plugins/golang.lua
                -- "graphql",
                -- "emmet_ls",
                -- "prismals",
                -- "pyright",
            },
        },
        dependencies = {
            {
                "williamboman/mason.nvim",
                opts = {
                    ui = {
                        icons = {
                            package_installed = "✓",
                            package_pending = "➜",
                            package_uninstalled = "✗",
                        },
                    },
                },
            },
            "neovim/nvim-lspconfig",
            "saghen/blink.cmp", -- Ensure blink.cmp is loaded before mason-lspconfig
        },
    },
    {
        "WhoIsSethDaniel/mason-tool-installer.nvim",
        opts = {
            ensure_installed = {
                "prettier", -- prettier formatter
                "stylua",   -- lua formatter
                "isort",    -- python formatter
                "black",    -- python formatter
                "pylint",
                "eslint_d",
                "golangci-lint"
            },
        },
        dependencies = {
            "williamboman/mason.nvim",
        },
    },
}
