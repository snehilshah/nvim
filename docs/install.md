# Required Installations

This document tracks all external tools required for the Neovim configuration.
Install these globally on your system.

## Language Servers

Language servers provide IntelliSense, diagnostics, go-to-definition, and other LSP features.

| Server | Language | Installation |
|--------|----------|--------------|
| `lua-language-server` | Lua | `brew install lua-language-server` |
| `gopls` | Go | `go install golang.org/x/tools/gopls@latest` |
| `typescript-language-server` | TypeScript/JavaScript | `npm install -g typescript-language-server typescript` |
| `bash-language-server` | Bash/Shell | `npm install -g bash-language-server` |
| `vscode-langservers-extracted` | CSS/HTML/JSON | `npm install -g vscode-langservers-extracted` |
| `yaml-language-server` | YAML | `npm install -g yaml-language-server` |
| `markdown-oxide` | Markdown | `cargo install --locked markdown-oxide` |
| `docker-langserver` | Docker | `npm install -g dockerfile-language-server-nodejs` |
| `clangd` | C/C++ | `brew install llvm` or via system package manager |
| `tailwindcss-language-server` | Tailwind CSS | `npm install -g @tailwindcss/language-server` |
| `emmet-language-server` | Emmet | `npm install -g @olrtg/emmet-language-server` |
| `harper-ls` | Grammar/spelling | `cargo install --locked harper-ls` |

### Quick Install (npm)

```bash
npm install -g \
  typescript-language-server typescript \
  bash-language-server \
  vscode-langservers-extracted \
  yaml-language-server \
  dockerfile-language-server-nodejs \
  @tailwindcss/language-server \
  @olrtg/emmet-language-server
```

### Quick Install (brew)

```bash
brew install lua-language-server llvm
```

### Quick Install (go)

```bash
go install golang.org/x/tools/gopls@latest
```

### Quick Install (cargo)

```bash
cargo install --locked markdown-oxide
cargo install --locked harper-ls
```

---

## Formatters

Formatters are used by conform.nvim for code formatting.

| Formatter | Languages | Installation |
|-----------|-----------|--------------|
| `stylua` | Lua | `cargo install stylua` or `brew install stylua` |
| `goimports` | Go | `go install golang.org/x/tools/cmd/goimports@latest` |
| `gofumpt` | Go | `go install mvdan.cc/gofumpt@latest` |
| `prettier` | JS/TS/HTML/CSS/JSON/YAML/MD | `npm install -g prettier` |
| `biome` | JS/TS/JSON/CSS | `npm install -g @biomejs/biome` |
| `shfmt` | Shell | `brew install shfmt` or `go install mvdan.cc/sh/v3/cmd/shfmt@latest` |
| `clang-format` | C/C++ | `brew install clang-format` or via LLVM |
| `yamlfmt` | YAML | `go install github.com/google/yamlfmt/cmd/yamlfmt@latest` |
| `dockerfmt` | Dockerfile | `brew install dockerfmt` |
| `markdownlint-cli2` | Markdown | `npm install -g markdownlint-cli2` |
| `tombi` | TOML | `cargo install --locked tombi-cli` |

### Quick Install (npm)

```bash
npm install -g prettier @biomejs/biome markdownlint-cli2
```

### Quick Install (brew)

```bash
brew install stylua shfmt clang-format dockerfmt
```

### Quick Install (go)

```bash
go install golang.org/x/tools/cmd/goimports@latest
go install mvdan.cc/gofumpt@latest
go install mvdan.cc/sh/v3/cmd/shfmt@latest
go install github.com/google/yamlfmt/cmd/yamlfmt@latest
```

### Quick Install (cargo)

```bash
cargo install stylua
cargo install --locked tombi-cli
```

---

## Linters

Linters are used by nvim-lint for code analysis (triggered with `<leader>ll`).

