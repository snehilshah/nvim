# Neovim Keymaps — Leader: `<Space>`

| **General** | M | | **Quickfix & Diagnostics** | M |
|-------------|---|-|----------------------------|---|
| `<leader>rc` Source file | n | | `<M-j/k>` Next/prev qf | n |
| `<leader>x` Exec as Lua | n/v | | `<M-q>` Open qf list | n |
| `<Esc>` Clear highlights | n | | `<leader>q` Diag qf list | n |
| `<Esc><Esc>` Exit terminal | t | | `[e` `]e` Prev/next diag | n |
| `<leader>?` Which-key | n | | `<leader>de` Show diag float | n |
| `<C-w>f` Focus float | n | | `<leader>dy` Yank diag msg | n |
| `<leader>j/k` Move line ↓/↑ | n/v | | | |
| `d` `dd` `D` Delete (no yank) | n/x | | | |

| **Terminal** | M | | **LSP** | M |
|--------------|---|-|---------|---|
| `<leader>to` Terminal split | n | | `K` Hover docs | n |
| `<c-/>` Snacks terminal | n | | `gd` `gD` Def / Decl | n |
| | | | `gi` `grt` Impl / TypeDef | n |
| **Harpoon** | M | | `grn` Rename | n |
| `<leader>H` Add to harpoon | n | | `gra` Code action | n/x |
| `<leader>hh` Quick menu | n | | `grp` References | n |
| `<leader>h1-9` Jump to file | n | | `<leader>ca` Code action (tiny) | n/x |
| | | | `<leader>ci/co` In/out calls | n |
| **Format & Lint** | M | | `<leader>cR` Rename file | n |
| `<leader>fb` Format buffer | * | | `<leader>th` Toggle inlay hints | n |
| `<leader>ll` Lint | n | | | |
| `<leader>lk` Show linters | n | | | |
| `<leader>y` Neoclip history | n | | | |
| `<leader>w/b/e` CamelCase | n | | | |

| **Snacks Pickers** | M | | **Snacks Search `<leader>s`** | |
|--------------------|---|-|-------------------------------|---|
| `<leader><leader>` Smart find | n | | `s"` `s/` Registers / Search hist | |
| `<leader>ff` Files | n | | `sa` `sC` Autocmds / Commands | |
| `<leader>fa` Grep all | n | | `sD` `sd` Diag all / buf | |
| `<leader>fv` Grep word | n/x | | `sf` `sS` Symbols / WS sym | |
| `<leader>fp` Projects | n | | `sh` `sH` Help / Highlights | |
| `<leader>fr` Recent | n | | `sj` `sl` Jumps / Loclist | |
| `<leader>fn/fN` Next/prev ref | n | | `sm` `sM` Marks / Man | |
| `<leader>jk` Buffers | n | | `sp` `sq` Plugins / QF | |
| `<leader>nc` Nvim config | n | | `sR` `su` Resume / Undo | |
| `<leader>:` Cmd history | n | | | |
| `<M-S-k>` Keymaps | n | | **Picker Window** | |
| `<M-e>` Explorer | n | | `<Esc>` Close | |
| | | | `<M-p>` Cycle layout | |
| | | | `J/K/H/L` Scroll preview | |

| **Snacks UI** | M | | **Snacks Toggles `<leader>u`** | |
|---------------|---|-|--------------------------------|---|
| `<leader>z/Z` Zen / Zoom | n | | `us` `uw` Spell / Wrap | |
| `<leader>.` Scratch buf | n | | `uL` `ul` RelNum / LineNum | |
| `<leader>S` Select scratch | n | | `ud` `uD` Diag / Dim | |
| `<leader>nh` Notif history | n | | `uc` `uT` Conceal / TS | |
| `<leader>N` Nvim news | n | | `ub` `uh` Dark BG / Hints | |
| `<leader>bd` Delete buf | n | | `ug` `un` Indent / Dismiss | |
| `<leader>ii` Icons | n | | | |
| `<leader>uC` Colorschemes | n | | | |

| **Git (Gitsigns)** | M | | **Git (Snacks) & Neogit** | M |
|--------------------|---|-|---------------------------|---|
| `[g` `]g` Prev/next hunk | n | | `<leader>gl/gL` Log / Log line | n |
| `<leader>gb/gB` Blame line/buf | n | | `<leader>gf` Log file | n |
| `<leader>gtb` Toggle blame | n | | `<leader>gd/gD` Diff / Diff HEAD | n |
| `<leader>gP/gp` Preview popup/inline | n | | `<leader>gS` Stash | n |
| `<leader>gr/gR` Reset hunk/buf | n | | `<leader>go` Browse | n/v |
| `<leader>ga/gA` Stage hunk/buf | n | | `<leader>gg` Lazygit | n |
| `<leader>gu` Undo stage | n | | `<leader>gn` Neogit | n |
| | | | `<leader>gc` Commit | n |

| **Diffview** | M | | **Treesitter** | M |
|--------------|---|-|----------------|---|
| `<leader>dv/dc` Open / Close | n | | `<leader>ss` Init selection | n |
| `<leader>Df/D.` File hist all/curr | n | | `<leader>si/sd` Inc / Dec node | n |
| `<leader>DF` Toggle files | n | | `<leader>sc` Inc scope | n |
| `<leader>Gm/GM` Compare main/branch | n | | `<leader>a/A` Swap param →/← | n |
| `<tab>` `<cr>` Stage / Edit | n | | `]m/[m` Func start →/← | n |
| | | | `]M/[M` Func end →/← | n |
| | | | `]c/[c` Class start →/← | n |
| | | | `]C/[C` Class end →/← | n |
| | | | `]o` `]s` `]z` Loop/Scope/Fold | n |
| | | | `]d/[d` Conditional →/← | n |
| | | | `af` `if` Around / in func | o/x |
| | | | `ac` `ic` Around / in class | o/x |
| | | | `as` Around scope | o/x |

| **Mini.surround** | | | **Mini.operators** | |
|-------------------|---|-|--------------------|-|
| `sa` `sd` `sr` Add/Del/Replace | | | `g=` Evaluate | |
| `sf` `sF` Find →/← | | | `gx` Exchange | |
| `sh` Highlight | | | `gm` Multiply | |
| | | | `gs` Sort | |

| **Completion** | M | | **AI/Sidekick** *(disabled)* | |
|----------------|---|-|------------------------------|---|
| `<Tab>` Complete / Tabout | i | | `<c-.>` Toggle | |
| `<S-Tab>` Prev / Back | i | | `<leader>aa/as/ad` CLI/Sel/Detach | |
| | | | `<leader>at/af/av` Send this/file/sel | |
| | | | `<leader>ap/ac` Prompt / Claude | |
