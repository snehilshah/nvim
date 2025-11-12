return {
	{
		"folke/lazydev.nvim",

		ft = "lua",

		opts = {

			library = {

				{ path = "${3rd}/luv/library", words = { "vim%.uv" } },
			},
		},
	},
	{
		"j-hui/fidget.nvim",
		opts = {},
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

					-- Auto-format on save for ALL language servers
					vim.api.nvim_create_autocmd("BufWritePre", {
						buffer = bufnr,
						callback = function()
							vim.lsp.buf.format({ bufnr = bufnr })
						end,
					})

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
					-- WARN: This is not Goto Definition, this is Goto Declaration.
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
}
