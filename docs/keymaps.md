# Neovim Keyboard Shortcuts

> **Leader Key:** `<Space>`

## ⚠️ Overlapping Keymaps

The following keymaps are defined multiple times across your configuration:

| Keymap | Conflict | Files |
|--------|----------|-------|
| `<leader>gb` | Git Blame Line (gitsigns) **vs** Git Branches (snacks) | `git.lua`, `snacks.lua` |
| `<leader>gs` | Stage Hunk (gitsigns) **vs** Git Status (snacks) | `git.lua` (defined twice!) |
| `<leader>n` | Notification History (defined twice in snacks) | `snacks.lua` |
| `<leader>sb` | Buffer Lines (snacks - defined twice) | `snacks.lua` |
| `<leader>fb` | Format Buffer (conform) **vs** Grep Buffers (commented, snacks) | `formatter.lua`, `snacks.lua` |

---

<table>
<tr>
<td valign="top" width="50%">

## General

| Keymap | Mode | Description |
|--------|------|-------------|
| `<leader>rc` | n | Source current file |
| `<leader>x` | n | Execute current line as Lua |
| `<leader>x` | v | Execute selection as Lua |
| `<Esc>` | n | Clear search highlights & close LSP hover |
| `<Esc><Esc>` | t | Exit terminal mode |
| `<leader>?` | n | Buffer Local Keymaps (which-key) |

## Movement & Editing

| Keymap | Mode | Description |
|--------|------|-------------|
| `<leader>j` | n | Move line down |
| `<leader>k` | n | Move line up |
| `<leader>j` | v | Move selection down |
| `<leader>k` | v | Move selection up |
| `d` | n, x | Delete without copying to clipboard |
| `dd` | n | Delete line without copying |
| `D` | n, x | Delete to EOL without copying |

## Quickfix & Location List

| Keymap | Mode | Description |
|--------|------|-------------|
| `<M-j>` | n | Next quickfix item |
| `<M-k>` | n | Previous quickfix item |
| `<M-q>` | n | Open quickfix list |
| `<leader>q` | n | Open diagnostic quickfix list |

## Windows & Navigation

| Keymap | Mode | Description |
|--------|------|-------------|
| `<C-w>f` | n | Focus floating window |
| `-` | n | Open parent directory in Oil |

## Diagnostics

| Keymap | Mode | Description |
|--------|------|-------------|
| `[e` | n | Go to previous diagnostic |
| `]e` | n | Go to next diagnostic |
| `<leader>de` | n | Show diagnostic (float) |
| `<leader>dy` | n | Yank diagnostic to clipboard |

## Terminal

| Keymap | Mode | Description |
|--------|------|-------------|
| `<leader>to` | n | Open terminal in split |
| `<c-/>` | n | Toggle Snacks Terminal |
| `<c-_>` | n | Toggle Snacks Terminal (alias) |

</td>
<td valign="top" width="50%">

## LSP

| Keymap | Mode | Description |
|--------|------|-------------|
| `K` | n | Hover Documentation |
| `gd` | n | Goto Definition |
| `gD` | n | Goto Declaration |
| `gi` | n | Goto Implementation |
| `grn` | n | Rename symbol |
| `gra` | n, x | Code Action (native LSP) |
| `grp` | n | Find References |
| `grt` | n | Goto Type Definition |
| `<leader>ca` | n, x | Code Action (tiny-code-action) |
| `<leader>ci` | n | Show incoming calls |
| `<leader>co` | n | Show outgoing calls |
| `<leader>cR` | n | Rename File (Snacks) |
| `<leader>th` | n | Toggle Inlay Hints |

## Harpoon

| Keymap | Mode | Description |
|--------|------|-------------|
| `<leader>H` | n | Add file to Harpoon |
| `<leader>hh` | n | Harpoon Quick Menu |
| `<leader>h1`-`h9` | n | Jump to Harpoon file 1-9 |

## Formatting & Linting

