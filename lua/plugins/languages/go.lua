return {
    {
        "snehilshah/no-go.nvim",
        branch = "no-no-go",
        dependencies = { "nvim-treesitter/nvim-treesitter" },
        ft = "go",
        opts = {
            identifiers = { "err", "error" },
            fold_imports = true,
            reveal_on_cursor = true,
        },
    },
}
