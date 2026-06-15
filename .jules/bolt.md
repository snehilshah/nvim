
## 2024-05-18 - Avoid Table Allocations in Render Loops
**Learning:** In Neovim, statuslines are evaluated frequently. Defining static tables like `mode_to_str` or `severities` and creating closures within the `render` function causes unnecessary allocations and garbage collection overhead.
**Action:** Always hoist static mapping tables and helper functions (by explicitly passing parameters rather than capturing them as upvalues) to the module scope in performance-critical rendering loops.
