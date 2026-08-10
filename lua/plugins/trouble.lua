return {
    "folke/trouble.nvim",
    cmd = "Trouble",
    -- v3 defaults already give a bottom split with q/<esc>/r/<cr>/o/p/P/fold keys,
    -- so only the two deltas from the old v2 config are restored here.
    opts = {
        win = { size = 15 }, -- v3 default is 10
        keys = { ["<c-x>"] = "jump_split" }, -- v3 uses <c-s>; keep both
    },
    lazy = true,
    keys = {
        {
            "<leader>xx",
            "<cmd>Trouble diagnostics toggle<cr>",
            desc = "Diagnostics (Trouble)",
        },
        {
            "<leader>xX",
            "<cmd>Trouble diagnostics toggle filter.buf=0<cr>",
            desc = "Buffer Diagnostics (Trouble)",
        },
        {
            "<leader>cs",
            "<cmd>Trouble symbols toggle focus=false<cr>",
            desc = "Symbols (Trouble)",
        },
        {
            "<leader>cL",
            "<cmd>Trouble lsp toggle focus=false win.position=right<cr>",
            desc = "LSP Definitions / references / ... (Trouble)",
        },
        {
            "<leader>xL",
            "<cmd>Trouble loclist toggle<cr>",
            desc = "Location List (Trouble)",
        },
        {
            "<leader>xQ",
            "<cmd>Trouble qflist toggle<cr>",
            desc = "Quickfix List (Trouble)",
        },
    },
    -- The old v2-only fields were ignored; the supported behavior now lives in opts.
}
