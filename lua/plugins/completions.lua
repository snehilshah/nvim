return {
    "saghen/blink.cmp",
    -- build = "cargo +nightly build --release",
    branch = "v1",
    dependencies = {
        "folke/lazydev.nvim",
        "nvim-mini/mini.icons",
    },
    opts = {
        keymap = {
            preset = "super-tab",
            -- <C-j>/<C-k> are deliberately NOT overridden. The super-tab preset
            -- already binds <C-p>/<C-n> and <Up>/<Down> for prev/next, and it maps
            -- <C-k> to show_signature/hide_signature -- blink owns signature help.
            -- (An override here would silently replace the LSP buffer-local
            -- signature map, since buffer-local maps overwrite rather than stack.)
            -- <C-\> intentionally NOT bound here: toggleterm owns it in every mode
            -- (insert_mappings = true). Dismiss the menu with <C-e> (stays in insert)
            -- or <Esc> (leaves insert, menu closes with it).
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
            -- Copilot owns inline ghost text (see lua/plugins/ai/sidekick.lua).
            -- Two extmark renderers at the cursor stack on top of each other rather
            -- than dedupe, so only one may be active. blink loses nothing here:
            -- `menu.auto_show` plus `list.selection.auto_insert` already preview the
            -- selected item, and with auto_show on, the menu-closed state this used
            -- to draw in barely occurred.
            ghost_text = { enabled = false },
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
                    preselect = true, -- Automatically select the first item
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
