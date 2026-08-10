return {
    "nvim-mini/mini.ai",
    opts = function()
        return {
            n_lines = 300,
            custom_textobjects = {
                g = function()
                    local from = { line = 1, col = 1 }
                    local to = {
                        line = vim.fn.line("$"),
                        col = math.max(vim.fn.getline("$"):len(), 1),
                    }
                    return { from = from, to = to }
                end,
            },
            -- errors loud and clear
            silent = false,
            -- Don't use the previous or next text object.
            search_method = "cover",
            mappings = {
                -- Disable next/last variants.
                around_next = "",
                inside_next = "",
                around_last = "",
                inside_last = "",
            },
        }
    end,
}
