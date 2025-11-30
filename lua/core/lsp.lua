-- Custom LSP commands for enhanced information
vim.api.nvim_create_user_command("LspCapabilities", function()
	local bufnr = vim.api.nvim_get_current_buf()
	local clients = vim.lsp.get_clients({ bufnr = bufnr })

	if #clients == 0 then
		print("No LSP clients attached")
		return
	end

	for _, client in ipairs(clients) do
		print("Capabilities for " .. client.name .. ":")
		local caps = client.server_capabilities

		if not caps then
			print("  No capabilities available")
			print("")
			goto continue
		end

		local capability_list = {
			{ "Completion", caps.completionProvider },
			{ "Hover", caps.hoverProvider },
			{ "Signature Help", caps.signatureHelpProvider },
			{ "Go to Definition", caps.definitionProvider },
			{ "Go to Declaration", caps.declarationProvider },
			{ "Go to Implementation", caps.implementationProvider },
			{ "Go to Type Definition", caps.typeDefinitionProvider },
			{ "Find References", caps.referencesProvider },
			{ "Document Highlight", caps.documentHighlightProvider },
			{ "Document Symbol", caps.documentSymbolProvider },
			{ "Workspace Symbol", caps.workspaceSymbolProvider },
			{ "Code Action", caps.codeActionProvider },
			{ "Code Lens", caps.codeLensProvider },
			{ "Document Formatting", caps.documentFormattingProvider },
			{ "Document Range Formatting", caps.documentRangeFormattingProvider },
			{ "Rename", caps.renameProvider },
			{ "Folding Range", caps.foldingRangeProvider },
			{ "Selection Range", caps.selectionRangeProvider },
			{ "Inlay Hint", caps.inlayHintProvider },
		}

		for _, cap in ipairs(capability_list) do
			local status = cap[2] and "✓" or "✗"
			print(string.format("  %s %s", status, cap[1]))
		end
		print("")
		::continue::
	end
end, { desc = "Show all LSP capabilities" })

