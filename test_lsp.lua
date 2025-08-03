-- Test file for LSP functionality
-- Try typing vim.api.nvim_ and see if you get completions

local function test_function()
  -- This should trigger completions when you type vim.api.nvim_buf_set_lines
  vim.api.nvim_buf_set_lines(0, 0, -1, false, {"Hello", "World"})
  
  -- Test some other vim APIs
  vim.api.nvim_create_autocmd("BufWritePre", {
    callback = function()
      print("Auto-format should work now")
    end
  })
end

return test_function
