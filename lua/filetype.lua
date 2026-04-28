vim.filetype.add({
    extension = {
        env = "dotenv",
        mdx = "mdx",
    },
    filename = {
        [".env"] = "dotenv",
        ["env"] = "dotenv",
        [".eslintrc.json"] = "jsonc",
    },
    pattern = {
        ["[jt]sconfig.*.json"] = "jsonc",
        ["tsconfig*.json"] = "jsonc",
        [".*/%.vscode/.*%.json"] = "jsonc",
        ["%.env%.[%w_.-]+"] = "dotenv",
        -- Borrowed from LazyVim. Mark huge files to disable features later.
        [".*"] = function(path, bufnr)
            return vim.bo[bufnr]
                    and vim.bo[bufnr].filetype ~= "bigfile"
                    and path
                    and vim.fn.getfsize(path) > (1024 * 500) -- 500 KB
                    and "bigfile"
                or nil
        end,
    },
})
