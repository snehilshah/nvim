return {
    {
        "snehilshah/no-go.nvim",
        -- dev = true: load from ~/myCodes/no-go.nvim (lazy `dev.path` in lazyplug.lua).
        -- Keep this true while iterating locally; flip to false to use the GitHub copy.
        dev = true,
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
