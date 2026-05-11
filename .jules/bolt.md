## 2024-05-24 - Hoisting statusline rendering helpers
**Learning:** The Neovim statusline redraws very frequently. Defining nested helper functions inside `M.render` and using `vim.iter():fold(...)` causes unnecessary closure allocation and iterator overhead.
**Action:** Move helper functions to the module level (hoisting them out of the render loop) and use simple `for` loops in hot, performance-critical code paths like UI rendering.
