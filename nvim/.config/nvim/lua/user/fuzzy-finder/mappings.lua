local mapx = require'mapx'

mapx.nname('<leader>f', 'Find')

-- Text
nnoremap('<leader>fs', ':lua require"telescope.builtin".grep_string { search = vim.fn.input"" }<CR>', '<silent>', 'Find: Text')
nnoremap('<leader>fS', ':lua require"telescope.builtin".grep_string { search = vim.fn.expand"<cword>" }<CR>', '<silent>', 'Find: Text (Current word)')

-- Files
nnoremap('<C-p>', ':lua require"telescope.builtin".git_files()<CR>', '<silent>')
nnoremap('<leader>ff', ':lua require"telescope.builtin".find_files()<CR>', '<silent>', 'Find: File')
nnoremap('<leader>fF', ':lua require"telescope.builtin".find_files{find_command={"fdfind", vim.fn.expand("<cword>")}}<CR>', '<silent>', 'Find: File (Current word)')
nnoremap('<leader>fr', ':lua require"telescope.builtin".oldfiles()<CR>', '<silent>', 'Find: Recent file')
nnoremap('<leader>fd', ':lua require"user.fuzzy-finder.utils".find_dotfiles()<CR>', '<silent>', 'Find: File in .dotfiles')

-- Registers
nnoremap('<leader>fm', ':lua require"telescope.builtin".marks()<CR>', '<silent>', 'Find: Mark')
nnoremap('<leader>fb', ':lua require"telescope.builtin".buffers()<CR>', '<silent>', 'Find: Buffer')
nnoremap('<leader>fy', ':lua require"telescope".extensions.neoclip.default()<CR>', '<silent>', 'Find: Clipboard')
nnoremap('<leader>fn', ':lua require"telescope".extensions.notify.notify()<CR>', '<silent>', 'Find: Notification')

-- Commands
nnoremap('<leader>fc', ':lua require"telescope.builtin".commands()<CR>', '<silent>', 'Find: Command')
nnoremap('<leader>fk', ':lua require"telescope.builtin".keymaps()<CR>', '<silent>', 'Find: Keymap')

-- Help
nnoremap('<leader>fh', ':lua require"telescope.builtin".help_tags()<CR>', '<silent>', 'Find: Help')
