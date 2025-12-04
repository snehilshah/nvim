local servers = {
	"clangd", -- C/C++ language server
	"cssls", -- CSS language server
	"html", -- HTML language server
	"lua_ls", -- Lua language server
	-- "gopls",      -- Go language server managed by go.nvim
	-- "zls",        -- Zig language server
	"ts_ls", -- TypeScript/JavaScript language server
	"copilot",
	-- "rust-analyzer", -- Rust language server
	-- "tailwindcss", -- Tailwind CSS language server
}
return {
	{
		"neovim/nvim-lspconfig",
		dependencies = {
			"saghen/blink.cmp",
		},
		event = { "BufReadPre", "BufNewFile" },
		config = function()
			local handlers = {
				["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = "rounded" }),
				["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, { border = "rounded" }),
			}
			local capabilities = {
				textDocument = {
					foldingRange = {
						dynamicRegistration = false,
						lineFoldingOnly = true,
					},
				},
			}
			capabilities = require("blink.cmp").get_lsp_capabilities(capabilities)

			for _, lsp_server in ipairs(servers) do
				local config = {
					capabilities = capabilities,
					handlers = handlers,
					completions = {
						completeFunctionCalls = true,
					},
				}
				-- NOTE: can do anything for special servers here
				-- if lsp_server == "ts_ls" then
				-- 	config.completions = {
				-- 		completeFunctionCalls = true,
				-- 	}
				-- end
				vim.lsp.config(lsp_server, config)
				vim.lsp.enable(lsp_server)
			end
		end,
	},
	{
		"folke/lazydev.nvim",
		ft = "lua",
		opts = {
			library = {
				{ path = "${3rd}/luv/library", words = { "vim%.uv" } },
				"LazyVim",
				{ path = "LazyVim", words = { "LazyVim" } },
			},
		},
	},
	{
		"j-hui/fidget.nvim",
		event = "LspAttach",
		enabled = true,
		opts = {},
	},
	{
		"rachartier/tiny-code-action.nvim",
		dependencies = {
			{ "nvim-lua/plenary.nvim" },
			{ "folke/snacks.nvim" },
		},
		event = "LspAttach",
		opts = {
			--- The backend to use, currently only "vim", "delta", "difftastic", "diffsofancy" are supported
			backend = "delta",

			picker = "snacks",
			backend_opts = {
				delta = {
					header_lines_to_remove = 4,
					args = {
						"--line-numbers",
					},
				},
			},
			resolve_timeout = 100,

			notify = {
				enabled = true,
				on_empty = true,
			},

			-- You can set the highlight like so: { link = "DiagnosticError" } or  like nvim_set_hl ({ fg ..., bg..., bold..., ...})
			signs = {
				quickfix = { "", { link = "DiagnosticWarning" } },
				others = { "", { link = "DiagnosticWarning" } },
				refactor = { "", { link = "DiagnosticInfo" } },
				["refactor.move"] = { "󰪹", { link = "DiagnosticInfo" } },
				["refactor.extract"] = { "", { link = "DiagnosticError" } },
				["source.organizeImports"] = { "", { link = "DiagnosticWarning" } },
				["source.fixAll"] = { "󰃢", { link = "DiagnosticError" } },
				["source"] = { "", { link = "DiagnosticError" } },
				["rename"] = { "󰑕", { link = "DiagnosticWarning" } },
				["codeAction"] = { "", { link = "DiagnosticWarning" } },
			},
		},
	},
}
