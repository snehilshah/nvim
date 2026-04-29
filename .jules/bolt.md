## 2024-05-18 - Memoize vim.fn.system in UI formatters
**Learning:** Synchronous `vim.fn.system` calls in frequently executed paths like UI formatters (e.g., `current_line_blame_formatter`) can introduce significant process spawning overhead (around ~4ms per call), which degrades performance when moving the cursor or recalculating UI states.
**Action:** When a system call is required in a frequently run function and its output is largely static for a session (like fetching `git config user.name`), cache the result in a local upvalue at the module level.
