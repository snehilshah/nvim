return {
    "rachartier/tiny-inline-diagnostic.nvim",
    enabled = true,
    opts = {
        preset = "modern",
        options = {
            show_source = {
                enabled = true,
                if_many = true,
            },
            throttle = 0,
            use_icons_from_diagnostic = true,
            set_arrow_to_diag_color = true,
            -- NOTE: When using display_count = true, you need to enable multiline diagnostics with multilines.enabled = true
            --       If you want them to always be displayed, you can also set multilines.always_show = true.
            add_messages = {
                messages = true,
                display_count = true,
                use_max_severity = false, -- When counting, only show the most severe diagnostic
                show_multiple_glyphs = true, -- Show multiple icons for multiple diagnostics of same severity
            },
            multilines = {
                enabled = true,
                always_show = true, -- Always show messages on all lines of multiline diagnostics
                trim_whitespaces = true, -- Remove leading/trailing whitespace from each line
                tabstop = 4, -- Number of spaces per tab when expanding tabs
                severity = nil, -- Filter multiline diagnostics by severity (e.g., { vim.diagnostic.severity.ERROR })
            },
            show_all_diags_on_cursorline = true,
            show_related = {
                enabled = true,
                max_count = 3,
            },
            enable_on_insert = true,
            enable_on_select = true,
            overflow = {
                mode = "wrap",
                padding = 0,
            },
            virt_texts = {
                priority = 2048,
            },
            override_open_float = false,
        },
    },
}
