# Neovim Keyboard Shortcuts

> **Leader Key:** `<Space>`

## General & Terminal

| Key | M | Desc | | Key | M | Desc |
|-----|---|------|-|-----|---|------|
| `<leader>rc` | n | Source current file | | `<leader>to` | n | Open terminal (hsplit) |
| `<leader>x` | n | Execute line as Lua | | `<c-/>` | n | Toggle Snacks Terminal |
| `<leader>x` | v | Execute selection as Lua | | `<c-_>` | n | Toggle Terminal (alias) |
| `<Esc>` | n | Clear highlights & close hover | | `<Esc><Esc>` | t | Exit terminal mode |
| `<leader>?` | n | Buffer Local Keys | | `<C-w>f` | n | Focus floating window |

## Movement & Editing

| Key | M | Desc | | Key | M | Desc |
|-----|---|------|-|-----|---|------|
| `<leader>j` | n | Move line down | | `d` | n,x | Delete (no clipboard) |
| `<leader>k` | n | Move line up | | `dd` | n | Delete line (no clipboard) |
| `<leader>j` | v | Move selection down | | `D` | n,x | Delete to EOL (no clipboard) |
| `<leader>k` | v | Move selection up | | | | |

## Quickfix & Diagnostics

| Key | M | Desc | | Key | M | Desc |
|-----|---|------|-|-----|---|------|
| `<M-j>` | n | Next quickfix item | | `[e` | n | Previous diagnostic |
| `<M-k>` | n | Previous quickfix item | | `]e` | n | Next diagnostic |
| `<M-q>` | n | Open quickfix list | | `<leader>de` | n | Diagnostic float |
| `<leader>q` | n | Diagnostic quickfix list | | `<leader>dy` | n | Yank diagnostic |

## LSP

| Key | M | Desc | | Key | M | Desc |
|-----|---|------|-|-----|---|------|
| `K` | n | Hover Documentation | | `grn` | n | Rename symbol |
| `gd` | n | Goto Definition | | `gra` | n,x | Code Action (native) |
| `gD` | n | Goto Declaration | | `<leader>ca` | n,x | Code Action (tiny) |
| `gi` | n | Goto Implementation | | `<leader>ci` | n | Incoming calls |
| `grp` | n | Find References | | `<leader>co` | n | Outgoing calls |
| `grt` | n | Goto Type Definition | | `<leader>cR` | n | Rename File |
| `<leader>th` | n | Toggle Inlay Hints | | | | |

## Snacks Pickers

| Key | M | Desc | | Key | M | Desc |
|-----|---|------|-|-----|---|------|
| `<leader><leader>` | n | Smart Find Files | | `<leader>jk` | n | Buffers |
| `<leader>ff` | n | Find Files | | `<leader>nc` | n | Nvim Config files |
| `<leader>fa` | n | Find All (Grep) | | `<leader>:` | n | Command History |
| `<leader>fv` | n,x | Visual/word grep | | `<M-S-k>` | n | Keys picker |
| `<leader>fp` | n | Projects | | `<M-e>` | n | File Explorer |
| `<leader>fr` | n | Recent files | | `<leader>fn` | n,t | Next Reference |
| `<leader>fN` | n,t | Previous Reference | | | | |

## Snacks Search (`<leader>s`)

| Key | M | Desc | | Key | M | Desc |
|-----|---|------|-|-----|---|------|
| `<leader>s"` | n | Registers | | `<leader>sj` | n | Jumps |
| `<leader>s/` | n | Search History | | `<leader>sl` | n | Location List |
| `<leader>sa` | n | Autocmds | | `<leader>sm` | n | Marks |
| `<leader>sC` | n | Commands | | `<leader>sM` | n | Man Pages |
| `<leader>sD` | n | Diagnostics (all) | | `<leader>sp` | n | Plugin Spec |
| `<leader>sd` | n | Buffer Diagnostics | | `<leader>sq` | n | Quickfix List |
| `<leader>sf` | n | LSP Symbols | | `<leader>sR` | n | Resume picker |
| `<leader>sS` | n | Workspace Symbols | | `<leader>su` | n | Undo History |
| `<leader>sh` | n | Help Pages | | `<leader>sH` | n | Highlights |

## Snacks UI & Toggles

| Key | M | Desc | | Key | M | Desc |
|-----|---|------|-|-----|---|------|
| `<leader>z` | n | Toggle Zen | | `<leader>us` | n | Toggle Spelling |
| `<leader>Z` | n | Toggle Zoom | | `<leader>uw` | n | Toggle Wrap |
| `<leader>.` | n | Toggle Scratch | | `<leader>uL` | n | Toggle Relative Number |
| `<leader>S` | n | Select Scratch | | `<leader>ud` | n | Toggle Diagnostics |
| `<leader>nh` | n | Notification History | | `<leader>ul` | n | Toggle Line Number |
| `<leader>N` | n | Neovim News | | `<leader>uc` | n | Toggle Conceal |
| `<leader>bd` | n | Delete Buffer | | `<leader>uT` | n | Toggle Treesitter |
| `<leader>ii` | n | Icons picker | | `<leader>ub` | n | Toggle Dark BG |
| `<leader>uC` | n | Colorschemes | | `<leader>uh` | n | Toggle Inlay Hints |
| | | | | `<leader>ug` | n | Toggle Indent |
| | | | | `<leader>uD` | n | Toggle Dim |
| | | | | `<leader>un` | n | Dismiss Notifications |

