# Neovim Keyboard Shortcuts

> **Leader Key:** `<Space>`

## Notes / Known Conflicts

## General & Terminal

| Key         | M   | Desc                                        |     | Key          | M   | Desc                         |
| ----------- | --- | ------------------------------------------- | --- | ------------ | --- | ---------------------------- |
| `<leader>x` | n   | Execute line as Lua                         |     | `<c-_>`      | n   | Toggle Terminal (alias)      |
| `<leader>x` | v   | Execute selection as Lua                    |     | `<Esc><Esc>` | t   | Exit terminal mode           |
| `<leader>?` | n   | Buffer Local Keymaps (which-key)            |     | `<C-w>f`     | n   | Focus floating window        |
| `q`         | n   | Close certain special buffers (help/qf/etc) |     | `<leader>cp` | n   | Copy file path + line number |
| `gX`        | n   | Open link under cursor                      |     |              |     |                              |

## ToggleTerm

| Key           | M   | Desc                           |     | Key          | M   | Desc                  |
| ------------- | --- | ------------------------------ | --- | ------------ | --- | --------------------- |
| `<C-\>`       | n,t | Toggle terminal (float)        |     | `<leader>th` | n   | Terminal horizontal   |
| `<leader>tv`  | n   | Terminal vertical              |     | `<leader>tt` | n   | Terminal tab          |
| `<leader>ta`  | n   | Toggle all terminals           |     | `<leader>ts` | n   | Terminal select       |
| `<leader>t1`  | n   | Terminal 1                     |     | `<leader>t2` | n   | Terminal 2            |
| `<leader>t3`  | n   | Terminal 3                     |     | `<leader>t4` | n   | Terminal 4            |
| `<leader>tp`  | n   | Terminal btop                  |     | `<leader>tb` | n   | Terminal Bun REPL     |
| `<leader>ty`  | n   | Terminal Python                |     |              |     |                       |
| `<C-h/j/k/l>` | t   | Navigate windows from terminal |     | `<C-w>`      | t   | Window command prefix |

## Editing & Navigation

| Key      | M     | Desc                     |     | Key          | M     | Desc                          |
| -------- | ----- | ------------------------ | --- | ------------ | ----- | ----------------------------- |
| `J`      | v     | Move selected lines down |     | `<`          | v     | Indent left (stay selected)   |
| `K`      | v     | Move selected lines up   |     | `>`          | v     | Indent right (stay selected)  |
| `H`      | n,x,o | Start of line            |     | `L`          | n,x,o | End of line                   |
| `<Left>` | n     | Previous buffer          |     | `<Right>`    | n     | Next buffer                   |
| `X`      | n     | Split line at cursor     |     | `<leader>ln` | v     | Copy highlighted line numbers |

## Flash (Motion)

| Key  | M     | Desc         |     | Key  | M     | Desc              |
| ---- | ----- | ------------ | --- | ---- | ----- | ----------------- |
| `zj` | n,x,o | Flash jump   |     | `zp` | n,x,o | Flash Treesitter  |
| `zk` | o     | Remote Flash |     | `zo` | o,x   | Treesitter Search |

## Window Management

| Key        | M   | Desc                   |     | Key         | M   | Desc                   |
| ---------- | --- | ---------------------- | --- | ----------- | --- | ---------------------- |
| `<C-Up>`   | n   | Increase window height |     | `<C-Down>`  | n   | Decrease window height |
| `<C-Left>` | n   | Decrease window width  |     | `<C-Right>` | n   | Increase window width  |

## Centered Search (keeps matches centered)

| Key  | M   | Desc                      |     | Key  | M   | Desc                           |
| ---- | --- | ------------------------- | --- | ---- | --- | ------------------------------ |
| `n`  | n   | Next match (centered)     |     | `N`  | n   | Prev match (centered)          |
| `*`  | n   | Search word (centered)    |     | `#`  | n   | Search word back (centered)    |
| `g*` | n   | Search partial (centered) |     | `g#` | n   | Search partial back (centered) |

## Clipboard / Delete

