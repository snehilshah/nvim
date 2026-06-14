return {
    "folke/flash.nvim",
    event = "VeryLazy",
    opts = {
        jump = { nohlsearch = true },
        prompt = {
            win_config = {
                border = "none",
                -- Place the prompt above the statusline.
                row = -3,
            },
        },
        search = {
            exclude = {
                "flash_prompt",
                "qf",
                function(win)
                    -- Non-focusable windows.
                    return not vim.api.nvim_win_get_config(win).focusable
                end,
            },
        },
        modes = {
            -- Disable flash on / and ? search: labels teleported the cursor
            -- mid-query and recomputing them per keystroke lagged the cmdline.
            -- Use `s` for explicit jumps instead.
            search = { enabled = false },
        },
    },
    keys = {
        {
            "s",
            mode = { "n", "x", "o" },
            function()
                require("flash").jump()
            end,
            desc = "Flash",
        },
        {
            "r",
            mode = "o",
            function()
                require("flash").treesitter_search()
            end,
            desc = "Treesitter Search",
        },
        {
            "R",
            mode = "o",
            function()
                require("flash").remote()
            end,
            desc = "Remote Flash",
        },
    },
}
