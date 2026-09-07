return {
    "romgrk/barbar.nvim",
    version = "^1.0.0", -- optional: only update when a new 1.x version is released
    dependencies = {
        "nvim-mini/mini.icons",
    },
    init = function()
        vim.g.barbar_auto_setup = false

        local function map(lhs, rhs, desc)
            vim.keymap.set("n", lhs, rhs, { silent = true, desc = desc })
        end

        map("<A-,>", "<Cmd>BufferPrevious<CR>", "Previous buffer")
        map("<A-.>", "<Cmd>BufferNext<CR>", "Next buffer")

        map("<A-S-,>", "<Cmd>BufferMovePrevious<CR>", "Move buffer left")
        map("<A-S-.>", "<Cmd>BufferMoveNext<CR>", "Move buffer right")

        map("<A-p>", "<Cmd>BufferPin<CR>", "Pin buffer")
        map("<A-c>", require("tabpages").close_buffer, "Close editing buffer")
        map("<C-p>", "<Cmd>BufferPick<CR>", "Pick buffer")
        map("<leader>br", "<Cmd>BufferRestore<CR>", "Restore last closed buffer")
    end,
    opts = {
        animation = true,
        -- A single buffer is already identified by the statusline; save the row.
        auto_hide = 0,
        -- The statusline shows a clearer workspace label and tabpage count.
        tabpages = false,
        -- Return to the buffer used before the one being closed.
        focus_on_close = "previous",
        -- Parent directories are needed to distinguish duplicate filenames.
        hide = { extensions = false, inactive = false },
        no_name_title = "New",
        icons = {
            buffer_index = false,
            button = "",
            diagnostics = {
                [vim.diagnostic.severity.ERROR] = { enabled = true, icon = " " },
                [vim.diagnostic.severity.WARN] = { enabled = true, icon = " " },
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
            current = { buffer_index = false },
            inactive = { buffer_index = false, button = false },
            visible = { modified = { buffer_number = false } },
        },
        maximum_length = 25, -- Sets the maximum buffer name length.
    },
}