| Key | M   | Desc                          |     | Key  | M   | Desc                              |
| --- | --- | ----------------------------- | --- | ---- | --- | --------------------------------- |
| `d` | n,x | Delete without yanking        |     | `dd` | n   | Delete line without yanking       |
| `D` | n,x | Delete to EOL without yanking |     | `Cw` | n   | Open Clipboard Manager (lazyclip) |

## Quickfix & Diagnostics

| Key         | M   | Desc                                    |     | Key          | M   | Desc                               |
| ----------- | --- | --------------------------------------- | --- | ------------ | --- | ---------------------------------- |
| `<M-j>`     | n   | Next quickfix item                      |     | `[d`         | n   | Previous diagnostic (LSP)          |
| `<M-k>`     | n   | Previous quickfix item                  |     | `]d`         | n   | Next diagnostic (LSP)              |
| `<M-q>`     | n   | Open quickfix list                      |     | `<leader>de` | n   | Diagnostic float                   |
| `<leader>q` | n   | Populate location list with diagnostics |     | `<leader>dy` | n   | Yank diagnostic message(s) on line |

## LSP (buffer-local on LspAttach unless noted)

| Key          | M   | Desc                                   |     | Key          | M   | Desc                                  |
| ------------ | --- | -------------------------------------- | --- | ------------ | --- | ------------------------------------- |
| `K`          | n   | Hover (rounded)                        |     | `<C-k>`      | n,i | Signature help (rounded)              |
| `gd`         | n   | Goto Definition                        |     | `gD`         | n   | Goto Declaration                      |
| `gi`         | n   | Goto Implementation                    |     | `grt`        | n   | Goto Type Definition                  |
| `grp`        | n   | References                             |     | `ga`         | n,x | Code Action (native)                  |
| `<leader>rn` | n   | Rename symbol                          |     | `<leader>ca` | n,x | Code Action (tiny-code-action)        |
| `grx`        | n   | Run codelens actions                   |     |              |     |                                       |
| `[d`         | n   | Previous diagnostic (LSP buffer-local) |     | `]d`         | n   | Next diagnostic (LSP buffer-local)    |
| `<leader>cd` | n   | Show diagnostic (LSP buffer-local)     |     | `<leader>ih` | n   | Toggle inlay hints (LSP buffer-local) |
| `<leader>wa` | n   | Add workspace folder                   |     | `<leader>wr` | n   | Remove workspace folder               |
| `<leader>wl` | n   | List workspace folders                 |     | `<leader>cR` | n   | Rename file                           |
| `<leader>ci` | n   | Incoming calls (vim.lsp)               |     | `<leader>co` | n   | Outgoing calls (vim.lsp)              |
| `<leader>lc` | n   | Incoming calls picker                  |     | `<leader>lo` | n   | Outgoing calls picker                 |

## Search & Replace (GrugFar)

| Key          | M   | Desc                    |     | Key          | M   | Desc                      |
| ------------ | --- | ----------------------- | --- | ------------ | --- | ------------------------- |
| `<leader>sR` | n,v | Search & Replace        |     | `<leader>sW` | n   | Replace word under cursor |
| `<leader>sF` | n   | Replace in current file |     | `<leader>sv` | v   | Replace visual selection  |


## Fzf-lua Picker Window

| Key     | M   | Desc                            |
| ------- | --- | ------------------------------- |
| `<C-t>` | n,i | Open current results in Trouble |

## Artio Picker

| Key      | M   | Desc      |     | Key     | M   | Desc    |
| -------- | --- | --------- | --- | ------- | --- | ------- |
| `<C-j>`  | i   | Move down |     | `<C-k>` | i   | Move up |
| `<down>` | i   | Move down |     | `<up>`  | i   | Move up |

## Git (Gitsigns) — inline hunk operations on the current buffer

