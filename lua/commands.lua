vim.api.nvim_create_user_command("ToggleFormat", function()
    vim.g.autoformat = not vim.g.autoformat
    vim.notify(
        string.format("%s formatting...", vim.g.autoformat and "Enabling" or "Disabling"),
        vim.log.levels.INFO
    )
end, { desc = "Toggle conform.nvim auto-formatting", nargs = 0 })

vim.api.nvim_create_user_command("ToggleInlayHints", function()
    vim.g.inlay_hints = not vim.g.inlay_hints
    vim.notify(
        string.format("%s inlay hints...", vim.g.inlay_hints and "Enabling" or "Disabling"),
        vim.log.levels.INFO
    )

    local mode = vim.api.nvim_get_mode().mode
    vim.lsp.inlay_hint.enable(vim.g.inlay_hints and (mode == "n" or mode == "v"))
end, { desc = "Toggle inlay hints", nargs = 0 })

-- Verify that the formatter, linter, and LSP commands referenced by the config
-- are installed. Reads the live plugin and LSP tables so the report stays in
-- sync with the actual configuration.
-- Install instructions live in docs/install.md.
vim.api.nvim_create_user_command("CheckTools", function()
    ---@param map table<string, string[]> filetype -> tool names
    ---@return table<string, string[]> tool name -> filetypes
    local function invert(map)
        local tools = {}
        for ft, names in pairs(map or {}) do
            -- ipairs skips option keys (stop_after_first, timeout_ms, ...).
            for _, name in ipairs(names) do
                tools[name] = tools[name] or {}
                table.insert(tools[name], ft)
            end
        end
        return tools
    end

    local function sorted_keys(tbl)
        local keys = vim.tbl_keys(tbl)
        table.sort(keys)
        return keys
    end

    local lines, missing, unverified = {}, 0, 0

    local function section(title, tools, is_available)
        table.insert(lines, title)
        for _, name in ipairs(sorted_keys(tools)) do
            local fts = tools[name]
            table.sort(fts)
            -- ok == nil means "cannot be verified", which is reported distinctly
            -- rather than as a pass, so unchecked entries never look healthy.
            local ok, detail = is_available(name)
            if ok == false then
                missing = missing + 1
            elseif ok == nil then
                unverified = unverified + 1
            end
            table.insert(
                lines,
                string.format(
                    "  %s %-22s %s%s",
                    ok == nil and "??  " or (ok and "OK  " or "MISS"),
                    name,
                    table.concat(fts, ", "),
                    detail and ("  -- " .. detail) or ""
                )
            )
        end
        table.insert(lines, "")
    end

    -- Both plugins are lazy-loaded; force them so their tables are populated.
    pcall(function()
        require("lazy").load({ plugins = { "conform.nvim", "nvim-lint", "nvim-lspconfig" } })
    end)

    local ok_conform, conform = pcall(require, "conform")
    if ok_conform then
        section("Formatters (conform.nvim)", invert(conform.formatters_by_ft), function(name)
            local info = conform.get_formatter_info(name)
            if info.available then
                return true, nil
            end
            if type(info.command) == "string" and vim.fn.executable(info.command) == 1 then
                return nil, info.available_msg
            end
            return false, info.available_msg
        end)
    else
        table.insert(lines, "Formatters: conform.nvim not loaded")
        table.insert(lines, "")
    end

    local ok_lint, lint = pcall(require, "lint")
    if ok_lint then
        section("Linters (nvim-lint)", invert(lint.linters_by_ft), function(name)
            local got, linter = pcall(function()
                return lint.linters[name]
            end)
            if not got or not linter then
                return false, "linter definition not found"
            end
            local cmd = linter.cmd
            if type(cmd) == "function" then
                local called, result = pcall(cmd)
                cmd = called and result or nil
            end
            if not cmd then
                return false, "no command"
            end
            return vim.fn.executable(cmd) == 1, nil
        end)
    else
        table.insert(lines, "Linters: nvim-lint not loaded")
        table.insert(lines, "")
    end

    -- LSP servers are exported and enabled during setup in lua/lsp.lua.
    local ok_lsp, lspmod = pcall(require, "lsp")
    local function server_config(name)
        local got, cfg = pcall(function()
            return vim.lsp.config[name]
        end)
        return got and cfg or nil
    end

    if ok_lsp and type(lspmod) == "table" and lspmod.servers then
        local servers = {}
        for _, name in ipairs(lspmod.servers) do
            local cfg = server_config(name)
            servers[name] = vim.deepcopy((cfg and cfg.filetypes) or {})
        end

        section("LSP servers (vim.lsp.enable)", servers, function(name)
            local cfg = server_config(name)
            if not cfg then
                return false, "no config resolved"
            end
            local cmd = cfg.cmd
            if type(cmd) == "function" then
                -- Calling it would actually spawn the server, so it cannot be
                -- probed safely. Report as unverified rather than healthy.
                return nil, "dynamic cmd -- verify manually"
            end
            if type(cmd) ~= "table" or not cmd[1] then
                return false, "no cmd defined"
            end
            local bin = cmd[1]
            if vim.fn.executable(bin) == 1 then
                return true, nil
            end
            return false, "Command '" .. bin .. "' not found"
        end)
    else
        table.insert(lines, "LSP servers: configuration unavailable")
        table.insert(lines, "")
    end

    local summary = {}
    if missing > 0 then
        table.insert(summary, string.format("%d configured entries missing", missing))
    end
    if unverified > 0 then
        table.insert(summary, string.format("%d unverified in this context", unverified))
    end
    table.insert(lines, #summary == 0 and "All tools present." or table.concat(summary, "; "))
    if missing > 0 then
        table.insert(lines, "See docs/install.md for installation commands.")
    end

    local buf = vim.api.nvim_create_buf(false, true)
    vim.api.nvim_buf_set_lines(buf, 0, -1, false, lines)
    vim.bo[buf].modifiable = false
    vim.bo[buf].bufhidden = "wipe"
    vim.cmd.split()
    vim.api.nvim_win_set_buf(0, buf)
    vim.api.nvim_win_set_height(0, math.min(#lines + 1, 25))
end, { desc = "Report configured development tools", nargs = 0 })
