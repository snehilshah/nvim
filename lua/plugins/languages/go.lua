return {
    "snehilshah/no-go.nvim",
    branch = "no-no-go",
    dependencies = { "nvim-treesitter/nvim-treesitter" },
    ft = "go",
    opts = {
        enabled = true,
        identifiers = { "err", "error" },
        virtual_text = {
            prefix = "󱞿  ",
            suffix = "",
            empty_text = "return",
        },
        import_virtual_text = {
            prefix = "󰏗  ",
            suffix = " ",
        },
        highlight_group = "NoGoZone",
        highlight = {
            bg = "#2A2A37",
        },
        update_events = {
            "BufEnter",
            "BufWritePost",
            "TextChanged",
            "InsertLeave",
        },
        debounce_ms = 60,
        reveal_on_cursor = false,
        keys = {
            down = "j",
            up = "k",
            toggle = "<M-o>",
        },
        collapse_imports = true,
        fold_imports = true,
    },
}