| Key          | M   | Desc                             |     | Key          | M   | Desc                            |
| ------------ | --- | -------------------------------- | --- | ------------ | --- | ------------------------------- |
| `[[` / `[g`  | n   | Previous hunk (changed block)    |     | `<leader>gr` | n   | Reset (discard) hunk            |
| `]]` / `]g`  | n   | Next hunk (changed block)        |     | `<leader>gR` | n   | Reset (discard) entire buffer   |
| `<leader>gb` | n   | Blame line (popup)               |     | `<leader>ga` | n   | Stage hunk (git add)            |
| `<leader>gB` | n   | Blame buffer (all lines)         |     | `<leader>gu` | n   | Undo last staged hunk           |
| `<leader>GB` | n   | Toggle inline blame (every line) |     | `<leader>gA` | n   | Stage entire buffer             |
| `<leader>gP` | n   | Preview hunk (floating popup)    |     | `<leader>gD` | n   | Diff buffer vs HEAD (vim split) |
| `<leader>gp` | n   | Preview hunk (inline overlay)    |     |              |     |                                 |

## Git (Neogit) — main git command center

| Key          | M   | Desc                                                                             |
| ------------ | --- | -------------------------------------------------------------------------------- |
| `<leader>gn` | n   | Open Neogit status (stage, commit, push, pull, rebase, stash — press ? for help) |
| `<leader>gc` | n   | Neogit commit (skip status, go straight to commit message)                       |

## Git (Lazygit / Toggleterm)

| Key          | M   | Desc                                                                     |
| ------------ | --- | ------------------------------------------------------------------------ |
| `<leader>gg` | n   | Lazygit TUI in floating terminal (alternative interactive git UI)        |
| `<leader>GD` | n   | `git diff` for current file in terminal (with delta syntax highlighting) |

## CodeDiff — side-by-side diff UI and file history

| Key          | M   | Desc                                     |     | Key          | M   | Desc                                     |
| ------------ | --- | ---------------------------------------- | --- | ------------ | --- | ---------------------------------------- |
| `<leader>dd` | n   | Toggle CodeDiff (uncommitted changes)    |     | `<leader>dh` | n   | File history (all files, browse commits) |
| `<leader>d.` | n   | Current file history                     |     | `<leader>df` | n   | Current file diff vs HEAD                |
| `<leader>dm` | n   | Merge-base diff vs origin/main (PR-like) |     | `<leader>dM` | n   | Merge-base diff vs any branch (prompts)  |

## Database (vim-dadbod)

| Key          | M   | Desc                       |
| ------------ | --- | -------------------------- | --- | ------------ | --- | ----------------------- |
| `<leader>Du` | n   | Toggle Database UI sidebar |
| `<leader>Da` | n   | Add database connection    |
| `<leader>Df` | n   | Find saved query buffer    |
| `-`          | n   | Stage/unstage file         |     | `<leader>hs` | n   | Stage hunk under cursor |
| `<leader>hu` | n   | Unstage hunk               |     | `<leader>hr` | n   | Discard hunk            |
| `q`          | n   | Close diff tab             |     | `g?`         | n   | Show help (all keymaps) |

## Trouble

| Key          | M   | Desc                    |     | Key          | M   | Desc                         |
| ------------ | --- | ----------------------- | --- | ------------ | --- | ---------------------------- |
| `<leader>xx` | n   | Diagnostics (Trouble)   |     | `<leader>xX` | n   | Buffer Diagnostics (Trouble) |
| `<leader>cs` | n   | Symbols (Trouble)       |     | `<leader>cL` | n   | LSP list (Trouble)           |
| `<leader>xL` | n   | Location List (Trouble) |     | `<leader>xQ` | n   | Quickfix List (Trouble)      |

## Haunt (Ghost Text Bookmarks)

Annotate lines with virtual text notes (without modifying files). Per git-branch scoping.

| Key          | M   | Desc                          |     | Key          | M   | Desc                       |
| ------------ | --- | ----------------------------- | --- | ------------ | --- | -------------------------- |
| `<leader>ma` | n   | Annotate line (add/edit note) |     | `<leader>md` | n   | Delete bookmark            |
| `<leader>mt` | n   | Toggle annotation visibility  |     | `<leader>mC` | n   | Clear all bookmarks        |
| `<leader>mT` | n   | Toggle all annotations        |     | `<leader>mn` | n   | Next bookmark              |
| `<leader>mp` | n   | Previous bookmark             |     | `<leader>mf` | n   | Find bookmarks (picker)    |
| `<leader>mq` | n   | Bookmarks → quickfix (buffer) |     | `<leader>mQ` | n   | Bookmarks → quickfix (all) |
| `<leader>my` | n   | Yank locations (buffer)       |     | `<leader>mY` | n   | Yank locations (all)       |

