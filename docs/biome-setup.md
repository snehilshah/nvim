# Biome Configuration for JavaScript/TypeScript

This Neovim configuration uses [Biome](https://biomejs.dev/) as the primary linter and formatter for JavaScript/TypeScript files, replacing ESLint and Prettier.

## What Changed

### Linting (`lua/config/plugins/linting.lua`)
- **JavaScript/TypeScript**: Changed from `eslint_d` to `biome`
- **JSON**: Changed from `jsonlint` to `biome` (added `jsonc` support)
- **Other languages**: Unchanged (Go, C/C++, Shell, etc.)

### Formatting (`lua/config/plugins/formatter.lua`)
- **JavaScript/TypeScript**: Changed from `prettierd`/`prettier` to `biome`
- **JSON**: Changed from `prettier` to `biome` (added `jsonc` support)
- **Other languages**: Unchanged (CSS, HTML, YAML still use Prettier)

## Setup for Projects

1. **Install Biome** in your project:
   ```bash
   npm install --save-dev @biomejs/biome
   # or
   yarn add --dev @biomejs/biome
   # or
   pnpm add --save-dev @biomejs/biome
   ```

2. **Add biome.json** configuration to your project root:
   - Copy the example from `docs/biome.json.example`
   - Customize rules as needed

3. **Optional**: Add scripts to package.json:
   ```json
   {
     "scripts": {
       "lint": "biome lint .",
       "format": "biome format . --write",
       "check": "biome check . --apply"
     }
   }
   ```

## Benefits of Biome

- **Fast**: Written in Rust, significantly faster than ESLint/Prettier
- **All-in-one**: Combines linting and formatting in a single tool
- **Compatible**: Supports most ESLint and Prettier configurations
- **TypeScript native**: Excellent TypeScript support out of the box
- **Zero config**: Works well with sensible defaults

## File Types Supported

- JavaScript (`.js`, `.jsx`)
- TypeScript (`.ts`, `.tsx`)
- JSON (`.json`, `.jsonc`)

## Keybindings

- `<leader>af`: Format current buffer
- `<leader>ll`: Run linter on current file
- `<leader>li`: Show available linters for current file type

## Migration Notes

- Existing ESLint and Prettier configurations can be migrated to Biome
- Some ESLint rules may not have direct equivalents in Biome
- Check [Biome documentation](https://biomejs.dev/guides/migrate-eslint-prettier/) for migration guides