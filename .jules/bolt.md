## 2024-05-24 - Statusline Rendering Optimization
**Learning:** In performance-critical Lua code like statusline rendering, nested helper functions and high-level iterators (like `vim.iter`) cause unnecessary closure allocations and iterator overhead on every redraw.
**Action:** Move nested helper functions to the module scope and replace high-level iterators with standard `for` loops.
