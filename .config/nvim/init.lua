vim.pack.add({
	-- Theme that uses terminal colors
	{ src = "https://github.com/bjarneo/pixel.nvim" },

	-- Native nvim lsp config
	{ src = "https://github.com/neovim/nvim-lspconfig" },

	-- Mason for installing lsps
	{ src = "https://github.com/mason-org/mason.nvim" },
	{ src = "https://github.com/mason-org/mason-lspconfig.nvim" },
	{ src = "https://github.com/WhoIsSethDaniel/mason-tool-installer.nvim" },

	-- Telescope for the nice file browser
	{ src = "https://github.com/nvim-telescope/telescope-file-browser.nvim" },
	{ src = "https://github.com/nvim-telescope/telescope.nvim" },
	{ src = "https://github.com/nvim-lua/plenary.nvim" },

	-- We like column limits here
	{ src = "https://github.com/lukas-reineke/virt-column.nvim" },

	-- Git info in gutter
	{ src = "https://github.com/lewis6991/gitsigns.nvim" },
})

-- TODO: Pull lsp settings into a separate file
require("mason").setup()
require("mason-lspconfig").setup()
require("mason-tool-installer").setup({
	ensure_installed = {
		"lua_ls",
		"stylua",
		"gopls",
	},
})

vim.api.nvim_create_autocmd("BufWritePre", {
	pattern = "*",
	callback = function()
		local clients = vim.lsp.get_clients({ bufnr = 0 })
		local has_provider = false

		for _, client in pairs(clients) do
			if client.server_capabilities.codeActionProvider then
				has_provider = true
				break
			end
		end

		if has_provider then
			-- Organize imports
			vim.lsp.buf.code_action({ context = { only = { "source.organizeImports" } }, apply = true })
		end

		-- Format
		vim.lsp.buf.format({ async = false })
	end,
})

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

-- Set up automatic LSP hover on CursorHold
vim.api.nvim_create_autocmd("CursorHold", {
	callback = function()
		-- Only trigger if an LSP is actually attached to the buffer
		if next(vim.lsp.get_clients({ bufnr = 0 })) ~= nil then
			vim.lsp.buf.hover({ focusable = false })
		end
	end,
})

-- Adjust the delay time (default is 4000ms / 4 seconds)
vim.o.updatetime = 500

require("virt-column").setup({
	char = "│", -- Full-height line
	highlight = "LineNr",
})

vim.diagnostic.config({
	virtual_text = true, -- Shows errors inline at the end of the line
	signs = true, -- Shows icons in the gutter/sign column
	update_in_insert = true, -- Update errors automatically while typing in Insert Mode
	underline = true, -- Underline the error text
})

vim.cmd.colorscheme("pixel")

vim.o.number = true -- Enable line numbers
vim.o.relativenumber = true -- Relative numbers
vim.o.tabstop = 4 -- Number of spaces a tab represents
vim.o.shiftwidth = 4 -- Number of spaces for each indentation
vim.o.expandtab = true -- Convert tabs to spaces
vim.o.smartindent = true -- Automatically indent new lines
vim.o.wrap = true -- Enable line wrapping
vim.o.colorcolumn = "80"
--vim.o.cursorline = true -- Highlight the current line

vim.cmd("syntax on")
vim.cmd("filetype plugin indent on")

vim.keymap.set("n", "<space>fb", ":Telescope file_browser path=%:p:h select_buffer=true<CR>")
