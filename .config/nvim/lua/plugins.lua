vim.pack.add({
	-- Themes
	-- { src = "https://github.com/bjarneo/pixel.nvim" },
	-- { src = "https://github.com/bluz71/vim-moonfly-colors" },

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

require("plugin-config")
