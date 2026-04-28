return {
    "nvim-mini/mini.operators",
    opts = {
        -- All operators under <leader>o ("operator") to keep g* free for LSP replace = { prefix = "<leader>or" },
        exchange = { prefix = "<leader>ox" },
        sort = { prefix = "<leader>os" },
        multiply = { prefix = "<leader>om" },
        evaluate = { prefix = "<leader>oe" },
    }
}