### Haunt Picker (inside bookmark picker)

| Key    | M   | Desc             |
| ------ | --- | ---------------- |
| `<CR>` | n   | Jump to bookmark |
| `d`    | n   | Delete bookmark  |
| `a`    | n   | Edit annotation  |

## Buffers / Tabline (Barbar)

| Key           | M   | Desc                           |     | Key          | M   | Desc               |
| ------------- | --- | ------------------------------ | --- | ------------ | --- | ------------------ |
| `<A-,>`       | n   | Buffer previous                |     | `<A-.>`      | n   | Buffer next        |
| `<A-S-,>`     | n   | Move buffer left               |     | `<A-S-.>`    | n   | Move buffer right  |
| `<A-1>-<A-9>` | n   | Goto buffer 1-9                |     | `<A-0>`      | n   | Goto last buffer   |
| `<A-p>`       | n   | Pin buffer                     |     | `<A-c>`      | n   | Close buffer       |
| `<C-p>`       | n   | Pick buffer                    |     | `<C-s-p>`    | n   | Pick buffer delete |
| `<leader>bb`  | n   | Order by buffer number         |     | `<leader>bn` | n   | Order by name      |
| `<leader>bd`  | n   | Order by directory (conflicts) |     | `<leader>bl` | n   | Order by language  |
| `<leader>bw`  | n   | Order by window number         |     |              |     |                    |

## Formatting & Linting

| Key          | M   | Desc                    |     | Key          | M   | Desc            |
| ------------ | --- | ----------------------- | --- | ------------ | --- | --------------- |
| `<leader>fb` | n,v | Format buffer/selection |     | `<leader>ll` | n   | Trigger linting |

## Treesitter Selection & Swap

| Key          | M   | Desc              |     | Key          | M   | Desc                |
| ------------ | --- | ----------------- | --- | ------------ | --- | ------------------- |
| `<leader>ss` | n   | Init selection    |     | `<leader>a`  | n   | Swap next parameter |
| `<leader>si` | n   | Node incremental  |     | `<leader>A`  | n   | Swap prev parameter |
| `<leader>sc` | n   | Scope incremental |     | `<leader>sn` | n   | Node decremental    |

## Treesitter Movement

| Key  | M     | Desc                  |     | Key  | M     | Desc                  |
| ---- | ----- | --------------------- | --- | ---- | ----- | --------------------- |
| `]f` | n,x,o | Next function start   |     | `[f` | n,x,o | Prev function start   |
| `]F` | n,x,o | Next function end     |     | `[F` | n,x,o | Prev function end     |
| `]c` | n,x,o | Next class start      |     | `[c` | n,x,o | Prev class start      |
| `]C` | n,x,o | Next class end        |     | `[C` | n,x,o | Prev class end        |
| `]o` | n,x,o | Next loop start       |     | `[o` | n,x,o | Prev loop start       |
| `]i` | n,x,o | Next conditional (if) |     | `[i` | n,x,o | Prev conditional (if) |

## Treesitter Text Objects

| Key  | M   | Desc                      |     | Key  | M   | Desc                      |
| ---- | --- | ------------------------- | --- | ---- | --- | ------------------------- |
| `af` | o,x | Around function           |     | `if` | o,x | Inside function           |
| `ac` | o,x | Around class              |     | `ic` | o,x | Inside class              |
| `aa` | o,x | Around argument/parameter |     | `ia` | o,x | Inside argument/parameter |
| `ao` | o,x | Around loop               |     | `io` | o,x | Inside loop               |
| `ai` | o,x | Around conditional (if)   |     | `ii` | o,x | Inside conditional (if)   |
| `ar` | o,x | Around return             |     | `ir` | o,x | Inside return             |
| `as` | o,x | Around scope              |     |      |     |                           |

