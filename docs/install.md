# Required Installations

External tools required by this config. Install globally — Mason is not used.

Run `:CheckTools` inside Neovim to inspect configured formatters, linters and
LSP executables. Project-gated and dynamic commands are shown as unverified
instead of being reported as installed or missing.

Preference order everywhere: **brew first**, then language-specific package
managers (npm / go / cargo) as fallback.

## Essentials

| Tool          | Purpose                            | Install                    |
| ------------- | ---------------------------------- | -------------------------- |
| Neovim 0.12+  | Native LSP and diagnostic status   | `brew install neovim`      |
| `tree-sitter` | Parser compilation for `:TSUpdate` | `brew install tree-sitter` |

## Language Servers

Only the servers actually enabled in `lua/lsp.lua` are listed.

| Binary                        | Language      | Install                                                                |
| ----------------------------- | ------------- | ---------------------------------------------------------------------- |
| `lua-language-server`         | Lua           | `brew install lua-language-server`                                     |
| `gopls`                       | Go            | `brew install gopls` (or `go install golang.org/x/tools/gopls@latest`) |
| `clangd`                      | C/C++         | `brew install llvm`                                                    |
| `biome`                       | JS/TS/JSON    | `brew install biome`                                                   |
| `buf`                         | Protobuf      | `brew install bufbuild/buf/buf`                                        |
| `bash-language-server`        | Bash/Shell    | `brew install bash-language-server`                                    |
| `yaml-language-server`        | YAML          | `brew install yaml-language-server`                                    |
| `tsgo`                        | TS/JS         | `npm install -g @typescript/native-preview typescript`                 |
| `vscode-css-language-server`  | CSS/HTML/JSON | `npm install -g vscode-langservers-extracted`                          |
| `docker-langserver`           | Docker        | `npm install -g dockerfile-language-server-nodejs`                     |
| `tailwindcss-language-server` | Tailwind      | `npm install -g @tailwindcss/language-server`                          |
| `emmet-language-server`       | Emmet         | `npm install -g @olrtg/emmet-language-server`                          |
| `astro-ls`                    | Astro         | `npm install -g @astrojs/language-server`                              |
| `ngserver`                    | Angular       | `npm install -g @angular/language-server`                              |
| `vimdoc-language-server`      | Vimdoc        | `cargo install --locked vimdoc-language-server`                        |
| `copilot-language-server`     | Copilot       | `npm install -g @github/copilot-language-server`                       |

`vscode-langservers-extracted` provides the CSS, HTML and JSON servers in one package.
`bash-language-server` invokes `shellcheck` for diagnostics, so install it with
`brew install shellcheck`; nvim-lint does not run a second copy.

## Formatters (conform.nvim)

| Formatter           | Languages                      | Install                                              |
| ------------------- | ------------------------------ | ---------------------------------------------------- |
| `prettier`          | JS/TS/Astro/HTML/CSS/SCSS/JSON | `brew install prettier`                              |
| `biome`             | JS/TS/Astro/JSON/CSS           | `brew install biome`                                 |
| `stylua`            | Lua                            | `brew install stylua`                                |
| `gofumpt`           | Go                             | `brew install gofumpt`                               |
| `shfmt`             | Shell                          | `brew install shfmt`                                 |
| `yamlfmt`           | YAML                           | `brew install yamlfmt`                               |
| `dockerfmt`         | Dockerfile                     | `brew install dockerfmt`                             |
| `markdownlint-cli2` | Markdown                       | `brew install markdownlint-cli2`                     |
| `buf`               | Protobuf                       | `brew install bufbuild/buf/buf`                      |
| `goimports`         | Go                             | `go install golang.org/x/tools/cmd/goimports@latest` |
| `tombi`             | TOML                           | `cargo install --locked tombi-cli`                   |

C/C++ formatting is done by the `clangd` LSP, not a standalone formatter.

`prettier` is gated on `require_cwd` and only runs when the project has a
Prettier config. Otherwise Biome handles JS/TS/Astro/JSON/CSS. HTML and SCSS
fall back to their LSP formatter because Biome does not format them.
`:CheckTools` marks Prettier as unverified outside a configured project; that is
expected, not a broken install.

## Linters (nvim-lint)

Triggered manually with `<leader>ll`.

| Linter              | Languages  | Install                            |
| ------------------- | ---------- | ---------------------------------- |
| `golangci-lint`     | Go         | `brew install golangci-lint`       |
| `cppcheck`          | C/C++      | `brew install cppcheck`            |
| `hadolint`          | Dockerfile | `brew install hadolint`            |
| `yamllint`          | YAML       | `brew install yamllint`            |
| `markdownlint-cli2` | Markdown   | `brew install markdownlint-cli2`   |
| `buf`               | Protobuf   | `brew install bufbuild/buf/buf`    |
| `eslint_d`          | JS/TS      | `npm install -g eslint_d`          |
| `jsonlint`          | JSON       | `npm install -g jsonlint`          |
| `tombi`             | TOML       | `cargo install --locked tombi-cli` |

JS/TS linting also comes from the `biome` LSP, which only activates when the
project has a `biome.json`.

## Database CLI Clients

vim-dadbod shells out to these. Install only what you need.

| Client      | Database      | Install                                                        |
| ----------- | ------------- | -------------------------------------------------------------- |
| `psql`      | PostgreSQL    | `brew install postgresql` (or `apt install postgresql-client`) |
| `mysql`     | MySQL/MariaDB | `brew install mysql-client` (or `apt install mysql-client`)    |
| `sqlite3`   | SQLite        | `brew install sqlite` (usually preinstalled)                   |
| `mongosh`   | MongoDB       | `brew install mongosh`                                         |
| `redis-cli` | Redis         | `brew install redis` (or `apt install redis-tools`)            |

## One-Shot Install

```bash
# brew (preferred)
brew install \
  neovim tree-sitter \
  lua-language-server gopls llvm biome bufbuild/buf/buf \
  bash-language-server yaml-language-server \
  prettier stylua gofumpt shfmt yamlfmt dockerfmt markdownlint-cli2 \
  golangci-lint shellcheck cppcheck hadolint yamllint

# npm (no brew formula available)
npm install -g \
  @typescript/native-preview typescript \
  vscode-langservers-extracted \
  dockerfile-language-server-nodejs \
  @tailwindcss/language-server \
  @olrtg/emmet-language-server \
  @astrojs/language-server \
  @angular/language-server \
  @github/copilot-language-server \
  eslint_d jsonlint

# go (no brew formula available)
go install golang.org/x/tools/cmd/goimports@latest

# cargo (no brew formula available)
cargo install --locked vimdoc-language-server tombi-cli
```

Verify afterwards with `:CheckTools` in Neovim.

## Notes

- **Neovim 0.12+** — config uses native LSP and `vim.diagnostic.status()`.
- **nvim-lspconfig** supplies base server configs; `after/lsp/*.lua` are overrides
  merged with higher priority.
- **Mason is not used** — everything is installed globally.
- **Formatting** is conform.nvim, on save (toggle with `:ToggleFormat`).
- **Linting** is nvim-lint, triggered manually with `<leader>ll`.
