## 2024-05-18 - Statusline optimization & 0.12 migration
**Learning:** Nested helper functions and dynamic static table allocations inside performance-critical functions like `M.render` add overhead. Also, reverse mapping `vim.diagnostic.severity` strings uses unnecessary resources.
**Action:** Extracted helper functions `wrap_component` and `concat_components` outside `M.render`, hoisted large static tables to file level, and replaced high-level iterator `vim.iter` with a `for` loop to minimize allocation. Replaced `vim.diagnostic.severity` properties with raw integer indexing.
