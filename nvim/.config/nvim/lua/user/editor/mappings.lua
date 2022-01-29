inoremap('jk', '<ESC>', 'Exit insert mode')
inoremap('kj', '<ESC>', 'Exit insert mode')

vnoremap('<', '<gv', 'Indent')
vnoremap('>', '>gv', 'Indent')

nnoremap('<leader>y', '"+y', 'Copy: To system clipboard')
vnoremap('<leader>y', '"+y', 'Copy: To system clipboard')

nnoremap('<leader>p', '"+p"', 'Paste: From system clipboard')

tnoremap('<Esc>', '<C-\\><C-n>')
