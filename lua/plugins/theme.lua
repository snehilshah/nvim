return {
    {

        "Aejkatappaja/cendre",
        lazy = false,
        enabled = false,
        priority = 1000,
        config = function()
            require("cendre").setup({
                background = "hard", -- "hard" | "medium" | "soft"
                italic_virtual_text = false,
            })
        end,
    },
    {
        "harunnoir/limei.nvim",
        lazy = false,
        enabled = false,
        priority = 1000,
        config = function()
            require("limei").setup()
            -- vim.cmd.colorscheme("limei")
        end,
    },
}
