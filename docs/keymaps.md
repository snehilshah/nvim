# Neovim Keyboard Shortcuts

> **Leader Key:** `<Space>`

## Notes / Known Conflicts

- `<leader>cl` is used by Trouble (`Trouble lsp ...`) and will shadow the `<leader>cl` codelens mapping in `lua/config/keymaps.lua`.
- `<leader>sS` is used by both Snacks (LSP Workspace Symbols) and GrugFar (Search & Replace). With the current plugin import order, GrugFar is likely to win.
- `[d`/`]d` are Treesitter “conditional” motions globally, but become **LSP buffer-local** diagnostic jumps when an LSP client attaches.
- `<leader>bd` is used by both Snacks (delete buffer) and Barbar (order-by-directory). If you see unexpected behavior, this is why.

## General & Terminal

| Key | M | Desc | | Key | M | Desc |
|-----|---|------|-|-----|---|------|
| `<leader>rc` | n | Source current file | | `<c-/>` | n | Toggle Snacks Terminal |
| `<leader>x` | n | Execute line as Lua | | `<c-_>` | n | Toggle Terminal (alias) |
| `<leader>x` | v | Execute selection as Lua | | `<Esc><Esc>` | t | Exit terminal mode |
| `<leader>?` | n | Buffer Local Keymaps (which-key) | | `<C-w>f` | n | Focus floating window |
| `q` | n | Close certain special buffers (help/qf/etc) | | `<leader>cp` | n | Copy file path + line number |

## Editing & Navigation

| Key | M | Desc | | Key | M | Desc |
|-----|---|------|-|-----|---|------|
| `J` | v | Move selected lines down | | `<` | v | Indent left (stay selected) |
| `K` | v | Move selected lines up | | `>` | v | Indent right (stay selected) |
| `H` | n,x,o | Start of line | | `L` | n,x,o | End of line |
| `<Left>` | n | Previous buffer | | `<Right>` | n | Next buffer |
| `X` | n | Split line at cursor | | `<leader>ln` | v | Copy highlighted line numbers |

## Centered Search (keeps matches centered)

| Key | M | Desc | | Key | M | Desc |
|-----|---|------|-|-----|---|------|
| `n` | n | Next match (centered) | | `N` | n | Prev match (centered) |
| `*` | n | Search word (centered) | | `#` | n | Search word back (centered) |
| `g*` | n | Search partial (centered) | | `g#` | n | Search partial back (centered) |

## Clipboard / Delete

| Key | M | Desc | | Key | M | Desc |
|-----|---|------|-|-----|---|------|
| `d` | n,x | Delete without yanking | | `dd` | n | Delete line without yanking |
| `D` | n,x | Delete to EOL without yanking | | `<leader>y` | n | Neoclip (clipboard history) |

## Quickfix & Diagnostics

| Key | M | Desc | | Key | M | Desc |
|-----|---|------|-|-----|---|------|
| `<M-j>` | n | Next quickfix item | | `[e` | n | Previous diagnostic |
| `<M-k>` | n | Previous quickfix item | | `]e` | n | Next diagnostic |
| `<M-q>` | n | Open quickfix list | | `<leader>de` | n | Diagnostic float |
| `<leader>q` | n | Populate location list with diagnostics | | `<leader>dy` | n | Yank diagnostic message(s) on line |

## LSP (buffer-local on LspAttach unless noted)

| Key | M | Desc | | Key | M | Desc |
|-----|---|------|-|-----|---|------|
| `K` | n | Hover (rounded) | | `<C-k>` | n,i | Signature help (rounded) |
| `gd` | n | Goto Definition (Snacks) | | `gD` | n | Goto Declaration (Snacks) |
| `gi` | n | Goto Implementation (Snacks) | | `gt` | n | Goto Type Definition (Snacks) |
| `grp` | n | References (Snacks) | | `ga` | n,x | Code Action (native) |
| `<leader>rn` | n | Rename symbol | | `<leader>ca` | n,x | Code Action (tiny-code-action) |
| `[d` | n | Previous diagnostic (LSP buffer-local) | | `]d` | n | Next diagnostic (LSP buffer-local) |
| `<leader>cd` | n | Show diagnostic (LSP buffer-local) | | `<leader>ih` | n | Toggle inlay hints (LSP buffer-local) |
| `<leader>wa` | n | Add workspace folder | | `<leader>wr` | n | Remove workspace folder |
| `<leader>wl` | n | List workspace folders | | `<leader>cR` | n | Rename file (Snacks) |
| `<leader>ci` | n | Incoming calls (vim.lsp) | | `<leader>co` | n | Outgoing calls (vim.lsp) |
| `<leader>lc` | n | Incoming calls picker (Snacks) | | `<leader>lo` | n | Outgoing calls picker (Snacks) |

