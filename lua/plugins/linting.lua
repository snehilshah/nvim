-- Linter Configuration (nvim-lint)
-- All linters should be installed globally:
--   jsonlint, golangci-lint, shellcheck, hadolint, yamllint,
--   cppcheck, markdownlint-cli2, tombi, buf (buf_lint), eslint_d
-- Note: biome is handled via LSP (see justlsp.lua)
return {
  "mfussenegger/nvim-lint",
  keys = {
    {
      "<leader>ll",
      function()
        require("lint").try_lint()
        vim.notify("Linting triggered", vim.log.levels.INFO)
      end,
      desc = "Trigger linting for current file",
    },
  },
  config = function()
    local lint = require("lint")

    local golangcilint = lint.linters.golangcilint
    golangcilint.ignore_exitcode = true
    golangcilint.args = {
      "run",
      "--out-format=json",
      "--issues-exit-code=0",
    }

    lint.linters_by_ft = {
      json = { "jsonlint" },
      jsonc = { "jsonlint" },
      go = { "golangcilint" },
      sh = { "shellcheck" },
      bash = { "shellcheck" },
      zsh = { "shellcheck" },
      dockerfile = { "hadolint" },
      yaml = { "yamllint" },
      yml = { "yamllint" },
      c = { "cppcheck" },
      cpp = { "cppcheck" },
      markdown = { "markdownlint-cli2" },
      toml = { "tombi" },
      proto = { "buf_lint" },
      -- JS/TS: eslint_d will use its own root marker detection
      -- biome linting is handled via LSP (only activates with biome.json)
      javascript = { "eslint_d" },
      javascriptreact = { "eslint_d" },
      typescript = { "eslint_d" },
      typescriptreact = { "eslint_d" },
    }
  end,
}
