# Neovim

My custom neovim config

## My System Setup
- **OS**: Linux (WSL)
- **Shell**: zsh with oh-my-zsh, theme oh-my-posh
- **Package Managers**: 
  1. Homebrew (preferred)
  2. apt (fallback)

## Language Servers

Following language servers are configured, make sure they are installed and binaries are available in PATH.

```lua
local servers = {
	"clangd", -- C/C++ language server
	"cssls", -- CSS language server
	"html", -- HTML language server
	"lua_ls", -- Lua language server
	-- "gopls",      -- Go language server managed by go.nvim will be installed automatically on initial setup
	"ts_ls",    -- TypeScript/JavaScript language server
	"tailwindcss", -- Tailwind CSS language server
}
```

All language servers are configured with nvim lspconfig with default settings. You can add additional settings by creating a file in `after/lsp/<server_name>.lua` with your settings.


### Formatters and Linters
- biome

### Go
- gofumpt
- goimports

### Shell
- shfmt
- shellcheck

### Docker
- hadolint

### YAML
- yamllint

### C/C++
- clangd
- clang-format
- cppcheck
- build-essential