vim.api.nvim_create_user_command("LspInfoCustom", function()
	local bufnr = vim.api.nvim_get_current_buf()
	local clients = vim.lsp.get_clients({ bufnr = bufnr })

	print("═══════════════════════════════════")
	print("           LSP INFORMATION          ")
	print("═══════════════════════════════════")
	print("")

	print("󰈙 Language client log: " .. vim.lsp.get_log_path())
	print("󰈔 Detected filetype: " .. vim.bo.filetype)
	print("󰈮 Buffer: " .. bufnr)
	print("󰈔 Root directory: " .. (vim.fn.getcwd() or "N/A"))
	print("")

	if #clients == 0 then
		print("󰅚 No LSP clients attached to buffer " .. bufnr)
		print("")
		print("Possible reasons:")
		print("  • No language server installed for " .. vim.bo.filetype)
		print("  • Language server not configured")
		print("  • Not in a project root directory")
		print("  • File type not recognized")
		return
	end

	print("󰒋 LSP clients attached to buffer " .. bufnr .. ":")
	print("─────────────────────────────────")

	for i, client in ipairs(clients) do
		print(string.format("󰌘 Client %d: %s", i, client.name))
		print("  ID: " .. client.id)
		print("  Root dir: " .. (client.config.root_dir or "Not set"))
		print("  Command: " .. table.concat(client.config.cmd or {}, " "))
		print("  Filetypes: " .. table.concat(client.config.filetypes or {}, ", "))

		if client.is_stopped() then
			print("  Status: 󰅚 Stopped")
		else
			print("  Status: 󰄬 Running")
		end

		if client.workspace_folders and #client.workspace_folders > 0 then
			print("  Workspace folders:")
			for _, folder in ipairs(client.workspace_folders) do
				print("    • " .. folder.name)
			end
		end

		local attached_buffers = {}
		for buf, _ in pairs(client.attached_buffers or {}) do
			table.insert(attached_buffers, buf)
		end
		print("  Attached buffers: " .. #attached_buffers)

		local caps = client.server_capabilities
		local key_features = {}
		if caps.completionProvider then
			table.insert(key_features, "completion")
		end
		if caps.hoverProvider then
			table.insert(key_features, "hover")
		end
		if caps.definitionProvider then
			table.insert(key_features, "definition")
		end
		if caps.documentFormattingProvider then
			table.insert(key_features, "formatting")
		end
		if caps.codeActionProvider then
			table.insert(key_features, "code_action")
		end

		if #key_features > 0 then
			print("  Key features: " .. table.concat(key_features, ", "))
		end

		print("")
	end

	local diagnostics = vim.diagnostic.get(bufnr)
	if #diagnostics > 0 then
		print("󰒡 Diagnostics Summary:")
		local counts = { ERROR = 0, WARN = 0, INFO = 0, HINT = 0 }

		for _, diagnostic in ipairs(diagnostics) do
			local severity = vim.diagnostic.severity[diagnostic.severity]
			counts[severity] = counts[severity] + 1
		end

		print("  󰅚 Errors: " .. counts.ERROR)
		print("  󰀪 Warnings: " .. counts.WARN)
		print("  󰋽 Info: " .. counts.INFO)
		print("  󰌶 Hints: " .. counts.HINT)
		print("  Total: " .. #diagnostics)
	else
		print("󰄬 No diagnostics")
	end

	print("")
	print("Use :LspLog to view detailed logs")
	print("Use :LspCapabilities for full capability list")
end, { desc = "Show comprehensive LSP information" })

-- DIAGNOSTICS CONFIGURATION
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

-- ON LSP ATTACH CONFIGURE KEYMAPS, INLAY HINTS, DOC HIGHLIGHT
vim.api.nvim_create_autocmd("LspAttach", {
	group = vim.api.nvim_create_augroup("UserLspConfig", { clear = true }),
	callback = function(args)
		local client = vim.lsp.get_client_by_id(args.data.client_id)
		local bufnr = args.buf

		-- Helper function for cleaner keymap definitions
		local map = function(keys, func, desc, mode)
			mode = mode or "n"
			vim.keymap.set(mode, keys, func, { buffer = bufnr, desc = "LSP: " .. desc })
		end

		-- KEYMAPS
		map("grn", vim.lsp.buf.rename, "[R]e[n]ame")
		map("gra", vim.lsp.buf.code_action, "[G]oto Code [A]ction", { "n", "x" })
		map("gi", vim.lsp.buf.implementation, "[G]oto [I]mplementation")
		map("gd", vim.lsp.buf.definition, "[G]oto [D]efinition")
		map("gD", vim.lsp.buf.declaration, "[G]oto [D]eclaration")
		map("grt", vim.lsp.buf.type_definition, "[G]oto [T]ype Definition")
		map("K", vim.lsp.buf.hover, "Hover Documentation")
		map("<leader>th", function()
			vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled({ bufnr = bufnr }))
		end, "[T]oggle Inlay [H]ints")

		-- INLAY HINTS
		if client and client.supports_method("textDocument/inlayHint") then
			vim.lsp.inlay_hint.enable(true, { bufnr = bufnr })
		end

		-- DOCUMENT HIGHLIGHT (highlight symbol under cursor)
		if client and client.supports_method("textDocument/documentHighlight") then
			local highlight_group = vim.api.nvim_create_augroup("LspDocHighlight_" .. bufnr, { clear = true })
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

-- LSP DETACH CLEANUP

vim.api.nvim_create_autocmd("LspDetach", {
	group = vim.api.nvim_create_augroup("UserLspDetach", { clear = true }),
	callback = function(args)
		vim.lsp.buf.clear_references()
		pcall(vim.api.nvim_del_augroup_by_name, "LspDocHighlight_" .. args.buf)
	end,
})
