local o = vim.o

-- Indentation
o.smarttab = true
o.tabstop = 4
o.softtabstop = 4
o.shiftwidth = 4
o.shiftround = true
o.expandtab = true

-- Search
o.hlsearch = false
o.smartcase = true

-- Text
o.wrap = false
o.encoding = 'UTF-8'

-- Visuals
o.termguicolors = true
o.showmode = false

-- Line numbers
o.number = true
o.relativenumber = true
o.signcolumn = 'yes'

-- Splits
o.splitright = true
o.splitbelow = true

-- Scrolling
o.scrolloff = 8
o.cursorline = true

-- Buffers
o.hidden = true

-- Files
o.swapfile = false
o.backup = false
o.writebackup = false
o.undofile = true
