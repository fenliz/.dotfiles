local mapx = require'mapx'

mapx.nname('<leader>e', 'File explorer')

nnoremap('<leader>ee', ':NvimTreeOpen<CR>', '<silent>', 'File explorer: Open')
nnoremap('<leader>ec', ':NvimTreeClose<CR>', '<silent>', 'File explorer: Close')
