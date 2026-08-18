require("mason").setup()
require("mason-lspconfig").setup()
require("mason-tool-installer").setup({
	ensure_installed = {
		"lua_ls",
		"stylua",
		"gopls",
	},
})

require("virt-column").setup({
	char = "│", -- Full-height line
	highlight = "LineNr",
})

--vim.cmd.colorscheme("pixel") -- Color theme that uses ANSI colors only
vim.cmd.colorscheme("habamax")
