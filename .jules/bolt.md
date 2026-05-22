## 2026-05-22 - Hoist Lua allocations and nested functions
**Learning:** In performance-critical Lua code like statusline rendering, hoisting static table allocations and nested helper functions to the module scope, and replacing high-level iterators with standard for loops, minimizes closure allocation and iterator overhead.
**Action:** Always check frequently executed loops and render paths for inner functions or static tables that can be pulled up to module scope.