## Snacks Pickers

| Key | M | Desc | | Key | M | Desc |
|-----|---|------|-|-----|---|------|
| `<leader><leader>` | n | Smart Find Files | | `<leader>jk` | n | Buffers |
| `<leader>ff` | n | Find Files | | `<leader>nc` | n | Nvim Config files |
| `<leader>fa` | n | Find All (Grep) | | `<leader>:` | n | Command History |
| `<leader>fv` | n,x | Visual selection or word | | `<M-S-k>` | n | Keymaps picker |
| `<leader>fp` | n | Projects | | `<M-e>` | n | File Explorer |
| `<leader>fr` | n | Recent files | | `<leader>fn` | n,t | Next reference |
| `<leader>fN` | n,t | Prev reference | | | | |

## Snacks Search (`<leader>s`)

| Key | M | Desc | | Key | M | Desc |
|-----|---|------|-|-----|---|------|
| `<leader>s"` | n | Registers | | `<leader>sj` | n | Jumps |
| `<leader>s/` | n | Search History | | `<leader>sl` | n | Location List |
| `<leader>sa` | n | Autocmds | | `<leader>sm` | n | Marks |
| `<leader>sC` | n | Commands | | `<leader>sM` | n | Man Pages |
| `<leader>sD` | n | Diagnostics | | `<leader>sp` | n | Plugin Spec |
| `<leader>sd` | n | Buffer Diagnostics | | `<leader>sq` | n | Quickfix List |
| `<leader>sf` | n | LSP Symbols | | `<leader>sr` | n | Resume picker |
| `<leader>su` | n | Undo History | | `<leader>sH` | n | Highlights |
| `<leader>sS` | n | LSP Workspace Symbols (Snacks; conflicts) | | | | |

## Search & Replace (GrugFar)

| Key | M | Desc | | Key | M | Desc |
|-----|---|------|-|-----|---|------|
| `<leader>sS` | n,v | Search & Replace | | `<leader>sW` | n | Replace word under cursor |
| `<leader>sF` | n | Replace in current file | | `<leader>sv` | v | Replace visual selection |

## Snacks UI & Toggles

| Key | M | Desc | | Key | M | Desc |
|-----|---|------|-|-----|---|------|
| `<leader>z` | n | Toggle Zen | | `<leader>us` | n | Toggle Spelling |
| `<leader>Z` | n | Toggle Zoom | | `<leader>uw` | n | Toggle Wrap |
| `<leader>.` | n | Toggle Scratch | | `<leader>uL` | n | Toggle Relative Number |
| `<leader>S` | n | Select Scratch | | `<leader>ud` | n | Toggle Diagnostics |
| `<leader>nh` | n | Notification History | | `<leader>ul` | n | Toggle Line Number |
| `<leader>N` | n | Neovim News | | `<leader>uc` | n | Toggle Conceal |
| `<leader>bd` | n | Delete Buffer (Snacks; conflicts) | | `<leader>uT` | n | Toggle Treesitter |
| `<leader>ii` | n | Icons picker | | `<leader>ub` | n | Toggle Dark BG |
| `<leader>uC` | n | Colorschemes | | `<leader>uh` | n | Toggle Inlay Hints |
| `<leader>ug` | n | Toggle Indent | | `<leader>uD` | n | Toggle Dim |
| `<leader>un` | n | Dismiss Notifications | | `<leader>tw` | n,v | Toggle visual whitespace |

## Snacks Picker Window