| Keymap | Mode | Description |
|--------|------|-------------|
| `<leader>fb` | all | Format Buffer (conform) |
| `<leader>ll` | n | Trigger linting |
| `<leader>lk` | n | Show available linters |

## Clipboard (Neoclip)

| Keymap | Mode | Description |
|--------|------|-------------|
| `<leader>y` | n | Open Clipboard History |

## CamelCase Motion

| Keymap | Mode | Description |
|--------|------|-------------|
| `<leader>w` | n | Next camelCase word |
| `<leader>b` | n | Previous camelCase word |
| `<leader>e` | n | End of camelCase word |

</td>
</tr>
</table>

---

<table>
<tr>
<td valign="top" width="50%">

## Snacks - Pickers & Search

| Keymap | Mode | Description |
|--------|------|-------------|
| `<leader><leader>` | n | Smart Find Files |
| `<leader>ff` | n | Find Files |
| `<leader>fa` | n | Find All (Grep) |
| `<leader>fl` | n | Buffer Lines |
| `<leader>fv` | n, x | Visual selection or word grep |
| `<leader>fp` | n | Projects |
| `<leader>fr` | n | Recent files |
| `<leader>fn` | n, t | Next Reference (words jump) |
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
| `<leader>sb` | n | Buffer Lines |
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

</td>
<td valign="top" width="50%">

## Snacks - UI & Utility

| Keymap | Mode | Description |
|--------|------|-------------|
| `<leader>z` | n | Toggle Zen Mode |
| `<leader>Z` | n | Toggle Zoom |
| `<leader>.` | n | Toggle Scratch Buffer |
| `<leader>S` | n | Select Scratch Buffer |
| `<leader>n` | n | Notification History |
| `<leader>N` | n | Neovim News |
| `<leader>bd` | n | Delete Buffer |
| `<leader>ii` | n | Icons picker |
| `<leader>uC` | n | Colorschemes |
| `[[` | n, t | Previous Reference (words jump) |

## Snacks - Toggle Mappings (`<leader>u`)

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

## Snacks - Picker Window Keys

| Keymap | Mode | Description |
|--------|------|-------------|
| `<Esc>` | n, i | Close picker |
| `<M-p>` | n, i | Cycle layouts |
| `J` | n, i | Preview scroll down |
| `K` | n, i | Preview scroll up |
| `H` | n, i | Preview scroll left |
| `L` | n, i | Preview scroll right |
| `<a-a>` | n, i | Sidekick send (explorer) |

</td>
</tr>
</table>

---

<table>
<tr>
<td valign="top" width="50%">

## Git (Gitsigns)

| Keymap | Mode | Description |
|--------|------|-------------|
| `[g` | n | Previous hunk |
| `]g` | n | Next hunk |
| `<leader>gb` | n | ⚠️ Git blame line |
| `<leader>gB` | n | Git blame buffer |
| `<leader>gt` | n | Toggle line blame |
| `<leader>gP` | n | Preview Hunk (popup) |
| `<leader>gp` | n | Preview Hunk (inline) |
| `<leader>gr` | n | Reset Hunk |
| `<leader>gR` | n | Reset Buffer |
| `<leader>gs` | n | ⚠️ Stage Hunk |
| `<leader>gu` | n | Undo Stage Hunk |
| `<leader>GB` | n | Toggle blame mode |
| `<leader>GS` | n | Stage Buffer |

## Git (Snacks)

| Keymap | Mode | Description |
|--------|------|-------------|
| `<leader>gb` | n | ⚠️ Git Branches |
| `<leader>gl` | n | Git Log |
| `<leader>gL` | n | Git Log Line |
| `<leader>gf` | n | Git Log File |
| `<leader>gs` | n | ⚠️ Git Status |
| `<leader>gd` | n | Git Diff Hunks |
| `<leader>gS` | n | Git Stash |
| `<leader>go` | n, v | Git Browse (open in browser) |
| `<leader>gg` | n | Lazygit |
| `<leader>Gd` | n | Diff HEAD (gitsigns) |

## Neogit

