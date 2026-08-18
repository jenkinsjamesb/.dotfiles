vim.keymap.set(
	"n",
	"<leader>e",
	":Telescope file_browser path=%:p:h select_buffer=true<CR>",
	{ desc = "Telescope file browser" }
)
vim.keymap.set("n", "<leader>fi", ":Telescope git_files<CR>", { desc = "Telescope Git files" })
vim.keymap.set("n", "<leader>fg", ":Telescope live_grep<CR>", { desc = "Telescope live grep" })
vim.keymap.set("n", "<leader>ff", ":Telescope find_files<CR>", { desc = "Telescope live grep" })
vim.keymap.set("n", "<leader>fd", ":Telescope diagnostics<CR>", { desc = "Telescope Diagnostics" })
--vim.keymap.set("n", "<leader>fg", ":Telescope live_grep search_dirs={'%:p:h'}<CR>", { desc = "Telescope live grep" })

-- QOL
--makes search terms stay in the middle
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

--buffer keybinds
vim.keymap.set("n", "<leader>bd", ":bdelete<CR>")
vim.keymap.set("n", "<leader>bn", ":bnext<CR>")
vim.keymap.set("n", "<leader>bp", ":bprev<CR>")

--allows paste without removing current buffer
vim.keymap.set("x", "<leader>p", '"_dP')
