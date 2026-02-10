# Neovim Keyboard Shortcuts

> **Leader Key:** `<Space>`

## Notes / Known Conflicts

- `<leader>bd` is used by both Snacks (delete buffer) and Barbar (order-by-directory). Snacks usually wins.
- `<leader>nc` is used by both Snacks (Nvim Config) and package-info (hide versions). Snacks usually wins.
- Git keymaps are spread across 5 plugins: Gitsigns (buffer hunk ops), Snacks (pickers/browser), Neogit (main UI), Diffview (side-by-side diffs), Toggleterm (lazygit/delta). See the Git sections below for details.
## General & Terminal

| Key | M | Desc | | Key | M | Desc |
|-----|---|------|-|-----|---|------|
| `<leader>rc` | n | Source current file | | `<c-/>` | n | Toggle Snacks Terminal |
| `<leader>x` | n | Execute line as Lua | | `<c-_>` | n | Toggle Terminal (alias) |
| `<leader>x` | v | Execute selection as Lua | | `<Esc><Esc>` | t | Exit terminal mode |
| `<leader>?` | n | Buffer Local Keymaps (which-key) | | `<C-w>f` | n | Focus floating window |
| `q` | n | Close certain special buffers (help/qf/etc) | | `<leader>cp` | n | Copy file path + line number |
| `gX` | n | Open link under cursor | | | | |

## ToggleTerm

| Key | M | Desc | | Key | M | Desc |
|-----|---|------|-|-----|---|------|
| `<C-\>` | n,t | Toggle terminal (float) | | `<leader>th` | n | Terminal horizontal |
| `<leader>tv` | n | Terminal vertical | | `<leader>tt` | n | Terminal tab |
| `<leader>ta` | n | Toggle all terminals | | `<leader>ts` | n | Terminal select |
| `<leader>t1` | n | Terminal 1 | | `<leader>t2` | n | Terminal 2 |
| `<leader>t3` | n | Terminal 3 | | `<leader>t4` | n | Terminal 4 |
| `<leader>tp` | n | Terminal btop | | `<leader>tb` | n | Terminal Bun REPL |
| `<leader>ty` | n | Terminal Python | | | | |
| `<C-h/j/k/l>` | t | Navigate windows from terminal | | `<C-w>` | t | Window command prefix |

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
| `D` | n,x | Delete to EOL without yanking | | `Cw` | n | Open Clipboard Manager (lazyclip) |

## Quickfix & Diagnostics

| Key | M | Desc | | Key | M | Desc |
|-----|---|------|-|-----|---|------|
| `<M-j>` | n | Next quickfix item | | `[d` | n | Previous diagnostic (LSP) |
| `<M-k>` | n | Previous quickfix item | | `]d` | n | Next diagnostic (LSP) |
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
| `<leader>cl` | n | Run codelens actions | | | | |
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
| `<leader>fp` | n | Projects | | `<leader>fr` | n | Recent files |
| `<leader>fn` | n,t | Next reference | | `<leader>fN` | n,t | Prev reference |

## File Explorer & Navigation

| Key | M | Desc | | Key | M | Desc |
|-----|---|------|-|-----|---|------|
| `<M-e>` | n | Snacks File Explorer | | `<leader>fe` | n | Toggle Fyler (file manager) |

### Fyler (inside file manager)

| Key | M | Desc | | Key | M | Desc |
|-----|---|------|-|-----|---|------|
| `<CR>` | n | Open file/enter directory | | `-` | n | Go to parent directory |
| `.` | n | Enter directory under cursor | | `^` | n | Go to parent directory |
| `s` | n | Open in horizontal split | | `\|` | n | Open in vertical split |
| `<C-t>` | n | Open in new tab | | `=` | n | Go to working directory |
| `#` | n | Collapse all | | `<BS>` | n | Collapse node |
| `q` | n | Close Fyler | | | | |

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
| `<leader>sh` | n | Help Pages | | | | |
| `<leader>sS` | n | LSP Workspace Symbols (Snacks) | | | | |

## Search & Replace (GrugFar)

| Key | M | Desc | | Key | M | Desc |
|-----|---|------|-|-----|---|------|
| `<leader>sR` | n,v | Search & Replace | | `<leader>sW` | n | Replace word under cursor |
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
| `<leader>uC` | n | Colorschemes | | `<leader>ug` | n | Toggle Indent |
| `<leader>uD` | n | Toggle Dim | | `<leader>un` | n | Dismiss Notifications |
| `<leader>tw` | n,v | Toggle visual whitespace | | | | |

