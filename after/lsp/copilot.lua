-- secret buffers Copilot must never see, because it uploads buffer contents to GitHub
local function isAllowed(buf)
    if vim.bo[buf].buftype ~= "" then
        return false -- terminals, prompts, fzf, mini.files, ...
    end

    local ft = vim.bo[buf].filetype
    if ft == "dbui" or ft == "dbout" then
        return false
    end

    local path = vim.api.nvim_buf_get_name(buf)
    if path == "" then
        return false
    end

    local name = vim.fs.basename(path)
    local isSecret = name:find("%.env") or name:find("%.pem") or name:find("%.key")
    return not isSecret
end

return {
    -- root_dir gates the client: nvim only starts Copilot for a buffer once
    -- `on_dir` is called, so simply not calling it keeps denied buffers from
    -- ever reaching GitHub.
    -- Replaces the upstream `root_markers`.
    --
    -- `on_attach` is deliberately not set here: it would replace upstream's
    -- rather than chain with it, losing :LspCopilotSignIn / :LspCopilotSignOut.
    root_dir = function(buf, on_dir)
        if isAllowed(buf) then
            local path = vim.api.nvim_buf_get_name(buf)
            on_dir(vim.fs.root(buf, { ".git" }) or vim.fs.dirname(path))
        end
    end,
}
