local opt = vim.o

-- Adjust the delay time (default is 4000ms / 4 seconds)
opt.updatetime = 500
vim.g.mapleader = " "
opt.number = true -- Enable line numbers
opt.relativenumber = true -- Relative numbers
opt.tabstop = 4 -- Number of spaces a tab represents
opt.shiftwidth = 4 -- Number of spaces for each indentation
opt.expandtab = true -- Convert tabs to spaces
opt.smartindent = true -- Automatically indent new lines
opt.wrap = true -- Enable line wrapping
opt.colorcolumn = "80" -- Column limit line
opt.clipboard = "unnamedplus" -- Use the system clpboard
opt.cursorline = true

-- QOL
-- make a backup before overwritting file
opt.backup = true
opt.backupcopy = "auto"
vim.opt_global.backupdir = "/tmp/nvim/backupdir"

-- hold undos into a file for persistance
opt.undofile = true
opt.undodir = "/tmp/nvim/undodir"

--highlight current search
opt.hlsearch = true
opt.incsearch = true

--brings the text up or when hitting 10 above or below the top or bottom
opt.scrolloff = 10

-- Case-insensitive searching UNLESS \C or one or more capital letters in the search term
opt.smartcase = true
opt.ignorecase = true
