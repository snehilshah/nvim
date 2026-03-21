local config_root = vim.fs.normalize(vim.fn.stdpath("config"))
local config_path = config_root .. "/**"

local function with_config_path(fn)
  local previous_path = vim.o.path
  vim.o.path = config_path

  local ok, result = xpcall(fn, debug.traceback)
  vim.o.path = previous_path

  if not ok then
    error(result)
  end

  return result
end

local function complete_config_file(arg_lead)
  return with_config_path(function()
    return vim.fn.getcompletion(arg_lead, "file_in_path")
  end)
end

-- Open files from the Neovim config with native cmdline completion.
vim.api.nvim_create_user_command("O", function(opts)
  with_config_path(function()
    vim.cmd.find(vim.fn.fnameescape(opts.args))
  end)
end, {
  nargs = 1,
  complete = complete_config_file,
  desc = "Open a file from your Neovim config",
})

-- User commands must start with an uppercase letter, so alias exact `:o` to `:O`.
vim.cmd([[cnoreabbrev <expr> o getcmdtype() ==# ':' && getcmdline() ==# 'o' ? 'O' : 'o']])
