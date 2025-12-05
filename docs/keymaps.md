# Neovim Keyboard Shortcuts

> **Leader Key:** `<Space>`

## General

| Keymap | Mode | Description |
|--------|------|-------------|
| `<leader>rc` | n | Source current file |
| `<leader>x` | n | Execute current line as Lua |
| `<leader>x` | v | Execute selection as Lua |
| `<Esc>` | n | Clear search highlights & close LSP hover |
| `<Esc><Esc>` | t | Exit terminal mode |
| `<leader>?` | n | Buffer Local Keymaps (which-key) |

---

## Movement & Editing

| Keymap | Mode | Description |
|--------|------|-------------|
| `<leader>j` | n | Move line down |
| `<leader>k` | n | Move line up |
| `<leader>j` | v | Move selection down |
| `<leader>k` | v | Move selection up |
| `d` | n, x | Delete without copying to clipboard |
| `dd` | n | Delete line without copying to clipboard |
| `D` | n, x | Delete to end of line without copying |

---

## Quickfix & Location List

| Keymap | Mode | Description |
|--------|------|-------------|
| `<M-j>` | n | Next quickfix item |
| `<M-k>` | n | Previous quickfix item |
| `<M-q>` | n | Open quickfix list |
| `<leader>q` | n | Open diagnostic quickfix list |

---

## Windows & Navigation

| Keymap | Mode | Description |
|--------|------|-------------|
| `<C-w>f` | n | Focus floating window |
| `-` | n | Open parent directory in Oil (float) |

---

## Diagnostics

| Keymap | Mode | Description |
|--------|------|-------------|
| `[e` | n | Go to previous diagnostic message |
| `]e` | n | Go to next diagnostic message |
| `<leader>de` | n | Show diagnostic error messages (float) |
| `<leader>dy` | n | Yank diagnostic message to clipboard |

---

## Terminal

| Keymap | Mode | Description |
|--------|------|-------------|
| `<leader>to` | n | Open terminal in horizontal split |
| `<c-/>` | n | Toggle Snacks Terminal |
| `<c-_>` | n | Toggle Snacks Terminal (alias) |

---

## LSP

| Keymap | Mode | Description |
|--------|------|-------------|
| `K` | n | Hover Documentation |
| `gd` | n | Goto Definition (Snacks picker) |
| `gD` | n | Goto Declaration (Snacks picker) |
| `gi` | n | Goto Implementation (Snacks picker) |
| `grn` | n | Rename symbol |
| `gra` | n, x | Code Action (native LSP) |
| `grp` | n | Find References (Snacks picker) |
| `grt` | n | Goto Type Definition (Snacks picker) |
| `<leader>ca` | n, x | Code Action (tiny-code-action) |
| `<leader>ci` | n | Show incoming calls |
| `<leader>co` | n | Show outgoing calls |
| `<leader>cR` | n | Rename File (Snacks) |
| `<leader>th` | n | Toggle Inlay Hints |

---

## Snacks

### Pickers & Search

| Keymap | Mode | Description |
|--------|------|-------------|
| `<leader><leader>` | n | Smart Find Files |
| `<leader>ff` | n | Find Files |
| `<leader>fa` | n | Find All (Grep) |
| `<leader>fv` | n, x | Visual selection or word grep |
| `<leader>fp` | n | Projects |
| `<leader>fr` | n | Recent files |
| `<leader>fn` | n, t | Next Reference (words jump) |
| `<leader>fN` | n, t | Previous Reference (words jump) |
| `<leader>jk` | n | Buffers picker |
| `<leader>nc` | n | Nvim Config files |
| `<leader>:` | n | Command History |
| `<M-S-k>` | n | Keymaps picker |
| `<M-e>` | n | File Explorer |

## Snacks - Search Namespace (`<leader>s`)

| Keymap | Mode | Description |
|--------|------|-------------|
| `<leader>s"` | n | Registers |
| `<leader>s/` | n | Search History |
| `<leader>sa` | n | Autocmds |
| `<leader>sC` | n | Commands |
| `<leader>sD` | n | Diagnostics (all) |
| `<leader>sd` | n | Buffer Diagnostics |
| `<leader>sf` | n | LSP Symbols |
| `<leader>sS` | n | LSP Workspace Symbols |
| `<leader>sh` | n | Help Pages |
| `<leader>sH` | n | Highlights |
| `<leader>sj` | n | Jumps |
| `<leader>sl` | n | Location List |
| `<leader>sm` | n | Marks |
| `<leader>sM` | n | Man Pages |
| `<leader>sp` | n | Plugin Spec (Lazy) |
| `<leader>sq` | n | Quickfix List |
| `<leader>sR` | n | Resume last picker |
| `<leader>su` | n | Undo History |

