-- ============================================================================
-- LSP Configuration (Neovim 0.11+ Native Approach)
-- ============================================================================
-- This config uses Neovim's native LSP support with nvim-lspconfig for configs.
-- LSPs/formatters/linters should be installed globally (see docs/install.md).
-- Config files in after/lsp/*.lua override/extend the base configs.
-- ============================================================================

return {
  {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
      "saghen/blink.cmp", -- For LSP capabilities
    },
    config = function()
      -- ============================================================================
      -- Common LSP Configuration (applies to ALL language servers)
      -- ============================================================================
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

      -- Set global defaults for all language servers
      vim.lsp.config("*", {
        capabilities = capabilities,
        root_markers = { ".git" },
      })

      -- ============================================================================
      -- Enable Language Servers
      -- ============================================================================
      -- These will use configs from nvim-lspconfig's lsp/*.lua files,
      -- merged with your after/lsp/*.lua overrides
      vim.lsp.enable({
        "lua_ls", -- Lua
        "gopls", -- Go, you might see 2 processes, spawned for gopls, most likely one of them is just telemetry, check `pgrep -a gopls`
        "tsgo", -- TypeScript/JavaScript (switched from ts_ls)
        "angularls", -- Angular Language Service (template intelligence, requires @angular/language-server)
        "biome", -- Biome (linting/formatting for JS/TS/JSON - only activates with biome.json)
        "bashls", -- Bash/Shell
        "cssls", -- CSS/SCSS/Less
        "html", -- HTML
        "jsonls", -- JSON
        "yamlls", -- YAML
        -- TODO: Re-enable markdown_oxide when needed
        -- "markdown_oxide", -- Markdown
        "dockerls", -- Docker
        "clangd", -- C/C++
        "tailwindcss", -- Tailwind CSS
        "emmet_language_server", -- Emmet
        "harper_ls", -- Grammar/spell checking for markdown, gitcommit, etc.
      })

      -- ============================================================================
      -- LSP Keymaps Setup
      -- ============================================================================
      local function setup_keymaps(bufnr)
        local function map(mode, lhs, rhs, desc)
          vim.keymap.set(mode, lhs, rhs, { buffer = bufnr, desc = "LSP: " .. desc, silent = true })
        end

        -- Navigation
        -- ARCHIVED: Navigation keymaps delegated to Snacks pickers for better UX
        -- Snacks handles: gd (definition), gD (declaration), gi (implementation),
        --                 gr (references), gt (type definition)
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

          -- Inlay hints disabled by default (toggle with <leader>ih)
          if client.server_capabilities.inlayHintProvider and vim.lsp.inlay_hint then
            vim.lsp.inlay_hint.enable(false, { bufnr = bufnr })
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
}
