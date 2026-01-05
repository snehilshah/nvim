return {
  capabilities = {
    workspace = {
      didChangeWatchedFiles = {
        dynamicRegistration = true,
      },
    },
  },
  on_attach = function(client, bufnr)
    -- Codelens support
    local function check_codelens_support()
      if client.server_capabilities.codeLensProvider then
        return true
      end
      return false
    end

    vim.api.nvim_create_autocmd(
      { "TextChanged", "InsertLeave", "CursorHold", "LspAttach", "BufEnter" },
      {
        buffer = bufnr,
        callback = function()
          if check_codelens_support() then
            vim.lsp.codelens.refresh({ bufnr = bufnr })
          end
        end,
      }
    )

    -- Initial codelens refresh
    if check_codelens_support() then
      vim.lsp.codelens.refresh({ bufnr = bufnr })
    end

    -- Daily note command
    vim.api.nvim_create_user_command("Daily", function(args)
      local input = args.args
      if input == "" then
        client:exec_cmd({ command = "jump", arguments = {} })
      else
        client:exec_cmd({ command = "jump", arguments = { input } })
      end
    end, { desc = "Open daily note", nargs = "*" })
  end,
}
