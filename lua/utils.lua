local M = {}

M.get_highlighted_line_numbers = function()
    local start_line = vim.fn.line("'<")
    local end_line = vim.fn.line("'>")

    if start_line == 0 or end_line == 0 then
        print("No visual selection found")
        return
    end

    -- Ensure start_line is always less than or equal to end_line
    if start_line > end_line then
        start_line, end_line = end_line, start_line
    end

    local line_numbers = {}
    for i = start_line, end_line do
        table.insert(line_numbers, i)
    end

    local result
    if start_line == end_line then
        -- Single line: L80
        result = string.format("L%d", start_line)
    else
        -- Multiple lines: L80-85
        result = string.format("L%d-%d", start_line, end_line)
    end

    print("Line numbers: " .. result)

    -- Copy to clipboard
    vim.fn.setreg("+", result)

    return line_numbers
end

--- Dedupe LSP locations by uri+range.
---@param locations table[]
---@return table[]
local function dedupe_locations(locations)
    local seen = {}
    local out = {}
    for _, loc in ipairs(locations) do
        local uri = loc.uri or loc.targetUri
        local range = loc.range or loc.targetSelectionRange or loc.targetRange
        if uri and range then
            local key = string.format(
                "%s:%d:%d:%d:%d",
                uri,
                range.start.line,
                range.start.character,
                range["end"].line,
                range["end"].character
            )
            if not seen[key] then
                seen[key] = true
                table.insert(out, loc)
            end
        end
    end
    return out
end

--- Convert LSP locations to fzf-lua quickfix-style entries.
---@param locations table[]
---@param offset_encoding string
---@return table[]
local function locations_to_items(locations, offset_encoding)
    local items = {}
    for _, loc in ipairs(locations) do
        local item = vim.lsp.util.locations_to_items({ loc }, offset_encoding)[1]
        if item then
            table.insert(items, item)
        end
    end
    return items
end

--- gd: fetch definition + implementation in parallel, dedupe, jump if 1 else picker.
function M.lsp_goto_definition()
    local bufnr = vim.api.nvim_get_current_buf()
    local clients = vim.lsp.get_clients({ bufnr = bufnr })
    if #clients == 0 then
        vim.notify("No LSP client attached", vim.log.levels.WARN)
        return
    end

    local params = vim.lsp.util.make_position_params(0, clients[1].offset_encoding)
    local offset_encoding = clients[1].offset_encoding
    local pending = 2
    local all_locations = {}

    local function on_response(err, result)
        pending = pending - 1
        if not err and result then
            local locs = vim.islist(result) and result or { result }
            for _, loc in ipairs(locs) do
                table.insert(all_locations, loc)
            end
        end
        if pending > 0 then
            return
        end

        local unique = dedupe_locations(all_locations)
        if #unique == 0 then
            vim.notify("No definition or implementation found", vim.log.levels.INFO)
            return
        end
        if #unique == 1 then
            vim.lsp.util.show_document(unique[1], offset_encoding, { focus = true })
            return
        end

        local items = locations_to_items(unique, offset_encoding)
        local ok, fzf = pcall(require, "fzf-lua")
        if ok then
            fzf.fzf_exec(
                vim.tbl_map(function(it)
                    return string.format("%s:%d:%d: %s", it.filename, it.lnum, it.col, it.text or "")
                end, items),
                {
                    prompt = "Definitions+Implementations> ",
                    previewer = "builtin",
                    actions = {
                        ["default"] = function(selected)
                            if not selected or #selected == 0 then
                                return
                            end
                            local file, lnum, col = selected[1]:match("^(.-):(%d+):(%d+):")
                            if file then
                                vim.cmd.edit(file)
                                vim.api.nvim_win_set_cursor(0, { tonumber(lnum), tonumber(col) - 1 })
                            end
                        end,
                    },
                }
            )
        else
            vim.fn.setqflist({}, " ", { title = "Definitions+Implementations", items = items })
            vim.cmd("copen")
        end
    end

    vim.lsp.buf_request(bufnr, "textDocument/definition", params, on_response)
    vim.lsp.buf_request(bufnr, "textDocument/implementation", params, on_response)
end

--- grr: explicit references call with includeDeclaration; notify on empty.
function M.lsp_references()
    local bufnr = vim.api.nvim_get_current_buf()
    local clients = vim.lsp.get_clients({ bufnr = bufnr })
    if #clients == 0 then
        vim.notify("No LSP client attached", vim.log.levels.WARN)
        return
    end

    local params = vim.lsp.util.make_position_params(0, clients[1].offset_encoding)
    params.context = { includeDeclaration = true }

    vim.lsp.buf_request(bufnr, "textDocument/references", params, function(err, result)
        if err then
            vim.notify("References error: " .. err.message, vim.log.levels.ERROR)
            return
        end
        if not result or #result == 0 then
            vim.notify("No references found (LSP returned empty)", vim.log.levels.WARN)
            return
        end
        require("fzf-lua").lsp_references({
            jump1 = true,
            includeDeclaration = true,
            ignore_current_line = false,
        })
    end)
end

M.copyFilePathAndLineNumber = function()
    local current_file = vim.fn.expand("%:p")
    local current_line = vim.fn.line(".")
    local repo_root = vim.fn.systemlist({ "git", "rev-parse", "--show-toplevel" })[1]
    if repo_root then
        current_file = current_file:sub(#repo_root + 2)
    end
    vim.fn.setreg("+", current_file .. ":" .. current_line)
    vim.notify("Copied full path to clipboard: " .. current_file .. ":" .. current_line)
end
return M
