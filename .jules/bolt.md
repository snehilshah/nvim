## 2024-05-20 - Statusline Render Loop Optimization
**Learning:** In performance-critical paths like the Neovim statusline render loop (which runs constantly during UI updates), high-level functional iterators (e.g., `vim.iter():fold()`) and inline static table allocations (e.g., mapping tables for modes or icons) cause significant closure allocation and garbage collection overhead.
**Action:** Always hoist static table allocations to the module scope and replace high-level functional iterators with standard `for` loops in hot code paths like `statusline.render()`.
