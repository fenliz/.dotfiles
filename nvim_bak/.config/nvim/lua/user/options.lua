vim.g.mapleader = " "

-- Indentation
vim.o.smarttab = true
vim.o.smartindent = true
vim.o.tabstop = 2
vim.o.softtabstop = 2
vim.o.shiftwidth = 2
vim.o.shiftround = true
vim.o.expandtab = false

-- Search
vim.o.hlsearch = false
vim.o.incsearch = true
vim.o.smartcase = true
vim.o.grepformat = "%f:%l:%c:%m"
vim.o.grepprg = "rg --vimgrep"

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
vim.o.splitkeep = "screen"

-- Scrolling
vim.o.scrolloff = 8
vim.o.sidescrolloff = 8
vim.o.cursorline = true

-- Buffers
vim.o.hidden = true
vim.o.clipboard = "unnamedplus"

-- Files
vim.o.swapfile = false
vim.o.backup = false
vim.o.writebackup = false
vim.o.undofile = true
vim.o.undodir = vim.fn.expand("~/.vim/undodir")
vim.o.autowrite = true
vim.o.updatetime = 200

-- Code completion
vim.o.completeopt = "menu,menuone,noselect,noinsert"
vim.o.wildmode = "longest:full,full"

-- Popup
vim.o.pumblend = 10
vim.o.pumheight = 10
