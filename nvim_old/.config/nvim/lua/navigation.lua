local utils = require('utils')
local o = vim.o

-- Start scrolling x lines from edge
o.scrolloff = 8

-- Avoid closing buffers
o.hidden = true

-- Open vertical splits to the right
o.splitright = true

-- Open horizontal splits below
o.splitbelow = true

-- Go to previous buffer
utils.nmap('<Backspace>', '<C-^>')

-- Buffer navigation
-- utils.nmap('<Tab>', ':BufferLineCycleNext<CR>')
-- utils.nmap('<S-Tab>', ':BufferLineCyclePrev<CR>')
