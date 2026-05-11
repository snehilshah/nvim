## 2024-05-18 - Hoist Statusline Allocations
**Learning:** In Neovim's performance-critical statusline rendering, creating closures, tables (like severities and mode strings), and using `vim.iter` on every redraw adds significant GC pressure and overhead.
**Action:** Always hoist static tables to the module scope, move helper functions out of render loops, and prefer standard `for` loops over high-level iterators in hot paths like `statusline`.