### UI & Utility

| Keymap | Mode | Description |
|--------|------|-------------|
| `<leader>z` | n | Toggle Zen Mode |
| `<leader>Z` | n | Toggle Zoom |
| `<leader>.` | n | Toggle Scratch Buffer |
| `<leader>S` | n | Select Scratch Buffer |
| `<leader>nh` | n | Notification History |
| `<leader>N` | n | Neovim News |
| `<leader>bd` | n | Delete Buffer |
| `<leader>ii` | n | Icons picker |
| `<leader>uC` | n | Colorschemes |


### Snacks Toggle Mappings

| Keymap | Mode | Description |
|--------|------|-------------|
| `<leader>us` | n | Toggle Spelling |
| `<leader>uw` | n | Toggle Wrap |
| `<leader>uL` | n | Toggle Relative Number |
| `<leader>ud` | n | Toggle Diagnostics |
| `<leader>ul` | n | Toggle Line Number |
| `<leader>uc` | n | Toggle Conceal Level |
| `<leader>uT` | n | Toggle Treesitter |
| `<leader>ub` | n | Toggle Dark Background |
| `<leader>uh` | n | Toggle Inlay Hints |
| `<leader>ug` | n | Toggle Indent guides |
| `<leader>uD` | n | Toggle Dim |
| `<leader>un` | n | Dismiss All Notifications |

### Snacks Picker Window Keys

| Keymap | Mode | Description |
|--------|------|-------------|
| `<Esc>` | n, i | Close picker |
| `<M-p>` | n, i | Cycle layouts |
| `J` | n, i | Preview scroll down |
| `K` | n, i | Preview scroll up |
| `H` | n, i | Preview scroll left |
| `L` | n, i | Preview scroll right |
| `<a-a>` | n, i | Sidekick send (explorer) |

---

## Git (Gitsigns)

| Keymap | Mode | Description |
|--------|------|-------------|
| `[g` | n | Previous hunk |
| `]g` | n | Next hunk |
| `<leader>gb` | n | Git blame line |
| `<leader>gB` | n | Git blame buffer |
| `<leader>gtb` | n | Toggle line blame |
| `<leader>gP` | n | Preview Hunk (popup) |
| `<leader>gp` | n | Preview Hunk (inline) |
| `<leader>gr` | n | Reset Hunk |
| `<leader>gR` | n | Reset Buffer |
| `<leader>ga` | n | Stage Hunk |
| `<leader>gu` | n | Undo Stage Hunk |
| `<leader>gtb` | n | Toggle blame mode |
| `<leader>gA` | n | Stage Buffer |

---

## Git (Snacks)

| Keymap | Mode | Description |
|--------|------|-------------|
| `<leader>gl` | n | Git Log |
| `<leader>gL` | n | Git Log Line |
| `<leader>gf` | n | Git Log File |
| `<leader>gd` | n | Git Diff Hunks |
| `<leader>gS` | n | Git Stash |
| `<leader>go` | n, v | Git Browse (open in browser) |
| `<leader>gg` | n | Lazygit |
| `<leader>gD` | n | Diff HEAD (gitsigns) |

---

## Diffview

| Keymap | Mode | Description |
|--------|------|-------------|
| `<leader>dv` | n | Open Diffview |
| `<leader>dc` | n | Close Diffview |
| `<leader>Df` | n | File History (all files) |
| `<leader>D.` | n | Current File History |
| `<leader>DF` | n | Toggle Files Panel |
| `<leader>Gm` | n | Compare with origin/main |
| `<leader>GM` | n | Compare with specific branch |

### Diffview File Panel Keys

| Keymap | Mode | Description |
|--------|------|-------------|
| `<tab>` | n | Toggle stage entry |
| `<cr>` | n | Go to edit file |

---

## Neogit

| Keymap | Mode | Description |
|--------|------|-------------|
| `<leader>gn` | n | Open Neogit |
| `<leader>gc` | n | Neogit commit |

---

