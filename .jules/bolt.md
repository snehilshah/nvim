## 2024-05-18 - [Optimize Statusline Rendering in Neovim]
**Learning:** High-level abstractions like `vim.iter` and nested closures inside frequently called functions (like statusline rendering ticks) allocate closures and iterate with high overhead. In Neovim, statusline rendering is extremely hot path and gets called constantly.
**Action:** Always hoist nested helper functions (`wrap_component`, `concat_components`) and static tables (`severities`) to the module scope in hot paths. Replace `vim.iter` folds with standard `for` loops to minimize closure allocation and GC pressure.
