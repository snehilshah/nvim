-- ============================================================================
-- Editing Helpers
-- ============================================================================
-- Autopairs, auto-tags, comments, indentation detection, and motions

return {
    -- Autopairs with full language support (Go/Rust/C/JS/TS/React)
    {
        "windwp/nvim-autopairs",
        event = "InsertEnter",
        config = function()
            local npairs = require("nvim-autopairs")
            local Rule = require("nvim-autopairs.rule")
            local conds = require("nvim-autopairs.conds")

            npairs.setup()

            -- Autoclosing angle-brackets.
            npairs.add_rule(Rule("<", ">", {
                -- Avoid conflicts with nvim-ts-autotag.
                "-html",
                "-javascriptreact",
                "-typescriptreact",
            }):with_pair(conds.before_regex("%a+:?:?$", 3)):with_move(function(opts)
                return opts.char == ">"
            end))
        end,
    },
    -- Autotags for HTML/JSX
    {
        "windwp/nvim-ts-autotag",
        event = { "BufReadPost", "BufNewFile" },
        opts = {
            opts = {
                enable_close = true, -- Auto close tags
                enable_rename = true, -- Auto rename pairs
                enable_close_on_slash = true, -- Auto close on trailing </
            },
        },
    },
    -- Automatically detects and sets the appropriate 'shiftwidth' and 'expandtab' options
    { "tpope/vim-sleuth" },
    -- Provides motions for navigating and operating on CamelCase and snake_case words
    {
        "bkad/CamelCaseMotion",
        init = function()
            vim.g.camelcasemotion_key = "<leader>"
        end,
    },
    { "b0o/SchemaStore.nvim", lazy = true, version = false, module = "schemastore" },
}