## Snacks Picker Window

| Key | M | Desc | | Key | M | Desc |
|-----|---|------|-|-----|---|------|
| `<Esc>` | n,i | Close picker | | `J` | n,i | Preview scroll down |
| `<M-p>` | n,i | Cycle layouts | | `K` | n,i | Preview scroll up |
| `H` | n,i | Preview scroll left | | `L` | n,i | Preview scroll right |
| `<a-a>` | n,i | Sidekick send | | | | |

## Git (Gitsigns)

| Key | M | Desc | | Key | M | Desc |
|-----|---|------|-|-----|---|------|
| `[g` | n | Previous hunk | | `<leader>gr` | n | Reset Hunk |
| `]g` | n | Next hunk | | `<leader>gR` | n | Reset Buffer |
| `<leader>gb` | n | Blame line | | `<leader>ga` | n | Stage Hunk |
| `<leader>gB` | n | Blame buffer | | `<leader>gu` | n | Undo Stage |
| `<leader>gtb` | n | Toggle blame | | `<leader>gA` | n | Stage Buffer |
| `<leader>gP` | n | Preview Hunk (popup) | | `<leader>gD` | n | Diff HEAD |
| `<leader>gp` | n | Preview Hunk (inline) | | | | |

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

## Neogit & Harpoon

| Key | M | Desc | | Key | M | Desc |
|-----|---|------|-|-----|---|------|
| `<leader>gn` | n | Open Neogit | | `<leader>H` | n | Add to Harpoon |
| `<leader>gc` | n | Neogit commit | | `<leader>hh` | n | Harpoon Menu |
| | | | | `<leader>h1-9` | n | Jump to file 1-9 |

## Formatting & Linting

| Key | M | Desc | | Key | M | Desc |
|-----|---|------|-|-----|---|------|
| `<leader>fb` | all | Format Buffer | | `<leader>ll` | n | Trigger linting |
| | | | | `<leader>lk` | n | Show linters |

## Treesitter Selection & Swap

| Key | M | Desc | | Key | M | Desc |
|-----|---|------|-|-----|---|------|
| `<leader>ss` | n | Init selection | | `<leader>a` | n | Swap next param |
| `<leader>si` | n | Node incremental | | `<leader>A` | n | Swap prev param |
| `<leader>sc` | n | Scope incremental | | | | |
| `<leader>sd` | n | Node decremental | | | | |

## Treesitter Movement

| Key | M | Desc | | Key | M | Desc |
|-----|---|------|-|-----|---|------|
| `]m` | n | Next function start | | `[m` | n | Prev function start |
| `]M` | n | Next function end | | `[M` | n | Prev function end |
| `]c` | n | Next class start | | `[c` | n | Prev class start |
| `]C` | n | Next class end | | `[C` | n | Prev class end |
| `]o` | n | Next loop | | `]s` | n | Next scope |
| `]z` | n | Next fold | | `]d` | n | Next conditional |
| `[d` | n | Prev conditional | | | | |

## Treesitter Text Objects

| Key | M | Desc | | Key | M | Desc |
|-----|---|------|-|-----|---|------|
| `af` | o,x | Around function | | `if` | o,x | Inside function |
| `ac` | o,x | Around class | | `ic` | o,x | Inside class |
| `as` | o,x | Around scope | | | | |

## Clipboard & CamelCase

| Key | M | Desc | | Key | M | Desc |
|-----|---|------|-|-----|---|------|
| `<leader>y` | n | Neoclip (history) | | `<leader>w` | n | Next camel/snake word |
| | | | | `<leader>b` | n | Prev camel/snake word |
| | | | | `<leader>e` | n | End camel/snake word |

## AI / Sidekick *(Disabled)*

| Key | M | Desc | | Key | M | Desc |
|-----|---|------|-|-----|---|------|
| `<tab>` | n | Next Edit Suggestion | | `<leader>at` | n,x | Send This |
| `<c-.>` | n,t,i,x | Sidekick Toggle | | `<leader>af` | n | Send File |
| `<leader>aa` | n | Toggle CLI | | `<leader>av` | x | Send Visual |
| `<leader>as` | n | Select CLI | | `<leader>ap` | n,x | Select Prompt |
| `<leader>ad` | n | Detach CLI | | `<leader>ac` | n | Toggle Claude |

## Tabout & Completion

| Key | M | Desc | | Key | M | Desc |
|-----|---|------|-|-----|---|------|
| `<Tab>` | i | Tab out / Accept completion | | `<S-Tab>` | i | Tab back / Prev snippet |

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
