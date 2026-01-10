return {
  "mfussenegger/nvim-lint",
  event = { "BufReadPre", "BufNewFile" },
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

    local lint_augroup = vim.api.nvim_create_augroup("lint", { clear = true })

    vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
      group = lint_augroup,
      callback = function()
        -- Run default linters
        lint.try_lint()

        -- Conditionally run JS/TS linters based on config files
        local ft = vim.bo.filetype
        if
          ft == "javascript"
          or ft == "typescript"
          or ft == "javascriptreact"
          or ft == "typescriptreact"
        then
          if has_config({ "biome.json", "biome.jsonc" }) then
            lint.try_lint("biomejs")
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
            lint.try_lint("eslint_d")
          end
        end
      end,
    })

    vim.keymap.set("n", "<leader>ll", function()
      lint.try_lint()
      vim.notify("Linting triggered", vim.log.levels.INFO)
    end, { desc = "Trigger linting for current file" })
  end,
}
