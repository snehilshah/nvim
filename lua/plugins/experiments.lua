return {
    "comfysage/artio.nvim",
    lazy = false,
    enabled = false,
    config = function()
        require("artio").setup({
            opts = {
                preselect = true, -- whether to preselect the first match
                bottom = true, -- whether to draw the prompt at the bottom
                shrink = true, -- whether the window should shrink to fit the matches
                promptprefix = "", -- prefix for the prompt
                prompt_title = true, -- whether to draw the prompt title
                pointer = "", -- pointer for the selected match
                marker = "│", -- prefix for marked items
                infolist = { "list" }, -- index: [1] list: (4/5)
                use_icons = true, -- requires mini.icons
            },
            win = {
                height = 12,
                hidestatusline = false, -- works best with laststatus=3
            },
            -- NOTE: if you override the mappings, make sure to provide keys for all actions
            mappings = {
                ["<down>"] = "down",
                ["<c-j>"] = "down",
                ["<up>"] = "up",
                ["<c-k>"] = "up",
                ["<cr>"] = "accept",
                ["<esc>"] = "cancel",
                ["<tab>"] = "mark",
                ["<c-g>"] = "togglelive",
                ["<c-l>"] = "togglepreview",
                ["<c-q>"] = "setqflist",
                ["<m-q>"] = "setqflistmark",
            },
        })

        -- override built-in ui select with artio
        vim.ui.select = require("artio").select

        vim.keymap.set("n", "<leader><leader>", "<Plug>(artio-files)")
        vim.keymap.set("n", "<leader>fg", function()
            require('artio.builtins').grep({
                grepprg = "rg --vimgrep --smart-case --hidden --glob '!.git/*' --glob '!node_modules/*'",
            })
        end)

        -- smart file picker
        vim.keymap.set("n", "<leader>ff", "<Plug>(artio-smart)")

        -- general built-in pickers
        vim.keymap.set("n", "<leader>fh", "<Plug>(artio-helptags)")
        vim.keymap.set("n", "<leader>fb", "<Plug>(artio-buffers)")
        vim.keymap.set("n", "<leader>f/", "<Plug>(artio-buffergrep)")
        vim.keymap.set("n", "<leader>fo", "<Plug>(artio-oldfiles)")
    end,
}
