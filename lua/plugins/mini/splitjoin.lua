-- Split/join arguments, tables, arrays, etc.
-- - gS         - Toggle between split and join
-- - <leader>cj - Toggle between split and join
return {
    "nvim-mini/mini.splitjoin",
    keys = {
        {
            "<leader>cj",
            function()
                require("mini.splitjoin").toggle()
            end,
            desc = "Join/split code block",
        },
    },
    opts = {
        mappings = {
            toggle = "<leader>cj",
        },
    },
}
