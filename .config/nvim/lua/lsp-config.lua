vim.lsp.config("gopls", {
	-- Use gofumpt for stricter formatting
	settings = {
		gopls = {
			gofumpt = true,
		},
	},
})

vim.lsp.config("lua_ls", {
	settings = {
		Lua = {
			runtime = {
				version = "LuaJIT",
			},
			diagnostics = {
				globals = {
					"vim",
					"require",
				},
			},
			workspace = {
				library = vim.api.nvim_get_runtime_file("", true),
			},
			telemetry = {
				enable = false,
			},
		},
	},
})

vim.diagnostic.config({
	virtual_text = true, -- Shows errors inline at the end of the line
	signs = true, -- Shows icons in the gutter/sign column
	update_in_insert = true, -- Update errors automatically while typing in Insert Mode
	underline = true, -- Underline the error text
})
