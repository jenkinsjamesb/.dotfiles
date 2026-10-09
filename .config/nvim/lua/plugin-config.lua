require("mason").setup()
require("mason-lspconfig").setup()
require("mason-tool-installer").setup({
	ensure_installed = {
		-- Generic
		"prettier",
		"harper-ls",

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
		"bashls",
		"shfmt",

		-- Markdown
		"marksman",
	},
})

require("virt-column").setup({
	char = "│", -- Full-height line
	highlight = "LineNr",
})

require("conform").setup({
	formatters_by_ft = {
		markdown = { "prettier" },
	},
	formatters = {
		prettier = {
			prepend_args = {
				"--prose-wrap",
				"preserve",
				"--print-width",
				"80",
			},
		},
	},
})

require("todo-comments").setup({
	vim.keymap.set("n", "<leader>tn", function()
		require("todo-comments").jump_next()
	end, { desc = "Next Todo Comment" }),
	vim.keymap.set("n", "<leader>tp", function()
		require("todo-comments").jump_prev()
	end, { desc = "Previous Todo Comment" }),
	vim.keymap.set("n", "<leader>tt", "<cmd>TodoTelescope<CR>", { desc = "Open Todo List In Telescope" }),
	keywords = {
		TODO = { alt = { "TO-DO" } },
	},
	search = { pattern = [[\b(KEYWORDS)(\([^\)]*\))?:]] },
	highlight = {
		-- DONE(CX):https://github.com/folke/todo-comments.nvim/issues/10
		-- SOLVED: https://github.com/folke/todo-comments.nvim/issues/332
		pattern = [[.*<((KEYWORDS)%(\(.{-1,}\))?):]],
	},
})

-- To get ui-select loaded and working with telescope, you need to call
-- load_extension, somewhere after setup function:
require("telescope").load_extension("ui-select")
require("telescope").load_extension("file_browser")

--vim.cmd.colorscheme("pixel") -- Color theme that uses ANSI colors only
vim.cmd.colorscheme("habamax")
