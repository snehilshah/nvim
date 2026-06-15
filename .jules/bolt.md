## 2024-05-24 - Statusline Render GC Bottleneck
**Learning:** Neovim's statusline renders continuously on every redraw. Allocating tables (`mode_to_str`, `special_icons`, `severities`) inside component functions and using high-level abstractions like `vim.iter` and nested closures inside the render loop causes significant GC pressure and overhead in a hot path.
**Action:** Hoist static table allocations to module scope and replace high-level iterators with standard `for` loops in performance-critical paths to eliminate closure allocation and iterator overhead.
