return {
    "nvim-mini/mini.icons",
    priority = 1000,
    lazy = false,
    version = false,
    opts = {
        file = {
            ["Dockerfile"] = { glyph = "󰡨", hl = "MiniIconsBlue" },
            ["Makefile"] = { glyph = "", hl = "MiniIconsRed" },
            [".dockerignore"] = { glyph = "󰡨", hl = "MiniIconsBlue" },
            [".gitignore"] = { glyph = "", hl = "MiniIconsOrange" },
            ["README.md"] = { glyph = "", hl = "MiniIconsRed" },
        },
        filetype = {
            dockerfile = { glyph = "󰡨", hl = "MiniIconsBlue" },
            make = { glyph = "", hl = "MiniIconsRed" },
            markdown = { glyph = "", hl = "MiniIconsBlue" },
            go = { glyph = "", hl = "MiniIconsAzure" },
            json = { glyph = "", hl = "MiniIconsYellow" },
            jsonc = { glyph = "", hl = "MiniIconsYellow" },
        },
        extension = {
            log = { glyph = "󰌱", hl = "MiniIconsGreen" },
            md = { glyph = "", hl = "MiniIconsBlue" },
        },
    },
    config = function(_, opts)
        local miniicons = require("mini.icons")
        miniicons.setup(opts)
        miniicons.mock_nvim_web_devicons()
    end,
}
