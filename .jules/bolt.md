## 2024-05-18 - [Optimizing LSP Autocmds in Neovim]
**Learning:** In Neovim configurations, placing function declarations (`setup_keymaps`) and `vim.api.nvim_create_augroup` inside the plugin's `config` callback causes them to be re-evaluated every time the config is loaded. Moving them out avoids unnecessary allocations.
**Action:** Extract nested helper functions and augroup creations to module scope whenever possible.

## 2024-05-18 - [Optimizing biome-check formatter]
**Learning:** Found an un-cached file system lookup for `biome.json` in `lua/plugins/formatter.lua` during the `condition` evaluation of the `biome-check` formatter. Since `condition` is called on every write (or whenever formatting is requested), traversing the file system upward for every single format operation introduces disk I/O overhead that can slow down saving files significantly on large monorepos. Memory tells me a per-directory cache for `biome.json` searches is expected here.
**Action:** Implement per-directory caching for the `biome.json`/`biome.jsonc` lookup in the formatter condition.

## 2024-05-18 - [Optimizing condition checks in formater]
**Learning:** Found an un-cached file system lookup for `biome.json` in `lua/plugins/formatter.lua` during the `condition` evaluation of the `biome-check` formatter. Since `condition` is called on every write (or whenever formatting is requested), traversing the file system upward for every single format operation introduces disk I/O overhead that can slow down saving files significantly on large monorepos.
**Action:** Implement per-directory caching for the `biome.json`/`biome.jsonc` lookup in the formatter condition.