## Mini Operators (`<leader>o`)

| Key                   | M   | Desc                               |     | Key           | M   | Desc                       |
| --------------------- | --- | ---------------------------------- | --- | ------------- | --- | -------------------------- |
| `<leader>or{textobj}` | n   | Replace textobj with register      |     | `<leader>orr` | n   | Replace line with register |
| `<leader>ox{textobj}` | n   | Exchange (mark first, then second) |     | `<leader>oxx` | n   | Exchange line              |
| `<leader>os{textobj}` | n   | Sort within textobj                |     | `<leader>oss` | n   | Sort line                  |
| `<leader>om{textobj}` | n   | Multiply (duplicate) textobj       |     | `<leader>omm` | n   | Multiply line              |
| `<leader>oe{textobj}` | n   | Evaluate & replace                 |     | `<leader>oee` | n   | Evaluate line              |

> **Tip:** Combine operators with treesitter textobjects: `<leader>oriw` (replace word), `<leader>orif` (replace function body), `<leader>oria` (replace argument), `<leader>oxia` (exchange arguments).

## Mini Surround

| Key                 | M   | Desc                    |     | Key        | M   | Desc                     |
| ------------------- | --- | ----------------------- | --- | ---------- | --- | ------------------------ |
| `sa{textobj}{char}` | n   | Add surrounding         |     | `sd{char}` | n   | Delete surrounding       |
| `sr{old}{new}`      | n   | Replace surrounding     |     | `sf{char}` | n   | Find surrounding (right) |
| `sF{char}`          | n   | Find surrounding (left) |     | `sh{char}` | n   | Highlight surrounding    |

## Go (no-go.nvim)

| Key     | M   | Desc                                        |     | Key | M   | Desc |
| ------- | --- | ------------------------------------------- | --- | --- | --- | ---- |
| `<M-o>` | n   | Toggle concealed import blocks (no-go.nvim) |     |     |     |      |

## CSV Files (csvview.nvim)

| Key          | M   | Desc            |
| ------------ | --- | --------------- |
| `<leader>cv` | n   | Toggle CSV view |

## Web Development (package.json)

| Key          | M   | Desc                   |     | Key          | M   | Desc                |
| ------------ | --- | ---------------------- | --- | ------------ | --- | ------------------- |
| `<leader>ns` | n   | Show package versions  |     | `<leader>nu` | n   | Update package      |
| `<leader>nd` | n   | Delete package         |     | `<leader>ni` | n   | Install new package |
| `<leader>np` | n   | Change package version |     |              |     |                     |

> **Note:** Emmet expansions work via `emmet_language_server` LSP - just type abbreviation and Tab to accept from blink.cmp.
> Auto-import for React/TS: use `ga` (code action) on unresolved symbols.

## Undo / Paste / Comment (Undo-glow)

| Key  | M   | Desc                              |     | Key   | M   | Desc                               |
| ---- | --- | --------------------------------- | --- | ----- | --- | ---------------------------------- |
| `u`  | n   | Undo with highlight               |     | `U`   | n   | Redo with highlight                |
| `p`  | n   | Paste below with highlight        |     | `P`   | n   | Paste above with highlight         |
| `gc` | n,x | Toggle comment with highlight     |     | `gcc` | n   | Toggle comment line with highlight |
| `gc` | o   | Comment textobject with highlight |     |       |     |                                    |

## Clipboard & CamelCase

| Key         | M   | Desc                  |     | Key         | M   | Desc                  |
| ----------- | --- | --------------------- | --- | ----------- | --- | --------------------- |
| `<leader>w` | n   | Next camel/snake word |     | `<leader>b` | n   | Prev camel/snake word |
| `<leader>e` | n   | End camel/snake word  |     |             |     |                       |

## AI / Sidekick _(Disabled)_