## Harpoon

| Keymap | Mode | Description |
|--------|------|-------------|
| `<leader>H` | n | Add file to Harpoon |
| `<leader>hh` | n | Harpoon Quick Menu |
| `<leader>h1` - `<leader>h9` | n | Jump to Harpoon file 1-9 |

---

## Formatting & Linting

| Keymap | Mode | Description |
|--------|------|-------------|
| `<leader>fb` | all | Format Buffer (conform) |
| `<leader>ll` | n | Trigger linting |
| `<leader>lk` | n | Show available linters |

---

## Treesitter

### Incremental Selection

| Keymap | Mode | Description |
|--------|------|-------------|
| `<leader>ss` | n | Init selection |
| `<leader>si` | n | Node incremental |
| `<leader>sc` | n | Scope incremental |
| `<leader>sd` | n | Node decremental |

### Text Objects Swap

| Keymap | Mode | Description |
|--------|------|-------------|
| `<leader>a` | n | Swap next parameter |
| `<leader>A` | n | Swap previous parameter |

### Text Objects Movement

| Keymap | Mode | Description |
|--------|------|-------------|
| `]m` | n | Next function start |
| `]M` | n | Next function end |
| `[m` | n | Previous function start |
| `[M` | n | Previous function end |
| `]c` | n | Next class start |
| `]C` | n | Next class end |
| `[c` | n | Previous class start |
| `[C` | n | Previous class end |
| `]o` | n | Next loop |
| `]s` | n | Next scope |
| `]z` | n | Next fold |
| `]d` | n | Next conditional |
| `[d` | n | Previous conditional |

### Text Objects Selection

| Keymap | Mode | Description |
|--------|------|-------------|
| `af` | o, x | Around function |
| `if` | o, x | Inside function |
| `ac` | o, x | Around class |
| `ic` | o, x | Inside class |
| `as` | o, x | Around scope |

---

## Clipboard (Neoclip)

| Keymap | Mode | Description |
|--------|------|-------------|
| `<leader>y` | n | Open Neoclip (Clipboard History) |

---

## CamelCase Motion

Uses `<leader>` as prefix for CamelCase/snake_case word motions:

| Keymap | Mode | Description |
|--------|------|-------------|
| `<leader>w` | n | Next camelCase/snake_case word |
| `<leader>b` | n | Previous camelCase/snake_case word |
| `<leader>e` | n | End of camelCase/snake_case word |

---

## AI / Sidekick (Disabled)

> Note: Sidekick plugin is currently disabled (`enabled = false`)

| Keymap | Mode | Description |
|--------|------|-------------|
| `<tab>` | n | Goto/Apply Next Edit Suggestion |
| `<c-.>` | n, t, i, x | Sidekick Toggle |
| `<leader>aa` | n | Sidekick Toggle CLI |
| `<leader>as` | n | Select CLI |
| `<leader>ad` | n | Detach CLI Session |
| `<leader>at` | n, x | Send This |
| `<leader>af` | n | Send File |
| `<leader>av` | x | Send Visual Selection |
| `<leader>ap` | n, x | Sidekick Select Prompt |
| `<leader>ac` | n | Toggle Claude |

---

## Tabout

| Keymap | Mode | Description |
|--------|------|-------------|
| `<Tab>` | i | Tab out of brackets/quotes |
| `<S-Tab>` | i | Tab backwards out of brackets/quotes |

---

## Blink Completion

Uses `super-tab` preset:
| Keymap | Mode | Description |
|--------|------|-------------|
| `<Tab>` | i | Accept completion / Next snippet placeholder |
| `<S-Tab>` | i | Previous snippet placeholder |

---

## Mini.nvim

### Mini.surround (Default Mappings)

| Keymap | Mode | Description |
|--------|------|-------------|
| `sa` | n, x | Add surrounding |
| `sd` | n | Delete surrounding |
| `sf` | n | Find surrounding (right) |
| `sF` | n | Find surrounding (left) |
| `sh` | n | Highlight surrounding |
| `sr` | n | Replace surrounding |
| `sn` | n | Update n_lines |

### Mini.operators (Default Mappings)

| Keymap | Mode | Description |
|--------|------|-------------|
| `g=` | n, x | Evaluate |
| `gx` | n, x | Exchange |
| `gm` | n, x | Multiply |
| `gs` | n, x | Sort |
