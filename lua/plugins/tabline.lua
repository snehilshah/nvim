return {
    "romgrk/barbar.nvim",
    version = "^1.0.0", -- optional: only update when a new 1.x version is released
    dependencies = {
        "nvim-mini/mini.icons",
    },
    init = function()
        vim.g.barbar_auto_setup = false

        local map = vim.keymap.set
        local opts = { silent = true }

        map("n", "<A-,>", "<Cmd>BufferPrevious<CR>", opts)
        map("n", "<A-.>", "<Cmd>BufferNext<CR>", opts)

        map("n", "<A-S-,>", "<Cmd>BufferMovePrevious<CR>", opts)
        map("n", "<A-S-.>", "<Cmd>BufferMoveNext<CR>", opts)

        for i = 1, 9 do
            map("n", "<A-" .. i .. ">", "<Cmd>BufferGoto " .. i .. "<CR>", opts)
        end
        map("n", "<A-0>", "<Cmd>BufferLast<CR>", opts)

        map("n", "<A-p>", "<Cmd>BufferPin<CR>", opts)
        map("n", "<A-c>", "<Cmd>BufferClose<CR>", opts)
        map("n", "<C-p>", "<Cmd>BufferPick<CR>", opts)

        map("n", "<Space>bb", "<Cmd>BufferOrderByBufferNumber<CR>", opts)
        map("n", "<Space>bn", "<Cmd>BufferOrderByName<CR>", opts)
        map("n", "<Space>bd", "<Cmd>BufferOrderByDirectory<CR>", opts)
        map("n", "<Space>bl", "<Cmd>BufferOrderByLanguage<CR>", opts)
        map("n", "<Space>bw", "<Cmd>BufferOrderByWindowNumber<CR>", opts)
    end,
    opts = {
        animation = true,
        -- Enable/disable current/total tabpages indicator (top right corner)
        tabpages = true,
        -- A buffer to this direction will be focused (if it exists) when closing the current buffer.
        -- Valid options are 'left' (the default), 'previous', and 'right'
        focus_on_close = "left",
        -- Hide inactive buffers and file extensions. Other options are `alternate`, `current`, and `visible`.
        hide = { extensions = true, inactive = false },
        icons = {
            buffer_index = true,
            -- buffer_number = true,
            button = "",
            diagnostics = {
                [1] = { enabled = true, icon = " " },
                [2] = { enabled = true, icon = " " },
            },
            preset = "default",
            -- separator = { left = "▎", right = "" },
            -- If true, add an additional separator at the end of the buffer list
            separator_at_end = true,
            -- Configure the icons on the bufferline when modified or pinned.
            -- Supports all the base icon options.
            modified = { button = "●" },
            pinned = { button = "", filename = true },
            -- Configure the icons on the bufferline based on the visibility of a buffer.
            -- Supports all the base icon options, plus `modified` and `pinned`.
            alternate = { filetype = { enabled = false } },
            current = { buffer_index = true },
            inactive = { buffer_index = true, button = "×" },
            visible = { modified = { buffer_number = true } },
        },
        maximum_length = 25, -- Sets the maximum buffer name length.
    },
}