| Keymap | Mode | Description |
|--------|------|-------------|
| `<leader>gn` | n | Open Neogit |
| `<leader>gc` | n | Neogit commit |

</td>
<td valign="top" width="50%">

## Diffview

| Keymap | Mode | Description |
|--------|------|-------------|
| `<leader>Dv` | n | Open Diffview |
| `<leader>Dc` | n | Close Diffview |
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

</td>
</tr>
</table>

---

<table>
<tr>
<td valign="top" width="50%">

## Treesitter - Incremental Selection

| Keymap | Mode | Description |
|--------|------|-------------|
| `<leader>ss` | n | Init selection |
| `<leader>si` | n | Node incremental |
| `<leader>sc` | n | Scope incremental |
| `<leader>sd` | n | Node decremental |

## Treesitter - Text Objects Swap

| Keymap | Mode | Description |
|--------|------|-------------|
| `<leader>a` | n | Swap next parameter |
| `<leader>A` | n | Swap previous parameter |

## Treesitter - Text Objects Selection

| Keymap | Mode | Description |
|--------|------|-------------|
| `af` | o, x | Around function |
| `if` | o, x | Inside function |
| `ac` | o, x | Around class |
| `ic` | o, x | Inside class |
| `as` | o, x | Around scope |

</td>
<td valign="top" width="50%">

## Treesitter - Text Objects Movement

| Keymap | Mode | Description |
|--------|------|-------------|
| `]m` | n | Next function start |
| `]M` | n | Next function end |
| `[m` | n | Previous function start |
| `[M` | n | Previous function end |
| `]]` | n | Next class start |
| `][` | n | Next class end |
| `[[` | n | Previous class start |
| `[]` | n | Previous class end |
| `]o` | n | Next loop |
| `]s` | n | Next scope |
| `]z` | n | Next fold |
| `]d` | n | Next conditional |
| `[d` | n | Previous conditional |

</td>
</tr>
</table>

---

<table>
<tr>
<td valign="top" width="50%">

## Mini.surround

| Keymap | Mode | Description |
|--------|------|-------------|
| `sa` | n, x | Add surrounding |
| `sd` | n | Delete surrounding |
| `sf` | n | Find surrounding (right) |
| `sF` | n | Find surrounding (left) |
| `sh` | n | Highlight surrounding |
| `sr` | n | Replace surrounding |
| `sn` | n | Update n_lines |

## Mini.operators

| Keymap | Mode | Description |
|--------|------|-------------|
| `g=` | n, x | Evaluate |
| `gx` | n, x | Exchange |
| `gm` | n, x | Multiply |
| `gs` | n, x | Sort |

## Tabout / Blink Completion

| Keymap | Mode | Description |
|--------|------|-------------|
| `<Tab>` | i | Tab out / Accept completion |
| `<S-Tab>` | i | Tab backwards / Prev snippet |

</td>
<td valign="top" width="50%">

## AI / Sidekick (Disabled)

> Note: Plugin is currently disabled

| Keymap | Mode | Description |
|--------|------|-------------|
| `<tab>` | n | Goto/Apply Next Edit |
| `<c-.>` | n, t, i, x | Sidekick Toggle |
| `<leader>aa` | n | Sidekick Toggle CLI |
| `<leader>as` | n | Select CLI |
| `<leader>ad` | n | Detach CLI Session |
| `<leader>at` | n, x | Send This |
| `<leader>af` | n | Send File |
| `<leader>av` | x | Send Visual Selection |
| `<leader>ap` | n, x | Sidekick Select Prompt |
| `<leader>ac` | n | Toggle Claude |

</td>
</tr>
</table>

---

## Summary of Conflicts to Resolve

1. **`<leader>gb`**: Choose between Git Blame (gitsigns) or Git Branches (snacks)
2. **`<leader>gs`**: Defined twice in `git.lua` - Stage Hunk and Git Status
3. **`<leader>n`**: Notification History defined twice in snacks
4. **`<leader>sb`**: Buffer Lines defined twice in snacks
5. **`[[`**: Conflict between Snacks words jump and Treesitter class navigation