| Key | M | Desc | | Key | M | Desc |
|-----|---|------|-|-----|---|------|
| `<Esc>` | n,i | Close picker | | `J` | n,i | Preview scroll down |
| `<M-p>` | n,i | Cycle layouts | | `K` | n,i | Preview scroll up |
| `H` | n,i | Preview scroll left | | `L` | n,i | Preview scroll right |
| `<a-a>` | n,i | Sidekick send (picker) | | `<c-t>` | n,i | Open in Trouble (picker) |

## Git (Gitsigns)

| Key | M | Desc | | Key | M | Desc |
|-----|---|------|-|-----|---|------|
| `[g` | n | Previous hunk | | `<leader>gr` | n | Reset hunk |
| `]g` | n | Next hunk | | `<leader>gR` | n | Reset buffer |
| `<leader>gb` | n | Blame line | | `<leader>ga` | n | Stage hunk |
| `<leader>gB` | n | Blame buffer | | `<leader>gu` | n | Undo stage hunk |
| `<leader>GB` | n | Toggle current-line blame | | `<leader>gA` | n | Stage buffer |
| `<leader>gP` | n | Preview hunk (popup) | | `<leader>gD` | n | Diff HEAD |
| `<leader>gp` | n | Preview hunk (inline) | | | | |

## Git (Snacks)

| Key | M | Desc | | Key | M | Desc |
|-----|---|------|-|-----|---|------|
| `<leader>gl` | n | Git Log | | `<leader>gS` | n | Git Stash |
| `<leader>gL` | n | Git Log Line | | `<leader>go` | n,v | Git Browse |
| `<leader>gf` | n | Git Log File | | `<leader>gg` | n | Lazygit |
| `<leader>gd` | n | Git Diff Hunks | | | | |

## Diffview

| Key | M | Desc | | Key | M | Desc |
|-----|---|------|-|-----|---|------|
| `<leader>dv` | n | Open Diffview | | `<leader>Df` | n | File History (all) |
| `<leader>dc` | n | Close Diffview | | `<leader>D.` | n | Current File History |
| `<leader>Gm` | n | Compare origin/main | | `<leader>DF` | n | Toggle Files Panel |
| `<leader>GM` | n | Compare branch | | `<tab>` | n | Toggle stage (panel) |
| `<cr>` | n | Go to file (panel) | | | | |

## Trouble

| Key | M | Desc | | Key | M | Desc |
|-----|---|------|-|-----|---|------|
| `<leader>xx` | n | Diagnostics (Trouble) | | `<leader>xX` | n | Buffer Diagnostics (Trouble) |
| `<leader>cs` | n | Symbols (Trouble) | | `<leader>cl` | n | LSP list (Trouble) |
| `<leader>xL` | n | Location List (Trouble) | | `<leader>xQ` | n | Quickfix List (Trouble) |

## Neogit & Harpoon

| Key | M | Desc | | Key | M | Desc |
|-----|---|------|-|-----|---|------|
| `<leader>gn` | n | Open Neogit | | `<leader>H` | n | Harpoon file |
| `<leader>gc` | n | Neogit commit | | `<leader>hh` | n | Harpoon menu |
| `<leader>h1-9` | n | Harpoon jump to file 1-9 | | | | |

## Buffers / Tabline (Barbar)

| Key | M | Desc | | Key | M | Desc |
|-----|---|------|-|-----|---|------|
| `<A-,>` | n | Buffer previous | | `<A-.>` | n | Buffer next |
| `<A-<>` | n | Move buffer left | | `<A->>` | n | Move buffer right |
| `<leader>1-9` | n | Goto buffer 1-9 | | `<leader>0` | n | Goto last buffer |
| `<A-p>` | n | Pin buffer | | `<A-c>` | n | Close buffer |
| `<C-p>` | n | Pick buffer | | `<C-s-p>` | n | Pick buffer delete |
| `<leader>bb` | n | Order by buffer number | | `<leader>bn` | n | Order by name |
| `<leader>bd` | n | Order by directory (conflicts) | | `<leader>bl` | n | Order by language |
| `<leader>bw` | n | Order by window number | | | | |

## Formatting & Linting

| Key | M | Desc | | Key | M | Desc |
|-----|---|------|-|-----|---|------|
| `<leader>fb` | n,v | Format buffer/selection | | `<leader>ll` | n | Trigger linting |

