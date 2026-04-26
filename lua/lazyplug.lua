local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.uv.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable",
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
    ui = {
        border = "rounded",
        backdrop = 80,
        -- title = "$NH!L", -- did not look very good
        title_pos = "left",
    },
    dev = {
        path = "~/myCodes",
    },
    change_detection = {
        enabled = true,
        notify = false,
    },
    rocks = {
        enabled = false,
    },
    spec = {
        { import = "plugins" },
        { import = "plugins.languages" },
        { import = "plugins.mini" },
    },
    -- automatically check for plugin updates
    checker = {
        enabled = true, -- Check for updates periodically
        notify = false, -- Do not notify on update
        frequency = 360, -- check for updates every 10 hours
        check_pinned = false,
    },
    performance = {
        rtp = {
            disabled_plugins = {
                "gzip",
                "netrwPlugin",
                "rplugin",
                "tarPlugin",
                "tohtml",
                "tutor",
                "zipPlugin",
            },
        },
    },
})

vim.cmd.packadd("nvim.undotree")
vim.cmd.packadd("nvim.difftool")
require("vim._core.ui2").enable({})