## Snacks Picker Window

| Key | M | Desc | | Key | M | Desc |
|-----|---|------|-|-----|---|------|
| `<Esc>` | n,i | Close picker | | `J` | n,i | Preview scroll down |
| `<M-p>` | n,i | Cycle layouts | | `K` | n,i | Preview scroll up |
| `H` | n,i | Preview scroll left | | `L` | n,i | Preview scroll right |
| `<Tab>` | n,i | Focus preview | | `<c-t>` | n,i | Open in Trouble (picker) |
| `<a-a>` | n,i | Sidekick send (explorer) | | | | |

## Git (Gitsigns) — inline hunk operations on the current buffer

| Key | M | Desc | | Key | M | Desc |
|-----|---|------|-|-----|---|------|
| `[g` | n | Previous hunk (changed block) | | `<leader>gr` | n | Reset (discard) hunk |
| `]g` | n | Next hunk (changed block) | | `<leader>gR` | n | Reset (discard) entire buffer |
| `<leader>gb` | n | Blame line (popup) | | `<leader>ga` | n | Stage hunk (git add) |
| `<leader>gB` | n | Blame buffer (all lines) | | `<leader>gu` | n | Undo last staged hunk |
| `<leader>GB` | n | Toggle inline blame (every line) | | `<leader>gA` | n | Stage entire buffer |
| `<leader>gP` | n | Preview hunk (floating popup) | | `<leader>gD` | n | Diff buffer vs HEAD (vim split) |
| `<leader>gp` | n | Preview hunk (inline overlay) | | | | |

## Git (Snacks) — pickers and browser integration

| Key | M | Desc | | Key | M | Desc |
|-----|---|------|-|-----|---|------|
| `<leader>gl` | n | Log for current line (commits that touched this line) | | `<leader>gS` | n | Browse stash entries (picker) |
| `<leader>gd` | n | Changed hunks across repo (searchable picker) | | `<leader>go` | n,v | Open file/selection on GitHub in browser |

## Git (Neogit) — main git command center

| Key | M | Desc |
|-----|---|------|
| `<leader>gn` | n | Open Neogit status (stage, commit, push, pull, rebase, stash — press ? for help) |
| `<leader>gc` | n | Neogit commit (skip status, go straight to commit message) |

## Git (Lazygit / Toggleterm)

| Key | M | Desc |
|-----|---|------|
| `<leader>gg` | n | Lazygit TUI in floating terminal (alternative interactive git UI) |
| `<leader>GD` | n | `git diff` for current file in terminal (with delta syntax highlighting) |

## Diffview — side-by-side diff UI and file history

| Key | M | Desc | | Key | M | Desc |
|-----|---|------|-|-----|---|------|
| `<leader>dv` | n | Open Diffview (all uncommitted changes) | | `<leader>Df` | n | File history (all files, browse commits) |
| `<leader>dc` | n | Close Diffview | | `<leader>D.` | n | Current file history |
| `<leader>Gm` | n | Compare HEAD vs origin/main | | `<leader>DF` | n | Toggle files panel |
| `<leader>GM` | n | Compare HEAD vs any branch (prompts) | | `<tab>` | n | Toggle stage (in file panel) |
| `<cr>` | n | Go to file (in file panel) | | `q` | n | Close diffview (all panels) |

## Trouble

| Key | M | Desc | | Key | M | Desc |
|-----|---|------|-|-----|---|------|
| `<leader>xx` | n | Diagnostics (Trouble) | | `<leader>xX` | n | Buffer Diagnostics (Trouble) |
| `<leader>cs` | n | Symbols (Trouble) | | `<leader>cL` | n | LSP list (Trouble) |
| `<leader>xL` | n | Location List (Trouble) | | `<leader>xQ` | n | Quickfix List (Trouble) |

## Spelunk (Stack-based Bookmarks)

| Key | M | Desc | | Key | M | Desc |
|-----|---|------|-|-----|---|------|
| `<leader>mt` | n | Toggle bookmark UI | | `<leader>ma` | n | Add bookmark |
| `<leader>md` | n | Delete bookmark on line | | `<leader>mn` | n | Next bookmark |
| `<leader>mp` | n | Previous bookmark | | `<leader>mf` | n | Find all bookmarks |
| `<leader>mc` | n | Find in current stack | | `<leader>ms` | n | Find stacks |
| `<leader>ml` | n | Change bookmark line | | `<leader>m1-5` | n | Jump to bookmark 1-5 |

### Spelunk Window (inside bookmark UI)