## Treesitter Selection & Swap

| Key | M | Desc | | Key | M | Desc |
|-----|---|------|-|-----|---|------|
| `<leader>ss` | n | Init selection | | `<leader>a` | n | Swap next parameter |
| `<leader>si` | n | Node incremental | | `<leader>A` | n | Swap prev parameter |
| `<leader>sc` | n | Scope incremental | | | | |
| `<leader>sd` | n | Node decremental | | | | |

## Treesitter Movement

| Key | M | Desc | | Key | M | Desc |
|-----|---|------|-|-----|---|------|
| `]m` | n,x,o | Next function start | | `[m` | n,x,o | Prev function start |
| `]M` | n,x,o | Next function end | | `[M` | n,x,o | Prev function end |
| `]c` | n,x,o | Next class start | | `[c` | n,x,o | Prev class start |
| `]C` | n,x,o | Next class end | | `[C` | n,x,o | Prev class end |
| `]o` | n,x,o | Next loop start | | `[o` | n,x,o | Prev loop start |
| `]d` | n,x,o | Next conditional (global) | | `[d` | n,x,o | Prev conditional (global) |

## Treesitter Text Objects

| Key | M | Desc | | Key | M | Desc |
|-----|---|------|-|-----|---|------|
| `af` | o,x | Around function | | `if` | o,x | Inside function |
| `ac` | o,x | Around class | | `ic` | o,x | Inside class |
| `aa` | o,x | Around argument/parameter | | `ia` | o,x | Inside argument/parameter |
| `as` | o,x | Around scope | | | | |

## Go (no-go.nvim)

| Key | M | Desc | | Key | M | Desc |
|-----|---|------|-|-----|---|------|
| `<M-o>` | n | Toggle concealed import blocks (no-go.nvim) | | | | |

## Undo / Paste / Comment (Undo-glow)

| Key | M | Desc | | Key | M | Desc |
|-----|---|------|-|-----|---|------|
| `u` | n | Undo with highlight | | `U` | n | Redo with highlight |
| `p` | n | Paste below with highlight | | `P` | n | Paste above with highlight |
| `gc` | n,x | Toggle comment with highlight | | `gcc` | n | Toggle comment line with highlight |
| `gc` | o | Comment textobject with highlight | | | | |

## Clipboard & CamelCase

| Key | M | Desc | | Key | M | Desc |
|-----|---|------|-|-----|---|------|
| `<leader>w` | n | Next camel/snake word | | `<leader>b` | n | Prev camel/snake word |
| `<leader>e` | n | End camel/snake word | | | | |

## AI / Sidekick *(Disabled)*

| Key | M | Desc | | Key | M | Desc |
|-----|---|------|-|-----|---|------|
| `<tab>` | n | Next edit suggestion | | `<leader>at` | n,x | Send this |
| `<c-.>` | n,t,i,x | Sidekick toggle | | `<leader>af` | n | Send file |
| `<leader>aa` | n | Toggle CLI | | `<leader>av` | x | Send visual |
| `<leader>as` | n | Select CLI | | `<leader>ap` | n,x | Select prompt |
| `<leader>ad` | n | Detach CLI | | `<leader>ac` | n | Toggle Claude |

## Tabout & Completion

| Key | M | Desc | | Key | M | Desc |
|-----|---|------|-|-----|---|------|
| `<Tab>` | i | Tabout / Super-tab preset (blink.cmp) | | `<S-Tab>` | i | Backwards tabout |

## Mini.surround

| Key | M | Desc | | Key | M | Desc |
|-----|---|------|-|-----|---|------|
| `sa` | n,x | Add surrounding | | `sf` | n | Find surrounding (→) |
| `sd` | n | Delete surrounding | | `sF` | n | Find surrounding (←) |
| `sr` | n | Replace surrounding | | `sh` | n | Highlight surrounding |
| `sn` | n | Update n_lines | | | | |

## Mini.operators

| Key | M | Desc | | Key | M | Desc |
|-----|---|------|-|-----|---|------|
| `g=` | n,x | Evaluate | | `gm` | n,x | Multiply |
| `gx` | n,x | Exchange | | `gs` | n,x | Sort |
