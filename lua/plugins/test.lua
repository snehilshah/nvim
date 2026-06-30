return {
    {
        "error311/wayfinder.nvim",
        config = function()
            require("wayfinder").setup({})
            vim.keymap.set("n", "<leader>wf", "<Plug>(WayfinderOpen)", {
                desc = "Wayfinder",
            })
        end,
    },
}
