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
      md = { "markdownlint-cli2" },
      toml = { "tombi" },
      proto = { "buf_lint" },
      -- JS/TS: no default, handled conditionally below
    }

    -- Helper to check if config exists
    local function has_config(files)
      return #vim.fs.find(files, { upward = true }) > 0
    end

    -- JS/TS conditional linting (only when manually triggered via <leader>ll)
    local original_try_lint = lint.try_lint
    lint.try_lint = function(name, opts)
      if not name then
        -- Also check for JS/TS linters when no specific linter is requested
        local ft = vim.bo.filetype
        if
          ft == "javascript"
          or ft == "typescript"
          or ft == "javascriptreact"
          or ft == "typescriptreact"
        then
          if has_config({ "biome.json", "biome.jsonc" }) then
            original_try_lint("biomejs", opts)
          elseif
            has_config({
              "eslint.config.js",
              "eslint.config.mjs",
              "eslint.config.cjs",
              ".eslintrc",
              ".eslintrc.js",
              ".eslintrc.json",
            })
          then
            original_try_lint("eslint_d", opts)
          end
        end
      end
      return original_try_lint(name, opts)
    end
  end,
}