| Key          | M       | Desc                 |     | Key          | M   | Desc          |
| ------------ | ------- | -------------------- | --- | ------------ | --- | ------------- |
| `<tab>`      | n       | Next edit suggestion |     | `<leader>at` | n,x | Send this     |
| `<c-.>`      | n,t,i,x | Sidekick toggle      |     | `<leader>af` | n   | Send file     |
| `<leader>aa` | n       | Toggle CLI           |     | `<leader>av` | x   | Send visual   |
| `<leader>as` | n       | Select CLI           |     | `<leader>ap` | n,x | Select prompt |
| `<leader>ad` | n       | Detach CLI           |     | `<leader>ac` | n   | Toggle Claude |

## Tabout & Completion

| Key     | M   | Desc                                   |     | Key       | M   | Desc                                   |
| ------- | --- | -------------------------------------- | --- | --------- | --- | -------------------------------------- |
| `<Tab>` | i   | Tabout / Super-tab preset (blink.cmp)  |     | `<S-Tab>` | i   | Backwards tabout                       |
| `<C-]>` | i   | Insert literal tab                     |     |           |     |                                        |
| `<C-j>` | i   | Completion next (blink.cmp; menu only) |     | `<C-k>`   | i   | Completion prev (blink.cmp; menu only) |

## Mini.surround

| Key  | M   | Desc                |     | Key  | M   | Desc                  |
| ---- | --- | ------------------- | --- | ---- | --- | --------------------- |
| `sa` | n,x | Add surrounding     |     | `sf` | n   | Find surrounding (→)  |
| `sd` | n   | Delete surrounding  |     | `sF` | n   | Find surrounding (←)  |
| `sr` | n   | Replace surrounding |     | `sh` | n   | Highlight surrounding |
| `sn` | n   | Update n_lines      |     |      |     |                       |

## Mini.splitjoin

| Key  | M   | Desc                        |
| ---- | --- | --------------------------- |
| `gS` | n   | Toggle split/join arguments |

## Mini.operators

| Key  | M   | Desc     |     | Key  | M   | Desc     |
| ---- | --- | -------- | --- | ---- | --- | -------- |
| `g=` | n,x | Evaluate |     | `gm` | n,x | Multiply |
| `gx` | n,x | Exchange |     | `gs` | n,x | Sort     |

## TUIs (`<leader>T`)

| Key          | M   | Desc               |     | Key          | M   | Desc        |
| ------------ | --- | ------------------ | --- | ------------ | --- | ----------- |
| `<leader>Tu` | n   | Choose UI (picker) |     | `<leader>Tk` | n   | Kubernetes  |
| `<leader>Td` | n   | Docker             |     | `<leader>Tl` | n   | LSP Manager |
| `<leader>Tp` | n   | Processes          |     | `<leader>Ts` | n   | Systemd     |
| `<leader>Tg` | n   | GitHub             |     | `<leader>Ta` | n   | AWS         |
| `<leader>Tc` | n   | GCloud             |     | `<leader>Th` | n   | Hacker News |
| `<leader>Tb` | n   | Bitwarden          |     | `<leader>To` | n   | lsof        |

### TUIs Internal Keybindings (inside TUI windows)

| Key         | Desc                       |     | Key         | Desc                        |
| ----------- | -------------------------- | --- | ----------- | --------------------------- |
| `<Leader>r` | Refresh data               |     | `g?`        | Toggle help panel           |
| `gi`        | Inspect/view details       |     | `g1-g9`     | Navigate tabs               |
| `gl`        | View logs                  |     | `gx`        | Execute/shell into resource |
| `gk`        | Kill/terminate             |     | `gs`        | Start/scale resource        |
| `gS`        | Stop resource              |     | `gr`        | Restart/rerun               |
| `go`        | Open in browser            |     | `gd`        | Delete/remove resource      |
| `gy`        | Yank/copy value            |     | `gv`        | View related resources      |
| `gp`        | Push/pull/port-forward     |     | `<CR>`      | Select/open/view            |
| `<C-o>`     | Go back                    |     | `[[ / ]]`   | Prev/next page              |
| `<Leader>s` | System namespace (Systemd) |     | `<Leader>u` | User namespace (Systemd)    |
