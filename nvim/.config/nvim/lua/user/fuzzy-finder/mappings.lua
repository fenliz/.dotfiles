local mapx = require'mapx'

mapx.nname('<leader>f', 'Find')

-- Text
nnoremap('<leader>fs', '<cmd>lua require"user.fuzzy-finder.utils".search_for_text { search = vim.fn.input"" }<CR>', '<silent>', 'Find: Text')
nnoremap('<leader>fw', '<cmd>lua require"user.fuzzy-finder.utils".search_for_text { search = vim.fn.expand"<cword>" }<CR>', '<silent>', 'Find: Text (Current word)')

-- Files
nnoremap('<C-p>',      '<cmd>lua require"user.fuzzy-finder.utils".find_files()<CR>', '<silent>')
nnoremap('<leader>ff', '<cmd>lua require"user.fuzzy-finder.utils".find_files()<CR>', '<silent>', 'Find: File')
nnoremap('<leader>fF', '<cmd>lua require"telescope.builtin".find_files{find_command={"fdfind", vim.fn.expand("<cword>")}}<CR>', '<silent>', 'Find: File (Current word)')
nnoremap('<leader>fr', '<cmd>lua require"telescope.builtin".oldfiles()<CR>', '<silent>', 'Find: Recent file')
nnoremap('<leader>fd', '<cmd>lua require"user.fuzzy-finder.utils".find_dotfiles()<CR>', '<silent>', 'Find: File in .dotfiles')

-- Registers
nnoremap('<leader>fm', '<cmd>lua require"telescope.builtin".marks()<CR>', '<silent>', 'Find: Mark')
nnoremap('<leader>fb', '<cmd>lua require"telescope.builtin".buffers()<CR>', '<silent>', 'Find: Buffer')

-- Commands
nnoremap('<leader>fc', '<cmd>lua require"telescope.builtin".commands()<CR>', '<silent>', 'Find: Command')
nnoremap('<leader>fk', '<cmd>lua require"telescope.builtin".keymaps()<CR>', '<silent>', 'Find: Keymap')

-- History
nnoremap('<leader>fS', '<cmd>lua require"telescope.builtin".search_history()<CR>', '<silent>', 'Find: Search (History)');
nnoremap('<leader>fC', '<cmd>lua require"telescope.builtin".command_history()<CR>', '<silent>', 'Find: Command (History)');
nnoremap('<leader>fy', '<cmd>lua require"telescope".extensions.neoclip.default()<CR>', '<silent>', 'Find: Clipboard (History)')
nnoremap('<leader>fn', '<cmd>lua require"telescope".extensions.notify.notify()<CR>', '<silent>', 'Find: Notification (History)')

-- Vim
nnoremap('<leader>fh', '<cmd>lua require"telescope.builtin".help_tags()<CR>', '<silent>', 'Find: Help')
nnoremap('<leader>fo', '<cmd>lua require"telescope.builtin".vim_options()<CR>', '<silent>', 'Find: Option')
