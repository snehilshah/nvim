## 2024-05-20 - [Statusline Render Loop Optimization]
**Learning:** High-level iterators like `vim.iter` and nested helper functions inside performance-critical functions like `M.render` (which runs extremely frequently in the statusline) cause unnecessary closure allocation and iterator overhead.
**Action:** Move static table allocations (`mode_to_str`, `special_icons`, `severities`) and helper functions (`wrap_component`, `concat_components`) to the module scope. Replace `vim.iter` with standard `for` loops in hot code paths.
