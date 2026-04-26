return {
    {
        "nvim-treesitter/nvim-treesitter",
        branch = "main",
        lazy = false,
        build = ":TSUpdate",
        config = function()
            local parsers = {
                "bash",
                "c",
                "diff",
                "html",
                "lua",
                "luadoc",
                "go",
                "markdown",
                "markdown_inline",
                "query",
                "vim",
                "vimdoc",
                "javascript",
                "typescript",
                "jsx",
                "tsx",
                "yaml",
                "proto",
            }
            require("nvim-treesitter").install(parsers)

            local function treesitter_try_attach(buf, language)
                -- check if parser exists and load it
                if not vim.treesitter.language.add(language) then
                    return
                end
                -- enables syntax highlighting and other treesitter features
                vim.treesitter.start(buf, language)

                -- enables treesitter based folds
                -- for more info on folds see `:help folds`
                vim.wo.foldexpr = "v:lua.vim.treesitter.foldexpr()"
                vim.wo.foldmethod = "expr"

                -- enables treesitter based indentation
                vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
            end

            local available_parsers = require("nvim-treesitter").get_available()
            vim.api.nvim_create_autocmd("FileType", {
                callback = function(args)
                    local buf, filetype = args.buf, args.match

                    local language = vim.treesitter.language.get_lang(filetype)
                    if not language then
                        return
                    end

                    local installed_parsers = require("nvim-treesitter").get_installed("parsers")

                    if vim.tbl_contains(installed_parsers, language) then
                        -- enable the parser if it is installed
                        treesitter_try_attach(buf, language)
                    elseif vim.tbl_contains(available_parsers, language) then
                        -- if a parser is available in `nvim-treesitter` auto install it, and enable it after the installation is done
                        require("nvim-treesitter").install(language):await(function()
                            treesitter_try_attach(buf, language)
                        end)
                    else
                        -- try to enable treesitter features in case the parser exists but is not available from `nvim-treesitter`
                        treesitter_try_attach(buf, language)
                    end
                end,
            })
        end,
    },
    {
        "nvim-treesitter/nvim-treesitter-textobjects",
        branch = "main",
        init = function()
            -- Disable entire built-in ftplugin mappings to avoid conflicts.
            -- See https://github.com/neovim/neovim/tree/master/runtime/ftplugin for built-in ftplugins.
            vim.g.no_plugin_maps = true

            -- Or, disable per filetype (add as you like)
            -- vim.g.no_python_maps = true
            -- vim.g.no_ruby_maps = true
            -- vim.g.no_rust_maps = true
            -- vim.g.no_go_maps = true
        end,
        dependencies = { "nvim-treesitter/nvim-treesitter" },
        config = function()
            require("nvim-treesitter-textobjects").setup({
                select = {
                    lookahead = true,
                    selection_modes = {
                        ["@parameter.outer"] = "v",
                        ["@function.outer"] = "V",
                    },
                    include_surrounding_whitespace = false,
                },
                move = {
                    -- whether to set jumps in the jumplist
                    set_jumps = true,
                },
            })

            local select = require("nvim-treesitter-textobjects.select")
            local swap = require("nvim-treesitter-textobjects.swap")
            local move = require("nvim-treesitter-textobjects.move")

            local map = vim.keymap.set

            local function textobj(key, query, group, desc)
                map({ "x", "o" }, key, function()
                    select.select_textobject(query, group)
                end, { desc = desc })
            end

            local function jump(key, fn, query, desc)
                map({ "n", "x", "o" }, key, function()
                    fn(query, "textobjects")
                end, { desc = desc })
            end

      -- ── Text Objects ────────────────────────────────────────────────────
      -- stylua: ignore start
      textobj("af", "@function.outer",    "textobjects", "Around function")
      textobj("if", "@function.inner",    "textobjects", "Inside function")
      textobj("ac", "@class.outer",       "textobjects", "Around class")
      textobj("ic", "@class.inner",       "textobjects", "Inside class")
      textobj("aa", "@parameter.outer",   "textobjects", "Around argument")
      textobj("ia", "@parameter.inner",   "textobjects", "Inside argument")
      textobj("ao", "@loop.outer",        "textobjects", "Around loop")
      textobj("io", "@loop.inner",        "textobjects", "Inside loop")
      textobj("ai", "@conditional.outer", "textobjects", "Around conditional")
      textobj("ii", "@conditional.inner", "textobjects", "Inside conditional")
      textobj("ar", "@return.outer",      "textobjects", "Around return")
      textobj("ir", "@return.inner",      "textobjects", "Inside return")
      textobj("as", "@local.scope",       "locals",      "Around scope")
            -- stylua: ignore end

            -- ── Swap ────────────────────────────────────────────────────────────
            map("n", "<leader>a", function()
                swap.swap_next("@parameter.inner")
            end, { desc = "Swap next parameter" })
            map("n", "<leader>A", function()
                swap.swap_previous("@parameter.inner")
            end, { desc = "Swap prev parameter" })

      -- ── Movement ────────────────────────────────────────────────────────
      -- stylua: ignore start
      jump("]f", move.goto_next_start,     "@function.outer",    "Next function start")
      jump("]F", move.goto_next_end,       "@function.outer",    "Next function end")
      jump("[f", move.goto_previous_start, "@function.outer",    "Prev function start")
      jump("[F", move.goto_previous_end,   "@function.outer",    "Prev function end")
      jump("]c", move.goto_next_start,     "@class.outer",       "Next class start")
      jump("]C", move.goto_next_end,       "@class.outer",       "Next class end")
      jump("[c", move.goto_previous_start, "@class.outer",       "Prev class start")
      jump("[C", move.goto_previous_end,   "@class.outer",       "Prev class end")
      jump("]o", move.goto_next_start,     "@loop.outer",        "Next loop")
      jump("[o", move.goto_previous_start, "@loop.outer",        "Prev loop")
      jump("]i", move.goto_next_start,     "@conditional.outer", "Next conditional")
      jump("[i", move.goto_previous_start, "@conditional.outer", "Prev conditional")
            -- stylua: ignore end
        end,
    },
    {
        "nvim-treesitter/nvim-treesitter-context",
        opts = {
            enable = true, -- Enable this plugin (Can be enabled/disabled later via commands)
            multiwindow = false, -- Disable multiwindow support for better performance
            max_lines = 4, -- Show up to 4 lines of context (optimal balance)
            min_window_height = 15, -- Only show context when window is at least 15 lines tall
            line_numbers = true, -- Show line numbers in context (helpful for navigation)
            multiline_threshold = 20, -- Show context for scopes with 20+ lines (more selective)
            trim_scope = "outer", -- Discard outer context lines when max_lines exceeded
            mode = "cursor", -- Calculate context from top visible line (better for search)
            -- Visual separator makes context boundary clear
            separator = "─", -- Unicode horizontal line separator
            zindex = 20, -- Keep context above other floating windows
        },
    },
}
