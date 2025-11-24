local servers = {
	"lua_ls", -- Lua language server
	-- "gopls",      -- Go language server
	-- "zls",        -- Zig language server
	"ts_ls", -- TypeScript/JavaScript language server
	-- "rust-analyzer", -- Rust language server
	-- "tailwindcss", -- Tailwind CSS language server
	"html", -- HTML language server
	"cssls", -- CSS language server
}
return {
	{
		"neovim/nvim-lspconfig",
		dependencies = {
			"saghen/blink.cmp"
		},
		event = { "BufReadPre", "BufNewFile" },
		config = function()
			local handlers = {
				["textDocument/hover"] = vim.lsp.with(
					vim.lsp.handlers.hover,
					{ border = "rounded" }
				),
				["textDocument/signatureHelp"] = vim.lsp.with(
					vim.lsp.handlers.signature_help,
					{ border = "rounded" }
				),
			}
			local capabilities = {
				textDocument = {
					foldingRange = {
						dynamicRegistration = false,
						lineFoldingOnly = true
					}
				}
			}
			capabilities = require('blink.cmp').get_lsp_capabilities(capabilities)

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
				{ path = "LazyVim",            words = { "LazyVim" } },
			},
		},
	},
	{
		"j-hui/fidget.nvim",
		opts = {},
		enabled = false,
		config = function()
			vim.api.nvim_create_autocmd("LspAttach", {
				group = vim.api.nvim_create_augroup("kickstart-lsp-attach", { clear = true }),
				callback = function(args)
					local map = function(keys, func, desc, mode)
						mode = mode or "n"
						vim.keymap.set(mode, keys, func, { buffer = args.buf, desc = "LSP: " .. desc })
					end
					local bufnr = args.buf
					local opts = { buffer = bufnr, silent = true }

					-- Rename the variable under your cursor.
					map("grn", vim.lsp.buf.rename, "[R]e[n]ame")
					-- Execute a code action, usually your cursor needs to be on top of an error
					-- or a suggestion from your LSP for this to activate.
					map("gra", vim.lsp.buf.code_action, "[G]oto Code [A]ction", { "n", "x" })
					-- Find references for the word under your cursor.
					-- map("grr", require("telescope.builtin").lsp_references, "[G]oto [R]eferences")
					-- Jump to the implementation of the word under your cursor.
					--  Useful when your language has ways of declaring types without an actual implementation.
					map("gri", vim.lsp.buf.implementation, "[G]oto [I]mplementation")
					-- Jump to the definition of the word under your cursor.
					--  This is where a variable was first declared, or where a function is defined, etc.
					--  To jump back, press <C-t>.
					map("grd", vim.lsp.buf.definition, "[G]oto [D]efinition")
					--ERROR: This is not Goto Definition, this is Goto Declaration.
					--  For example, in C this would take you to the header.
					map("grD", vim.lsp.buf.declaration, "[G]oto [D]eclaration")
					-- Jump to the type definition of the word under your cursor.
					--  Useful when you're not sure what type a variable is and you want to see
					--  the definition of its *type*, not where it was *defined*.
					map("grt", vim.lsp.buf.type_definition, "[G]oto [T]ype Definition")
					-- Fuzzy find all the symbols in your current document.
					--  Symbols are things like variables, functions, types, etc.
					-- map("gO", require("telescope.builtin").lsp_document_symbols, "Open Document Symbols")
					-- Fuzzy find all the symbols in your current workspace.
					--  Similar to document symbols, except searches over your entire project.
					-- map("gW", require("telescope.builtin").lsp_dynamic_workspace_symbols, "Open Workspace Symbols")
					-- Jump to the type of the word under your cursor.
					--  Useful when you're not sure what type a variable is and you want to see
					--  the definition of its *type*, not where it was *defined*.
					-- map("grt", require("telescope.builtin").lsp_type_definitions, "[G]oto [T]ype Definition")
					-- vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
					vim.keymap.set("n", "gry", vim.lsp.buf.type_definition, opts)
					vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
					vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)

					-- Only set up document highlighting if the LSP client supports it
					local client = vim.lsp.get_client_by_id(args.data.client_id)
					local highlight_group_created = false
					if client and client.supports_method("textDocument/documentHighlight") then
						local highlight_augroup =
							vim.api.nvim_create_augroup("kickstart-lsp-highlight", { clear = false })
						highlight_group_created = true
						vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
							buffer = args.buf,
							group = highlight_augroup,
							callback = vim.lsp.buf.document_highlight,
						})
						vim.api.nvim_create_autocmd({ "CursorMoved", "CursorMovedI" }, {
							buffer = args.buf,
							group = highlight_augroup,
							callback = vim.lsp.buf.clear_references,
						})
					end
					vim.api.nvim_create_autocmd("LspDetach", {
						group = vim.api.nvim_create_augroup("kickstart-lsp-detach", { clear = true }),
						callback = function(event2)
							vim.lsp.buf.clear_references()
							if highlight_group_created then
								vim.api.nvim_clear_autocmds({ group = "kickstart-lsp-highlight", buffer = event2.buf })
							end
						end,
					})
					map("<leader>th", function()
						vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled({ bufnr = args.buf }))
					end, "[t]oggle inlay [h]ints")

					-- Enable inlay hints by default if the client supports it
					if client and client.supports_method("textDocument/inlayHint") then
						vim.lsp.inlay_hint.enable(true, { bufnr = args.buf })
					end
				end,
			})
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
		end,
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
		}
	}
}
