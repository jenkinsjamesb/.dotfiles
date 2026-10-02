require("mason").setup()
require("mason-lspconfig").setup()
require("mason-tool-installer").setup({
	ensure_installed = {
		-- Lua
		"lua_ls",
		"stylua",

		-- Go
		"gopls",

		-- C(++)
		"clangd",

		-- Python
		"pylsp",
		"ruff",

		-- Shell
		"shellcheck",
		"shfmt",
	},
})

require("virt-column").setup({
	char = "│", -- Full-height line
	highlight = "LineNr",
})

require("telescope").setup({
	extensions = {
		["ui-select"] = {
			require("telescope.themes").get_dropdown({}),
		},
	},
})
-- To get ui-select loaded and working with telescope, you need to call
-- load_extension, somewhere after setup function:
require("telescope").load_extension("ui-select")

--vim.cmd.colorscheme("pixel") -- Color theme that uses ANSI colors only
vim.cmd.colorscheme("habamax")
