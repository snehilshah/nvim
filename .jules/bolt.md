## 2026-04-30 - Optimize statusline rendering
**Learning:** In performance-critical Lua code like statusline rendering (`M.render`), nested helper functions and high-level iterators (like `vim.iter`) introduce closure allocation and iterator overhead.
**Action:** Move nested helper functions to the module scope and replace high-level iterators with standard `for` loops.
