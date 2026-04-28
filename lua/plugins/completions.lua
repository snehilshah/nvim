return {
    "saghen/blink.cmp",
    -- build = "cargo +nightly build --release",
    branch = "v1",
    dependencies = {
        "folke/lazydev.nvim",
        "nvim-mini/mini.nvim",
    },
    opts = {
        keymap = {
            preset = "super-tab",
            ["<C-j>"] = { "select_next" },
            ["<C-k>"] = { "select_prev" },
            ["<C-\\>"] = { "hide", "fallback" },
            ["<C-b>"] = { "scroll_documentation_up", "fallback" },
            ["<C-f>"] = { "scroll_documentation_down", "fallback" },
        },
        completion = {
            accept = {
                auto_brackets = {
                    enabled = true, -- Auto-insert brackets for functions/methods
                },
            },
            menu = {
                auto_show = true,
                border = "rounded",
                scrollbar = false,
                scrolloff = 1,
                draw = {
                    padding = 1,
                    gap = 1,
                    columns = {
                        { "kind_icon" },
                        { "label", "label_description", gap = 1 },
                        { "kind" },
                        { "source_name" },
                    },
                },
            },
            ghost_text = {
                enabled = true,
                show_with_menu = false, -- show ghost text even with menu open
                show_without_selection = true, -- only show when item is selected
            },
            documentation = {
                auto_show = true,
                treesitter_highlighting = true,
                window = {
                    border = "rounded",
                    scrollbar = true,
                },
            },
            trigger = {
                prefetch_on_insert = false,
                show_in_snippet = true, -- keep true to show completion in snippets
                show_on_backspace_in_keyword = false,
            },
            list = {
                selection = {
                    preselect = false, -- dont select the first item by default, but tab completes it still
                    auto_insert = true, --insert preview into editor only when selecting
                },
            },
        },

        -- mini.cmdline has better options with previews
        cmdline = { enabled = false },

        sources = {
            default = { "lazydev", "lsp", "path", "snippets", "buffer" },
            per_filetype = {
                go = { "lsp", "path", "buffer" }, -- disable snippets for go to avoid gopls malformed snippet ranges
                sql = { "dadbod", "snippets", "buffer" },
                mysql = { "dadbod", "snippets", "buffer" },
                plpgsql = { "dadbod", "snippets", "buffer" },
            },
            providers = {
                lazydev = {
                    name = "LazyDev",
                    module = "lazydev.integrations.blink",
                    score_offset = 100,
                },
                dadbod = { name = "Dadbod", module = "vim_dadbod_completion.blink" },
                snippets = {
                    opts = {
                        search_paths = { vim.fn.stdpath("config") .. "/after/snippets" },
                    },
                },
                lsp = {
                    name = "LSP",
                    module = "blink.cmp.sources.lsp",
                },
            },
        },

        fuzzy = { implementation = "prefer_rust_with_warning" },

        signature = {
            enabled = true,
            window = {
                show_documentation = true,
                border = "rounded",
            },
        },
    },
    opts_extend = { "sources.default" },
}
