return {
    "nvim-mini/mini.move",
    event = "VeryLazy",
    opts = {
        mappings = {
            -- sidekick owns normal-mode <M-l>: apply the Next Edit Suggestion if
            -- there is one, otherwise call move_line("right") itself. Leaving this
            -- mapping in place breaks that -- setup() runs at VeryLazy, after
            -- sidekick has loaded, and overwrites the map with this one.
            --
            -- Visual <M-l> (`right`) is untouched; sidekick does not map visual mode.
            line_right = "",
        },
    },
}
