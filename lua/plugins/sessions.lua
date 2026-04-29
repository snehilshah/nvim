return {
    "folke/persistence.nvim",
    event = "BufReadPre",
    keys = {
        {
            "<leader>qs",
            function()
                require("persistence").load()
            end,
            desc = "Restore session (cwd)",
        },
        {
            "<leader>qS",
            function()
                require("persistence").select()
            end,
            desc = "Select a session",
        },
    },
    opts = {},
}
