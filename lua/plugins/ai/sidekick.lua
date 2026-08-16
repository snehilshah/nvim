-- Copilot provides inline and next-edit suggestions through Neovim's LSP
-- support. Sidekick handles next edits and the Codex/Antigravity terminals.
local function toggle_ai_completions()
    local enabled = vim.lsp.is_enabled("copilot")

    if enabled then
        vim.g.sidekick_nes = false
        require("sidekick.nes").disable()
        vim.lsp.inline_completion.enable(false)
        vim.lsp.enable("copilot", false)
    else
        vim.g.sidekick_nes = nil
        vim.lsp.enable("copilot")
        vim.lsp.inline_completion.enable()
        require("sidekick.nes").enable()
    end

    vim.cmd.redrawstatus()
    vim.notify(
        enabled and "AI completions disabled; chat stays available" or "AI completions enabled"
    )
end

return {
    "folke/sidekick.nvim",
    event = { "BufReadPost", "BufNewFile" },

    init = function()
        vim.lsp.inline_completion.enable()
    end,

    opts = {
        cli = {
            picker = "fzf-lua",
            tools = {
                antigravity = {
                    cmd = { "agy" },
                    is_proc = "\\<agy\\>",
                },
            },
        },
    },

    keys = {
        {
            "<M-l>",
            function()
                if vim.fn.mode() == "i" then
                    vim.lsp.inline_completion.get()
                elseif not require("sidekick").nes_jump_or_apply() then
                    require("mini.move").move_line("right")
                end
            end,
            mode = { "i", "n" },
            desc = "Accept or apply AI suggestion",
        },
        {
            "<leader>ac",
            function()
                require("sidekick.cli").toggle({ name = "codex", focus = true })
            end,
            desc = "Toggle codex",
        },
        {
            "<leader>ak",
            toggle_ai_completions,
            desc = "Toggle AI completions",
        },
        {
            "<leader>ag",
            function()
                require("sidekick.cli").toggle({ name = "antigravity", focus = true })
            end,
            desc = "Toggle antigravity",
        },
        {
            "<C-.>",
            function()
                require("sidekick.cli").focus({ filter = { attached = true } })
            end,
            mode = { "n", "i", "x", "t" },
            desc = "Focus CLI",
        },
        {
            "<leader>af",
            function()
                require("sidekick.cli").send({ filter = { attached = true }, msg = "{file}" })
            end,
            desc = "Send file ref to CLI",
        },
        {
            "<leader>at",
            function()
                require("sidekick.cli").send({ filter = { attached = true }, msg = "{this}" })
            end,
            mode = { "n", "x" },
            desc = "Send cursor ref to CLI",
        },
        {
            "<leader>ad",
            function()
                require("sidekick.cli").send({ filter = { attached = true }, msg = "{diagnostics}" })
            end,
            desc = "Send diagnostics to CLI",
        },
        {
            "<leader>av",
            function()
                require("sidekick.cli").send({ filter = { attached = true }, msg = "{selection}" })
            end,
            mode = "x",
            desc = "Send selection text to CLI",
        },
    },
}
