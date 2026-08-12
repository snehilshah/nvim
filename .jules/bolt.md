## 2024-05-05 - Statusline Rendering Optimization
**Learning:** High-frequency rendering functions like `statusline` rendering (which is called very frequently) shouldn't allocate new closures on every invocation or use high-level iterators (like `vim.iter`) which add significant overhead.
**Action:** Move nested helper functions (like `wrap_component`, `concat_components`) out to the module level and pass required context explicitly, and replace `vim.iter` with standard `for` loops in hot paths to avoid closure allocations and iterator overhead.
