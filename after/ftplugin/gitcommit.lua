-- Enable native virtual_text for gitcommit
-- tiny-inline-diagnostic may not attach properly in gitcommit buffers
vim.diagnostic.config({
  virtual_text = {
    prefix = "●",
    source = "if_many",
  },
}, vim.api.nvim_get_current_buf())