| Linter | Languages | Installation |
|--------|-----------|--------------|
| `eslint_d` | JavaScript/TypeScript | `npm install -g eslint_d` |
| `luacheck` | Lua | `brew install luacheck` or `luarocks install luacheck` |
| `golangci-lint` | Go | `brew install golangci-lint` or see [docs](https://golangci-lint.run/welcome/install/) |
| `shellcheck` | Shell | `brew install shellcheck` |
| `cppcheck` | C/C++ | `brew install cppcheck` |
| `hadolint` | Dockerfile | `brew install hadolint` |
| `yamllint` | YAML | `pip install yamllint` or `brew install yamllint` |
| `jsonlint` | JSON | `npm install -g jsonlint` |
| `htmlhint` | HTML | `npm install -g htmlhint` |
| `stylelint` | CSS/SCSS | `npm install -g stylelint` |
| `markdownlint-cli2` | Markdown | `npm install -g markdownlint-cli2` |
| `buf` | Protobuf | `brew install bufbuild/buf/buf` |
| `tombi` | TOML | `cargo install --locked tombi-cli` |

### Quick Install (npm)

```bash
npm install -g eslint_d jsonlint htmlhint stylelint markdownlint-cli2
```

### Quick Install (brew)

```bash
brew install luacheck golangci-lint shellcheck cppcheck hadolint yamllint bufbuild/buf/buf
```

### Quick Install (pip)

```bash
pip install yamllint
```

---

## All-in-One Install Scripts

### macOS (Homebrew + npm + go + cargo)

```bash
# Homebrew packages
brew install \
  lua-language-server \
  llvm \
  stylua \
  shfmt \
  clang-format \
  dockerfmt \
  luacheck \
  golangci-lint \
  shellcheck \
  cppcheck \
  hadolint \
  yamllint \
  bufbuild/buf/buf

# npm packages
npm install -g \
  typescript-language-server typescript \
  bash-language-server \
  vscode-langservers-extracted \
  yaml-language-server \
  dockerfile-language-server-nodejs \
  @tailwindcss/language-server \
  @olrtg/emmet-language-server \
  prettier \
  @biomejs/biome \
  eslint_d \
  jsonlint \
  htmlhint \
  stylelint \
  markdownlint-cli2

# Go packages
go install golang.org/x/tools/gopls@latest
go install golang.org/x/tools/cmd/goimports@latest
go install mvdan.cc/gofumpt@latest
go install mvdan.cc/sh/v3/cmd/shfmt@latest
go install github.com/google/yamlfmt/cmd/yamlfmt@latest

# Cargo packages
cargo install --locked markdown-oxide
cargo install --locked tombi-cli
cargo install --locked harper-ls
```

### Linux (apt-based + npm + go + cargo)

```bash
# System packages (Ubuntu/Debian)
sudo apt update && sudo apt install -y \
  clangd \
  clang-format \
  shellcheck \
  cppcheck \
  hadolint

# Install lua-language-server (manual)
# See: https://github.com/LuaLS/lua-language-server/releases

# npm packages (same as macOS)
npm install -g \
  typescript-language-server typescript \
  bash-language-server \
  vscode-langservers-extracted \
  yaml-language-server \
  dockerfile-language-server-nodejs \
  @tailwindcss/language-server \
  @olrtg/emmet-language-server \
  prettier \
  @biomejs/biome \
  eslint_d \
  jsonlint \
  htmlhint \
  stylelint \
  markdownlint-cli2

# Go packages (same as macOS)
go install golang.org/x/tools/gopls@latest
go install golang.org/x/tools/cmd/goimports@latest
go install mvdan.cc/gofumpt@latest
go install mvdan.cc/sh/v3/cmd/shfmt@latest
go install github.com/google/yamlfmt/cmd/yamlfmt@latest

# Cargo packages (same as macOS)
cargo install stylua
cargo install --locked markdown-oxide
cargo install --locked tombi-cli
cargo install --locked harper-ls

# pip packages
pip install --user yamllint

# golangci-lint (see official docs for latest)
curl -sSfL https://raw.githubusercontent.com/golangci/golangci-lint/master/install.sh | sh -s -- -b $(go env GOPATH)/bin
```

---

## Verification

After installation, verify tools are available:

```bash
# Language servers
lua-language-server --version
gopls version
typescript-language-server --version
bash-language-server --version
vscode-css-language-server --version
yaml-language-server --version
markdown-oxide --version
docker-langserver --version
clangd --version
tailwindcss-language-server --version
emmet-language-server --version
harper-ls --version

# Formatters
stylua --version
goimports -h
gofumpt --version
prettier --version
biome --version
shfmt --version
clang-format --version
yamlfmt --version
dockerfmt --version
markdownlint-cli2 --version
tombi --version

# Linters
eslint_d --version
luacheck --version
golangci-lint --version
shellcheck --version
cppcheck --version
hadolint --version
yamllint --version
jsonlint --version
htmlhint --version
stylelint --version
buf --version
```

---

## Notes

- **Neovim 0.11+**: This config uses Neovim's native LSP support with `vim.lsp.config()` and `vim.lsp.enable()`.
- **nvim-lspconfig**: Provides base LSP configurations in `lsp/*.lua` files.
- **after/lsp/*.lua**: Your custom LSP overrides (merged with higher priority).
- **Mason is NOT required**: All tools should be installed globally as documented above.
- **Formatters**: Managed by `conform.nvim` - format on save is enabled.
- **Linters**: Managed by `nvim-lint` - trigger manually with `<leader>ll`.
