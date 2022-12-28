-- Indentation
vim.o.smarttab = true
vim.o.smartindent = true
vim.o.tabstop = 4
vim.o.softtabstop = 4
vim.o.shiftwidth = 4
vim.o.shiftround = true
vim.o.expandtab = false

-- Search
vim.o.hlsearch = false
vim.o.incsearch = true
vim.o.smartcase = true

-- Text
vim.o.wrap = false
vim.o.encoding = "UTF-8"

-- Visuals
vim.o.termguicolors = true
vim.o.showmode = false
vim.o.cmdheight = 0
vim.o.laststatus = 3

-- Line numbers
vim.o.number = true
vim.o.relativenumber = true
vim.o.signcolumn = "yes"

-- Splits
vim.o.splitright = true
vim.o.splitbelow = true

-- Scrolling
vim.o.scrolloff = 8
vim.o.cursorline = true

-- Buffers
vim.o.hidden = true

-- Files
vim.o.swapfile = false
vim.o.backup = false
vim.o.writebackup = false
vim.o.undofile = true
vim.o.undodir = "~/.vim/undodir"

-- Code completion
vim.o.completeopt = "menu,menuone,noselect,noinsert"

-- Faster completion
vim.o.updatetime = 300
