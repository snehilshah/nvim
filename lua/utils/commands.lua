local function get_project_root()
  return vim.fn.getcwd()
end

local function with_project_path(fn)
  local project_root = get_project_root()
  local project_path = project_root .. "/**"
  local previous_path = vim.o.path
  vim.o.path = project_path

  local ok, result = xpcall(fn, debug.traceback)
  vim.o.path = previous_path

  if not ok then
    error(result)
  end

  return result
end

local function complete_project_file(arg_lead)
  return with_project_path(function()
    return vim.fn.getcompletion(arg_lead, "file_in_path")
  end)
end

-- Open files from the current project with native cmdline completion.
vim.api.nvim_create_user_command("O", function(opts)
  with_project_path(function()
    vim.cmd.find(vim.fn.fnameescape(opts.args))
  end)
end, {
  nargs = 1,
  complete = complete_project_file,
  desc = "Open a file from your project root",
})

-- User commands must start with an uppercase letter, so alias exact `:o` to `:O`.
vim.cmd([[cnoreabbrev <expr> o getcmdtype() ==# ':' && getcmdline() ==# 'o' ? 'O' : 'o']])
