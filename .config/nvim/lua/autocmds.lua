vim.api.nvim_create_autocmd("BufWritePre", {
	pattern = "*",
	callback = function(args)
		local clients = vim.lsp.get_clients({ bufnr = args.buf })
		local has_provider = false
		local has_formatter = false

		for _, client in pairs(clients) do
			if client.server_capabilities.codeActionProvider then
				has_provider = true
			end
			if client.server_capabilities.documentFormattingProvider then
				has_formatter = true
			end
		end

		if has_provider then
			-- Organize imports
			vim.lsp.buf.code_action({ context = { only = { "source.organizeImports" } }, apply = true })
		end

		-- Format
		if has_formatter then
			vim.lsp.buf.format({ async = false })
		else
			require("conform").format({ bufnr = args.buf })
		end
	end,
})

-- Set up automatic LSP hover on CursorHold
vim.api.nvim_create_autocmd("CursorHold", {
	callback = function()
		-- Only trigger if an LSP is actually attached to the buffer
		if next(vim.lsp.get_clients({ bufnr = 0 })) ~= nil then
			vim.lsp.buf.hover({ focusable = false })
		end
	end,
})

-- Add lsp keybinds if lsp is attached
vim.api.nvim_create_autocmd("LspAttach", {
	group = vim.api.nvim_create_augroup("LspMappings", { clear = true }),
	callback = function(args)
		local opts = { buffer = args.buf }

		vim.keymap.set("n", "gR", vim.lsp.buf.rename, opts)
		--vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
		vim.keymap.set("n", "gr", ":Telescope lsp_references<CR>", opts)
		vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
		vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
		vim.keymap.set("n", "ga", vim.lsp.buf.code_action, opts)
		vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
		vim.keymap.set("n", "gh", vim.lsp.buf.signature_help, opts)
		vim.keymap.set("n", "gs", vim.lsp.buf.signature_help, opts)
		vim.keymap.set("n", "go", vim.lsp.buf.type_definition, opts)
		vim.keymap.set({ "n", "x" }, "gf", vim.lsp.buf.format, opts)
	end,
})

vim.cmd([[set completeopt+=menuone,noselect,popup]])
vim.api.nvim_create_autocmd("LspAttach", {
	group = vim.api.nvim_create_augroup("LspFunctions", { clear = true }),
	callback = function(args)
		local client = vim.lsp.get_client_by_id(args.data.client_id)

		-- if client:supports_method('textDocument/inlayHint') then
		--   vim.lsp.inlay_hint.enable(true, {bufnr = args.buf})
		-- end

		if client:supports_method("textDocument/completion") then
			vim.lsp.completion.enable(true, client.id, args.buf, { autotrigger = true })
		end
	end,
})
