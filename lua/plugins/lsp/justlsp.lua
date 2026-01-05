return {
  {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
      "mason-org/mason-lspconfig.nvim",
    },
    config = function()
      -- ============================================================================
      -- LSP Keymaps Setup
      -- ============================================================================
      local function setup_keymaps(bufnr)
        local function map(mode, lhs, rhs, desc)
          vim.keymap.set(mode, lhs, rhs, { buffer = bufnr, desc = "LSP: " .. desc, silent = true })
        end

        -- Navigation
        -- let snacks handle these events
        -- map("n", "gd", vim.lsp.buf.definition, "Go to definition")
        -- map("n", "gD", vim.lsp.buf.declaration, "Go to declaration")
        -- map("n", "gi", vim.lsp.buf.implementation, "Go to implementation")
        -- map("n", "gr", vim.lsp.buf.references, "Go to references")
        -- map("n", "gt", vim.lsp.buf.type_definition, "Go to type definition")

        -- Information
        -- map("n", "K", vim.lsp.buf.hover, "Hover documentation")
        map("n", "K", function()
          vim.lsp.buf.hover({
            border = "rounded", -- Sets a single line border for hover
            max_height = 25, -- Sets a maximum height
            max_width = 120, -- Sets a maximum width
          })
        end, "Hover documentation")

        map("n", "<C-k>", function()
          vim.lsp.buf.signature_help({ border = "rounded" })
        end, "Signature help")
        map("i", "<C-k>", function()
          vim.lsp.buf.signature_help({ border = "rounded" })
        end, "Signature help")

        -- Code actions & Refactoring
        map({ "n", "x" }, "ga", vim.lsp.buf.code_action, "Code action")
        map("n", "<leader>rn", vim.lsp.buf.rename, "Rename symbol")
        -- Note: <leader>ca is mapped to tiny-code-action in keymaps.lua
        -- Note: <leader>cl is mapped to codelens.run in keymaps.lua

        -- Diagnostics
        map("n", "[d", function()
          vim.diagnostic.jump({ count = -1 })
        end, "Previous diagnostic")
        map("n", "]d", function()
          vim.diagnostic.jump({ count = 1 })
        end, "Next diagnostic")
        map("n", "<leader>cd", vim.diagnostic.open_float, "Show diagnostic")

        -- Workspace
        map("n", "<leader>wa", vim.lsp.buf.add_workspace_folder, "Add workspace folder")
        map("n", "<leader>wr", vim.lsp.buf.remove_workspace_folder, "Remove workspace folder")
        map("n", "<leader>wl", function()
          print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
        end, "List workspace folders")

        -- Inlay hints toggle (useful for manual control)
        if vim.lsp.inlay_hint then
          map("n", "<leader>ih", function()
            vim.lsp.inlay_hint.enable(
              not vim.lsp.inlay_hint.is_enabled({ bufnr = bufnr }),
              { bufnr = bufnr }
            )
            vim.notify(
              "Inlay Hints "
                .. (vim.lsp.inlay_hint.is_enabled({ bufnr = bufnr }) and "Enabled" or "Disabled")
            )
          end, "Toggle inlay hints")
        end
      end

      -- ============================================================================
      -- LSP Attach Handler
      -- ============================================================================
      vim.api.nvim_create_autocmd("LspAttach", {
        group = vim.api.nvim_create_augroup("UserLspConfig", { clear = true }),
        callback = function(args)
          local bufnr = args.buf
          local client = vim.lsp.get_client_by_id(args.data.client_id)

          if not client then
            return
          end

          -- Setup keymaps for this buffer
          setup_keymaps(bufnr)

          -- Enable completion triggered by <c-x><c-o>
          vim.bo[bufnr].omnifunc = "v:lua.vim.lsp.omnifunc"

          -- Enable inlay hints if supported (Neovim 0.10+)
          if client.server_capabilities.inlayHintProvider and vim.lsp.inlay_hint then
            vim.lsp.inlay_hint.enable(true, { bufnr = bufnr })
          end

          -- Document highlight on cursor hold
          if client.server_capabilities.documentHighlightProvider then
            local highlight_group =
              vim.api.nvim_create_augroup("LspDocumentHighlight_" .. bufnr, { clear = true })
            vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
              buffer = bufnr,
              group = highlight_group,
              callback = vim.lsp.buf.document_highlight,
            })
            vim.api.nvim_create_autocmd({ "CursorMoved", "CursorMovedI" }, {
              buffer = bufnr,
              group = highlight_group,
              callback = vim.lsp.buf.clear_references,
            })
          end
        end,
      })

      -- ============================================================================
      -- Diagnostic Configuration
      -- ============================================================================
      vim.diagnostic.config({
        severity_sort = true,
        float = { border = "rounded", source = true },
        underline = true,
        update_in_insert = false,
        signs = {
          text = {
            [vim.diagnostic.severity.ERROR] = "󰅚 ",
            [vim.diagnostic.severity.WARN] = "󰀪 ",
            [vim.diagnostic.severity.INFO] = "󰋽 ",
            [vim.diagnostic.severity.HINT] = "󰌶 ",
          },
          numhl = {
            [vim.diagnostic.severity.ERROR] = "ErrorMsg",
            [vim.diagnostic.severity.WARN] = "WarningMsg",
          },
        },
        virtual_text = false, -- Disabled because using tiny-diagnostic plugin
      })

      -- ============================================================================
      -- LSP Detach Cleanup
      -- ============================================================================
      vim.api.nvim_create_autocmd("LspDetach", {
        group = vim.api.nvim_create_augroup("UserLspDetach", { clear = true }),
        callback = function(args)
          vim.lsp.buf.clear_references()
          pcall(vim.api.nvim_del_augroup_by_name, "LspDocumentHighlight_" .. args.buf)
        end,
      })
    end,
  },
  {
    "mason-org/mason.nvim",
    lazy = false,
    cmd = "Mason",
    config = function()
      require("mason").setup()
    end,
  },
  {
    "mason-org/mason-lspconfig.nvim",
    lazy = false,
    dependencies = {
      "neovim/nvim-lspconfig",
      "saghen/blink.cmp",
    },
    config = function()
      local mason_lspconfig = require("mason-lspconfig")
      local lspconfig = require("lspconfig")

      -- Capabilities: blink.cmp handles merging automatically
      local capabilities = require("blink.cmp").get_lsp_capabilities({
        textDocument = {
          -- Folding capabilities for nvim-ufo
          foldingRange = {
            dynamicRegistration = false,
            lineFoldingOnly = true,
          },
        },
      })

      -- Common LSP config options
      local common_config = {
        capabilities = capabilities,
        completion = {
          completeFunctionCalls = true,
        },
      }

      -- Default handler for servers without custom config
      local function default_setup(server_name)
        lspconfig[server_name].setup(common_config)
      end

      -- Custom handlers for servers with specific config
      local handlers = {
        default_setup,
        ["lua_ls"] = function()
          lspconfig.lua_ls.setup(vim.tbl_deep_extend("force", common_config, {
            settings = {
              Lua = {
                diagnostics = {
                  globals = { "vim" },
                  disable = { "inject-field", "undefined-field", "missing-fields" },
                },
                runtime = {
                  version = "LuaJIT",
                },
                workspace = {
                  library = {
                    vim.env.VIMRUNTIME,
                  },
                  checkThirdParty = false,
                },
                telemetry = {
                  enable = false,
                },
              },
            },
          }))
        end,
      }
      -- Setup mason-lspconfig with handlers
      mason_lspconfig.setup({
        handlers = handlers,
      })
    end,
  },
  {
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    lazy = false,
    dependencies = {
      "mason-org/mason-lspconfig.nvim",
    },
    config = function()
      require("mason-tool-installer").setup({
        ensure_installed = {
          -- Language Servers
          "lua_ls",
          "gopls",
          -- "ts_ls",  -- Uncomment and comment tsgo to switch back
          "tsgo",
          "biome", -- JS/TS linting + formatting + code actions
          "bashls",
          "cssls",
          "html",
          "jsonls",
          "yamlls",
          "markdown-oxide",
          "docker_language_server",
          "clangd",
          "buf",

          -- Linters
          "eslint_d",
          "luacheck",
          "golangci-lint",
          -- "cppcheck", -- Not in Mason, used brew install cppcheck
          "shellcheck",
          "markdownlint-cli2",
          "jsonlint",
          "htmlhint",
          "stylelint",
          "hadolint",

          -- Formatters
          "stylua",
          "goimports",
          "gofumpt",
          "prettier",
          "shfmt",
          "clang-format",
          -- "dockerfmt" -- Not in Mason, brew install dockerfmt

          -- All in one
          "tombi",
          "biome",
          -- ai
          -- "copilot",
        },
      })
    end,
  },
}
