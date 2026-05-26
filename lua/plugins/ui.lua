-- ============================================================================
-- UI Enhancements
-- ============================================================================
-- Visual helpers: keymaps popup, color highlighting, line numbers, etc.

return {
    {
        "folke/which-key.nvim",
        event = "VeryLazy",
        opts = {
            delay = 1000, -- ms before popup shows (default: 200)
        },
        keys = {
            {
                "<leader>?",
                function()
                    require("which-key").show({ global = false })
                end,
                desc = "Buffer Local Keymaps (which-key)",
            },
        },
    },
    {
        "snehilshah/comfy-line-numbers.nvim",
        -- dev = true: load from ~/myCodes/comfy-line-numbers.nvim (lazy `dev.path`).
        -- Keep this true while iterating locally; flip to false to use the GitHub copy.
        dev = true,
        branch = "imp/comfy-comfy",
        lazy = false,
        priority = 900,
        opts = {
            up_key = "k",
            down_key = "j",
            hidden_file_types = { "undotree" },
            hidden_buffer_types = { "terminal", "nofile" },
            hide_in_insert_mode = true,
            right_padding = 1,
        },
        -- Fold column (%C) is baked into comfy's statuscolumn template directly,
        -- so no external prepend autocmd is needed. Avoids per-event stacking races.
    },
    {
        "mcauley-penney/visual-whitespace.nvim",
        init = function()
            vim.keymap.set({ "n", "v" }, "<leader>tw", require("visual-whitespace").toggle, {})
            vim.api.nvim_set_hl(0, "VisualNonText", { fg = "#5D5F71", bg = "#24282d" })
        end,
        event = "ModeChanged *:[vV\22]", -- optionally, lazy load on entering visual mode
        opts = {
            list_chars = {
                space = "·",
                tab = " ",
                nbsp = "󱁐 ",
                lead = "‹",
                trail = "›",
            },
            fileformat_chars = {
                unix = " 󰌑 ",
                mac = " 󰌑 ",
                dos = " 󰌑 ",
            },
        },
    },
    {
        "brenoprata10/nvim-highlight-colors",
        event = "BufReadPre",
        enabled = true,
        opts = {
            render = "background",
            enable_hex = true,
            enable_short_hex = true,
            enable_rgb = true,
            enable_hsl = true,
            enable_hsl_without_function = true,
            enable_ansi = true,
            enable_var_usage = true,
            enable_tailwind = true,
        },
    },
    {
        "itchyny/vim-highlighturl",
        event = "VeryLazy",
        config = function()
            -- Disable the plugin in some places where the default highlighting
            -- is preferred.
            vim.api.nvim_create_autocmd("FileType", {
                desc = "Disable URL highlights",
                pattern = {
                    "fzf",
                    "lazyterm",
                },
                command = "call highlighturl#disable_local()",
            })
        end,
    },
    {
        "lukas-reineke/indent-blankline.nvim",
        main = "ibl",
        event = "VeryLazy",
        opts = {
            indent = {
                char = require("icons").misc.vertical_bar,
            },
            scope = {
                show_start = false,
                show_end = false,
            },
        },
    },
}
