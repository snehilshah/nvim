-- Formatter Configuration (conform.nvim)
-- All formatters should be installed globally.
-- See docs/install.md for installation instructions.
return {
    "stevearc/conform.nvim",
    event = "BufWritePre",
    opts = {
        -- Leave me alone.
        notify_no_formatters = false,
        notify_on_error = false,
        formatters_by_ft = {
            c = { name = "clangd", timeout_ms = 500, lsp_format = "prefer" },
            cpp = { name = "clangd", timeout_ms = 500, lsp_format = "prefer" },

            -- Prettier wins when a config exists (require_cwd), otherwise Biome.
            -- LSP formatting is the last fallback when neither is available.
            javascript = {
                "prettier",
                "biome",
                stop_after_first = true,
                timeout_ms = 500,
                lsp_format = "fallback",
            },
            javascriptreact = {
                "prettier",
                "biome",
                stop_after_first = true,
                timeout_ms = 500,
                lsp_format = "fallback",
            },
            typescript = {
                "prettier",
                "biome",
                stop_after_first = true,
                timeout_ms = 500,
                lsp_format = "fallback",
            },
            typescriptreact = {
                "prettier",
                "biome",
                stop_after_first = true,
                timeout_ms = 500,
                lsp_format = "fallback",
            },
            astro = {
                "prettier",
                "biome",
                stop_after_first = true,
                timeout_ms = 500,
                lsp_format = "fallback",
            },

            json = {
                "prettier",
                "biome",
                stop_after_first = true,
                timeout_ms = 500,
                lsp_format = "fallback",
            },
            jsonc = {
                "prettier",
                "biome",
                stop_after_first = true,
                timeout_ms = 500,
                lsp_format = "fallback",
            },

            -- Biome formats CSS, but not HTML or SCSS.
            html = {
                "prettier",
                stop_after_first = true,
                timeout_ms = 500,
                lsp_format = "fallback",
            },
            css = {
                "prettier",
                "biome",
                stop_after_first = true,
                timeout_ms = 500,
                lsp_format = "fallback",
            },
            scss = {
                "prettier",
                stop_after_first = true,
                timeout_ms = 500,
                lsp_format = "fallback",
            },

            yaml = { "yamlfmt", stop_after_first = true },
            yml = { "yamlfmt", stop_after_first = true },
            toml = { "tombi", stop_after_first = true },

            go = { "goimports", "gofumpt" },
            proto = { "buf" },
            python = { "ruff_organize_imports", "ruff_format" },

            sh = { "shfmt" },
            bash = { "shfmt" },
            zsh = { "shfmt" },

            lua = { "stylua" },
            dockerfile = { "dockerfmt" },
            markdown = { "markdownlint-cli2", stop_after_first = true },
        },
        format_on_save = function()
            -- Skip formatting if triggered from my special save command.
            if vim.g.skip_formatting then
                vim.g.skip_formatting = false
                return nil
            end

            if not vim.g.autoformat then
                return nil
            end
            return {}
        end,
        formatters = {
            -- Require a Prettier configuration file to format.
            prettier = { require_cwd = true },
        },
    },
    init = function()
        vim.g.autoformat = true
        vim.o.formatexpr = "v:lua.require'conform'.formatexpr()"
    end,
}