| Key | Desc | | Key | Desc |
|-----|------|-|-----|------|
| `j/k` | Navigate up/down | | `<C-j>/<C-k>` | Move bookmark down/up |
| `<CR>` | Jump to bookmark | | `s` | Open in horizontal split |
| `v` | Open in vertical split | | `l` | Change bookmark line |
| `d` | Delete bookmark | | `<Tab>/<S-Tab>` | Next/prev stack |
| `n` | New stack | | `D` | Delete stack |
| `E` | Edit/rename stack | | `q` | Close UI |
| `?` | Show help | | | |

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
| `<leader>sc` | n | Scope incremental | | `<leader>sn` | n | Node decremental |

## Treesitter Movement

| Key | M | Desc | | Key | M | Desc |
|-----|---|------|-|-----|---|------|
| `]f` | n,x,o | Next function start | | `[f` | n,x,o | Prev function start |
| `]F` | n,x,o | Next function end | | `[F` | n,x,o | Prev function end |
| `]c` | n,x,o | Next class start | | `[c` | n,x,o | Prev class start |
| `]C` | n,x,o | Next class end | | `[C` | n,x,o | Prev class end |
| `]o` | n,x,o | Next loop start | | `[o` | n,x,o | Prev loop start |
| `]i` | n,x,o | Next conditional (if) | | `[i` | n,x,o | Prev conditional (if) |

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

## Web Development (package.json)

| Key | M | Desc | | Key | M | Desc |
|-----|---|------|-|-----|---|------|
| `<leader>ns` | n | Show package versions | | `<leader>nu` | n | Update package |
| `<leader>nd` | n | Delete package | | `<leader>ni` | n | Install new package |
| `<leader>np` | n | Change package version | | | | |

> **Note:** Emmet expansions work via `emmet_language_server` LSP - just type abbreviation and Tab to accept from blink.cmp.
> Auto-import for React/TS: use `ga` (code action) on unresolved symbols.

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
| `<C-l>` | i | Insert literal tab | | | | |
| `<C-j>` | i | Completion next (blink.cmp; menu only) | | `<C-k>` | i | Completion prev (blink.cmp; menu only) |

## Mini.surround

| Key | M | Desc | | Key | M | Desc |
|-----|---|------|-|-----|---|------|
| `sa` | n,x | Add surrounding | | `sf` | n | Find surrounding (→) |
| `sd` | n | Delete surrounding | | `sF` | n | Find surrounding (←) |
| `sr` | n | Replace surrounding | | `sh` | n | Highlight surrounding |
| `sn` | n | Update n_lines | | | | |

## Mini.splitjoin

| Key | M | Desc |
|-----|---|------|
| `gS` | n | Toggle split/join arguments |

## Mini.operators

| Key | M | Desc | | Key | M | Desc |
|-----|---|------|-|-----|---|------|
| `g=` | n,x | Evaluate | | `gm` | n,x | Multiply |
| `gx` | n,x | Exchange | | `gs` | n,x | Sort |

## TUIs (`<leader>T`)

| Key | M | Desc | | Key | M | Desc |
|-----|---|------|-|-----|---|------|
| `<leader>Tu` | n | Choose UI (picker) | | `<leader>Tk` | n | Kubernetes |
| `<leader>Td` | n | Docker | | `<leader>Tl` | n | LSP Manager |
| `<leader>Tp` | n | Processes | | `<leader>Ts` | n | Systemd |
| `<leader>Tg` | n | GitHub | | `<leader>Ta` | n | AWS |
| `<leader>Tc` | n | GCloud | | `<leader>Th` | n | Hacker News |
| `<leader>Tb` | n | Bitwarden | | `<leader>To` | n | lsof |

### TUIs Internal Keybindings (inside TUI windows)

| Key | Desc | | Key | Desc |
|-----|------|-|-----|------|
| `<Leader>r` | Refresh data | | `g?` | Toggle help panel |
| `gi` | Inspect/view details | | `g1-g9` | Navigate tabs |
| `gl` | View logs | | `gx` | Execute/shell into resource |
| `gk` | Kill/terminate | | `gs` | Start/scale resource |
| `gS` | Stop resource | | `gr` | Restart/rerun |
| `go` | Open in browser | | `gd` | Delete/remove resource |
| `gy` | Yank/copy value | | `gv` | View related resources |
| `gp` | Push/pull/port-forward | | `<CR>` | Select/open/view |
| `<C-o>` | Go back | | `[[ / ]]` | Prev/next page |
| `<Leader>s` | System namespace (Systemd) | | `<Leader>u` | User namespace (Systemd) |
