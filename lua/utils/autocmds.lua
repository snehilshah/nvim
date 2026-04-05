local api = vim.api
local keymap_buf_opt = "buf"

local function is_non_file_uri(bufname)
  if bufname == "" or bufname:match("^file://") then
    return false
  end

  -- Match RFC3986 schemes (`svn+ssh:`, `iris.xpc:`, etc.) while keeping
  -- Windows drive-letter paths like `C:\foo` treated as local files.
  if bufname:match("^%a:[/\\]") then
    return false
  end

  return bufname:match("^[%a][%w+.-]*:") ~= nil
end

-- Prevent LSP from attaching to non-file buffers (codediff, fugitive, etc.)
api.nvim_create_autocmd("LspAttach", {
  callback = function(args)
    local bufname = api.nvim_buf_get_name(args.buf)
    -- Allow file:// scheme or plain paths, block everything else
    if is_non_file_uri(bufname) then
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
  desc = "Go to the last location when opening a buffer",
  callback = function(args)
    local mark = vim.api.nvim_buf_get_mark(args.buf, '"')
    local line_count = vim.api.nvim_buf_line_count(args.buf)
    if mark[1] > 0 and mark[1] <= line_count then
      vim.cmd('normal! g`"zz')
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
    "codediff",
  },
  callback = function(args)
    if args.match ~= "help" or not vim.bo[args.buf].modifiable then
      vim.keymap.set("n", "q", "<cmd>quit<cr>", { buffer = args.buf })
    end
  end,
})

vim.api.nvim_create_autocmd("FileType", {
  group = vim.api.nvim_create_augroup("mariasolos/treesitter_folding", { clear = true }),
  desc = "Enable Treesitter folding",
  callback = function(args)
    local bufnr = args.buf

    -- Enable Treesitter folding when not in huge files and when Treesitter
    -- is working.
    if vim.bo[bufnr].filetype ~= "bigfile" and pcall(vim.treesitter.start, bufnr) then
      vim.api.nvim_buf_call(bufnr, function()
        vim.wo[0][0].foldmethod = "expr"
        vim.wo[0][0].foldexpr = "v:lua.vim.treesitter.foldexpr()"
        vim.cmd.normal("zx")
      end)
    end
  end,
})
