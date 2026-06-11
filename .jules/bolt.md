## 2024-05-19 - Statusline Render Loop Optimization
**Learning:** Found significant overhead in statusline rendering due to table allocation (`mode_to_str`, `special_icons`, `severities`), closure creation (`wrap_component`, `concat_components`), and `vim.iter` overhead.
**Action:** Hoist these tables and functions to the module scope to avoid re-allocation and garbage collection during every screen redraw, as recommended by Neovim performance best practices.
