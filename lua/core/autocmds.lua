local api = vim.api

-- Prevent LSP from attaching to non-file buffers (codediff, fugitive, etc.)
api.nvim_create_autocmd("LspAttach", {
  callback = function(args)
    local bufname = api.nvim_buf_get_name(args.buf)
    -- Allow file:// scheme or plain paths, block everything else
    if bufname:match("^%w+://") and not bufname:match("^file://") then
      vim.schedule(function()
        local client = vim.lsp.get_client_by_id(args.data.client_id)
        if client then
          vim.lsp.buf_detach_client(args.buf, args.data.client_id)
        end
      end)
    end
  end,
})

-- don't auto comment new line
api.nvim_create_autocmd("BufEnter", { command = [[set formatoptions-=cro]] })

-- go to last loc when opening a buffer
-- this mean that when you open a file, you will be at the last position
api.nvim_create_autocmd("BufReadPost", {
  callback = function()
    local mark = vim.api.nvim_buf_get_mark(0, '"')
    local lcount = vim.api.nvim_buf_line_count(0)
    if mark[1] > 0 and mark[1] <= lcount then
      pcall(vim.api.nvim_win_set_cursor, 0, mark)
    end
  end,
})

-- Stop eslint_d daemon on exit (prevents orphaned processes)
api.nvim_create_autocmd("VimLeavePre", {
  callback = function()
    if vim.fn.executable("eslint_d") == 1 then
      vim.fn.system("eslint_d stop")
    end
  end,
})

-- close some filetypes with <q>
api.nvim_create_autocmd("FileType", {
  group = api.nvim_create_augroup("close_with_q", { clear = true }),
  pattern = {
    "PlenaryTestPopup",
    "help",
    "lspinfo",
    "man",
    "notify",
    "qf",
    "spectre_panel",
    "startuptime",
    "tsplayground",
    "neotest-output",
    "checkhealth",
    "neotest-summary",
    "neotest-output-panel",
  },
  callback = function(event)
    vim.bo[event.buf].buflisted = false
    vim.keymap.set("n", "q", "<cmd>close<cr>", { buffer = event.buf, silent = true })
  end,
})
