return {
    "rachartier/tiny-code-action.nvim",
    dependencies = {
        { "ibhagwan/fzf-lua" },
    },
    event = "LspAttach",
    opts = {
        backend = "delta",
        picker = "fzf-lua",
        backend_opts = {
            delta = {
                header_lines_to_remove = 4,
                args = {
                    "--line-numbers",
                },
            },
        },
    },
}
