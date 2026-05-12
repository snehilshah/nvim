
## 2024-05-13 - Hoisting Statusline Computations
**Learning:** Functions that act as event loops or are triggered frequently (like a statusline renderer or frequent autocmd callbacks) suffer performance penalties from repeatedly allocating tables and allocating closures inside the function loop.
**Action:** Always hoist table declarations (`special_icons`, `mode_to_str`, `severities`) and nested functions outside of high-frequency rendering functions into the module scope. Replace functional-style iterators with closure-generating folds (e.g. `vim.iter(items):fold(...)`) with standard `for` loops in performance-critical execution paths to avoid repeated closure allocation overhead.
