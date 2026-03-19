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

-- Exported for testing purposes (Bolt guideline)
M._repo_root_cache = {}

M.copyFilePathAndLineNumber = function()
  local current_file = vim.fn.expand("%:p")
  local current_line = vim.fn.line(".")
  local cwd = vim.fn.getcwd()

  -- Optimization: Memoize synchronous systemlist call to avoid ~4ms process spawn overhead
  local repo_root = M._repo_root_cache[cwd]
  if repo_root == nil then
    local result = vim.fn.systemlist("git rev-parse --show-toplevel")[1]
    repo_root = result or false
    M._repo_root_cache[cwd] = repo_root
  end

  if repo_root then
    current_file = current_file:sub(#repo_root + 2)
  end
  vim.fn.setreg("+", current_file .. ":" .. current_line)
  vim.notify("Copied full path to clipboard: " .. current_file .. ":" .. current_line)
end
return M
