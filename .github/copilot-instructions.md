# Copilot Custom Instructions

Neovim 0.11+ config. When changing keymaps, update `docs/keymaps.md`, if any external installation is required update `docs/install.md`

## Quirks & Non-Obvious Patterns

### Tooling Quirks
- **Biome** runs as LSP (not linter) - only activates when `biome.json`/`biome.jsonc` exists
- **Linting is manual** via `<leader>ll` - not automatic on save (nvim-lint)
- **Formatting is automatic** on save (conform.nvim)
- **JS/TS formatting**: Biome if config exists, else Prettier (stop_after_first)
- **golangci-lint v2+** uses new output format flags (`--output.json.path`)

### LSP Setup (Neovim 0.11+)
- Uses native `vim.lsp.config()` and `vim.lsp.enable()` - NOT old lspconfig setup()
- LSP overrides go in `after/lsp/<server_name>.lua` (merged with nvim-lspconfig defaults)

### Plugin Patterns
- Plugin specs return tables (lazy.nvim format)
- Use `vim.keymap.set()` with `desc` for keymaps to support which-key integration
- Use `vim.notify()` for notifications (snacks.nvim handles display)
- Filetype settings in `after/ftplugin/<filetype>.lua`
- Prefer to use the `opts` table for plugin configuration when possible for lazy.nvim

### Keybinding Prefixes
These prefixes are only trial convention, not strictly enforced yet
- `<leader>f` - Find/files
- `<leader>g` - Git
- `<leader>c` - Code/LSP
- `<leader>s` - Search
- `<leader>x` - Trouble
- `<leader>u` - Toggle UI options

### Excluded from Search/Format
- `*.pb.go`, `*.pb.gw.go`, `*.pb.validate.go`, `*.swagger.json` (generated)
- `node_modules/`, `.git/`

### Lua Style (stylua)
- Double quotes, 100 col width, always use call parentheses
