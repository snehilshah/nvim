# Neovim Keymaps — Leader: `<Space>`

## General
| Key | M | Desc |
|-----|---|------|
| `<leader>rc` | n | Source file |
| `<leader>x` | n/v | Exec as Lua |
| `<Esc>` | n | Clear highlights |
| `<Esc><Esc>` | t | Exit terminal |
| `<leader>?` | n | Which-key |
| `<C-w>f` | n | Focus float |
| `<leader>j/k` | n/v | Move line ↓/↑ |
| `d` `dd` `D` | n/x | Delete (no yank) |

## Quickfix & Diagnostics
| Key | M | Desc |
|-----|---|------|
| `<M-j/k>` | n | Next/prev qf |
| `<M-q>` | n | Open qf list |
| `<leader>q` | n | Diag qf list |
| `[e` `]e` | n | Prev/next diag |
| `<leader>de` | n | Show diag float |
| `<leader>dy` | n | Yank diag msg |

## Terminal
| Key | M | Desc |
|-----|---|------|
| `<leader>to` | n | Terminal split |
| `<c-/>` | n | Snacks terminal |

## LSP
| Key | M | Desc |
|-----|---|------|
| `K` | n | Hover docs |
| `gd` `gD` | n | Def / Decl |
| `gi` `grt` | n | Impl / TypeDef |
| `grn` | n | Rename |
| `gra` | n/x | Code action |
| `grp` | n | References |
| `<leader>ca` | n/x | Code action (tiny) |
| `<leader>ci/co` | n | In/out calls |
| `<leader>cR` | n | Rename file |
| `<leader>th` | n | Toggle inlay hints |

## Harpoon
| Key | M | Desc |
|-----|---|------|
| `<leader>H` | n | Add to harpoon |
| `<leader>hh` | n | Quick menu |
| `<leader>h1-9` | n | Jump to file 1-9 |

## Format & Lint
| Key | M | Desc |
|-----|---|------|
| `<leader>fb` | * | Format buffer |
| `<leader>ll` | n | Lint |
| `<leader>lk` | n | Show linters |
| `<leader>y` | n | Neoclip history |
| `<leader>w/b/e` | n | CamelCase motion |

## Snacks Pickers
| Key | M | Desc |
|-----|---|------|
| `<leader><leader>` | n | Smart find |
| `<leader>ff` | n | Files |
| `<leader>fa` | n | Grep all |
| `<leader>fv` | n/x | Grep word |
| `<leader>fp` | n | Projects |
| `<leader>fr` | n | Recent |
| `<leader>fn/fN` | n | Next/prev ref |
| `<leader>jk` | n | Buffers |
| `<leader>nc` | n | Nvim config |
| `<leader>:` | n | Cmd history |
| `<M-S-k>` | n | Keymaps |
| `<M-e>` | n | Explorer |

## Snacks Search `<leader>s`
| Key | Desc |
|-----|------|
| `s"` `s/` | Registers / Search hist |
| `sa` `sC` | Autocmds / Commands |
| `sD` `sd` | Diag all / buf |
| `sf` `sS` | Symbols / WS sym |
| `sh` `sH` | Help / Highlights |
| `sj` `sl` | Jumps / Loclist |
| `sm` `sM` | Marks / Man |
| `sp` `sq` | Plugins / QF |
| `sR` `su` | Resume / Undo |

## Snacks UI
| Key | M | Desc |
|-----|---|------|
| `<leader>z/Z` | n | Zen / Zoom |
| `<leader>.` | n | Scratch buf |
| `<leader>S` | n | Select scratch |
| `<leader>nh` | n | Notif history |
| `<leader>N` | n | Nvim news |
| `<leader>bd` | n | Delete buf |
| `<leader>ii` | n | Icons |
| `<leader>uC` | n | Colorschemes |

## Snacks Toggles `<leader>u`
| Key | Desc |
|-----|------|
| `us` `uw` | Spell / Wrap |
| `uL` `ul` | RelNum / LineNum |
| `ud` `uD` | Diag / Dim |
| `uc` `uT` | Conceal / TS |
| `ub` `uh` | Dark BG / Hints |
| `ug` `un` | Indent / Dismiss |

## Picker Window
| Key | Desc |
|-----|------|
| `<Esc>` | Close |
| `<M-p>` | Cycle layout |
| `J/K/H/L` | Scroll preview |

## Git (Gitsigns)
| Key | M | Desc |
|-----|---|------|
| `[g` `]g` | n | Prev/next hunk |
| `<leader>gb/gB` | n | Blame line/buf |
| `<leader>gtb` | n | Toggle blame |
| `<leader>gP/gp` | n | Preview popup/inline |
| `<leader>gr/gR` | n | Reset hunk/buf |
| `<leader>ga/gA` | n | Stage hunk/buf |
| `<leader>gu` | n | Undo stage |

## Git (Snacks)
| Key | M | Desc |
|-----|---|------|
| `<leader>gl/gL` | n | Log / Log line |
| `<leader>gf` | n | Log file |
| `<leader>gd/gD` | n | Diff / Diff HEAD |
| `<leader>gS` | n | Stash |
| `<leader>go` | n/v | Browse |
| `<leader>gg` | n | Lazygit |
| `<leader>gn` | n | Neogit |
| `<leader>gc` | n | Commit |

## Diffview
| Key | M | Desc |
|-----|---|------|
| `<leader>dv/dc` | n | Open / Close |
| `<leader>Df/D.` | n | File hist all/curr |
| `<leader>DF` | n | Toggle files |
| `<leader>Gm/GM` | n | Compare main/branch |
| `<tab>` `<cr>` | n | Stage / Edit (panel) |

## Treesitter
| Key | M | Desc |
|-----|---|------|
| `<leader>ss` | n | Init selection |
| `<leader>si/sd` | n | Inc / Dec node |
| `<leader>sc` | n | Inc scope |
| `<leader>a/A` | n | Swap param →/← |
| `]m/[m` | n | Func start →/← |
| `]M/[M` | n | Func end →/← |
| `]c/[c` | n | Class start →/← |
| `]C/[C` | n | Class end →/← |
| `]o` `]s` `]z` | n | Loop / Scope / Fold |
| `]d/[d` | n | Conditional →/← |
| `af` `if` | o/x | Around / in func |
| `ac` `ic` | o/x | Around / in class |
| `as` | o/x | Around scope |

## Mini.surround
| Key | Desc |
|-----|------|
| `sa` `sd` `sr` | Add / Delete / Replace |
| `sf` `sF` `sh` | Find →/← / Highlight |

## Mini.operators
| Key | Desc |
|-----|------|
| `g=` `gx` `gm` `gs` | Eval / Exchange / Mult / Sort |

## Completion
| Key | M | Desc |
|-----|---|------|
| `<Tab>` | i | Complete / Tabout |
| `<S-Tab>` | i | Prev / Back |

## AI/Sidekick *(disabled)*
| Key | Desc |
|-----|------|
| `<c-.>` | Toggle |
| `<leader>aa/as/ad` | CLI / Select / Detach |
| `<leader>at/af/av` | Send this / file / sel |
| `<leader>ap/ac` | Prompt / Claude |
