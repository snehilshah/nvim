return {
  root_markers = { "angular.json", "project.json" },
  root_dir = function(bufnr, on_dir)
    local fname = vim.api.nvim_buf_get_name(bufnr)
    local angular_json = vim.fs.find({ "angular.json", "project.json" }, {
      path = fname,
      upward = true,
      type = "file",
    })[1]
    if angular_json then
      on_dir(vim.fs.dirname(angular_json))
    end
    -- Return nothing to prevent angularls from starting in non-Angular projects
  end,
}
