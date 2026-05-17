## 2024-05-18 - [Statusline Optimization]
**Learning:** In performance-critical Lua code like statusline rendering (`M.render`), nesting helper functions and initializing static tables inside component functions causes unnecessary closure allocations and table creations on every redraw.
**Action:** Move nested helper functions to the module scope, hoist static table allocations (like `severities`, `mode_to_str`, and `special_icons`), and replace high-level iterators (like `vim.iter`) with standard `for` loops to minimize closure allocation and iterator overhead.
