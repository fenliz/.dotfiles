local mapx = require'mapx'

nnoremap('ga', ':lua vim.lsp.buf.code_action()<CR>', 'Code: Actions')
vnoremap('ga', ':lua vim.lsp.buf.code_action()<CR>', 'Code: Actions')
nnoremap('gh', ':lua vim.lsp.buf.hover()<CR>', 'Code: Hover')
nnoremap('gr', ':lua vim.lsp.buf.hover()<CR>', 'Code: Rename')
nnoremap('gd', ':lua vim.lsp.buf.definition()<CR>', 'Code: Definition')
nnoremap('gD', ':lua vim.lsp.buf.declaration()<CR>', 'Code: Declaration')

nnoremap('Ä', ':lua vim.lsp.diagnostic.goto_next()<CR>')
nnoremap('Ö', ':lua vim.lsp.diagnostic.goto_prev()<CR>')

mapx.vname('<leader>r', 'Refactor')
mapx.nname('<leader>r', 'Refactor')

vnoremap('<leader>rr', '<Esc>:lua require"user.language-servers.utils".refactors()<CR>', '<silent>', 'Refactor: Browse')
vnoremap('<leader>re', '<Esc>:lua require"refactoring".refactor("Extract Function")<CR>', '<silent>', 'Refactor: Extract function')
vnoremap('<leader>rf', '<Esc>:lua require"refactoring".refactor("Extract Function To File")<CR>', '<silent>', 'Refactor: Extract function to file')
vnoremap('<leader>rv', '<Esc>:lua require"refactoring".refactor("Extract Variable")<CR>', '<silent>', 'Refactor: Extract variable')
vnoremap('<leader>ri', '<Esc>:lua require"refactoring".refactor("Inline Variable")<CR>', '<silent>', 'Refactor: Inline variable')

nnoremap('<leader>rp', ':lua require"refactoring".debug.printf { below = false }<CR>', '<silent>', 'Refactor: Debug location')
vnoremap('<leader>rp', ':lua require"refactoring".debug.print_var()<CR>', '<silent>', 'Refactor: Debug variable')
nnoremap('<leader>rP', ':lua require"refactoring".debug.cleanup()<CR>', '<silent>', 'Refactor: Debug cleanup')
