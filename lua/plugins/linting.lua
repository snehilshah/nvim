-- Linter Configuration (nvim-lint)
-- All linters should be installed globally.
-- See docs/install.md for installation instructions.
-- Note: Trigger linting manually with <leader>ll
-- Note: biome is handled via LSP (see after/lsp/biome.lua)
return {
    "mfussenegger/nvim-lint",
    keys = {
        {
            "<leader>ll",
            function()
                local lint = require("lint")
                lint.try_lint()
                local ft = vim.bo.filetype
                local linters = lint.linters_by_ft[ft] or {}
                if #linters > 0 then
                    vim.notify(
                        "Linting triggered: " .. table.concat(linters, ", "),
                        vim.log.levels.INFO
                    )
                else
                    vim.notify("No linters configured for filetype: " .. ft, vim.log.levels.WARN)
                end
            end,
            desc = "Trigger linting for current file",
        },
    },
    config = function()
        local lint = require("lint")

        local golangcilint = lint.linters.golangcilint
        golangcilint.ignore_exitcode = true
        -- golangci-lint v2 uses new output format flags
        golangcilint.args = {
            "run",
            "--output.json.path=stdout",
            "--output.text.path=",
            "--show-stats=false",
            function()
                -- Find the nearest golangci-lint config for the current file while walking upward
                -- Supports: .golangci.yaml, .golangci.yml, .golangci.toml, .golangci.json
                local config_patterns =
                    { ".golangci.yaml", ".golangci.yml", ".golangci.toml", ".golangci.json" }
                -- Bolt optimization: pass patterns table directly to vim.fs.find to avoid repeated upward traversals.
                local config_file = vim.fs.find(config_patterns, {
                    upward = true,
                    path = vim.fn.expand("%:p:h"),
                    stop = vim.env.HOME,
                })[1]

                if config_file then
                    return "-c=" .. config_file
                end
                return nil
            end,
            function()
                return vim.fn.fnamemodify(vim.api.nvim_buf_get_name(0), ":h")
            end,
        }

        lint.linters_by_ft = {
            json = { "jsonlint" },
            jsonc = { "jsonlint" },
            go = { "golangcilint" },
            sh = { "shellcheck" },
            bash = { "shellcheck" },
            zsh = { "shellcheck" },
            dockerfile = { "hadolint" },
            yaml = { "yamllint" },
            yml = { "yamllint" },
            c = { "cppcheck" },
            cpp = { "cppcheck" },
            markdown = { "markdownlint-cli2" },
            toml = { "tombi" },
            proto = { "buf_lint" },
            -- JS/TS: eslint_d will use its own root marker detection
            -- biome linting is handled via LSP (only activates with biome.json)
            javascript = { "eslint_d" },
            javascriptreact = { "eslint_d" },
            typescript = { "eslint_d" },
            typescriptreact = { "eslint_d" },
            astro = { "eslint_d" },
        }
    end,
}
