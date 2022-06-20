local toggle_terminal_augroup = vim.api.nvim_create_augroup("ToggleTerminal", {})

local function set_terminal_keymaps()
  local opts = { noremap = true }
  vim.api.nvim_buf_set_keymap(0, "t", "<Esc>", [[<C-\><C-n>]], opts)
  vim.api.nvim_buf_set_keymap(0, "t", "<C-h>", [[<C-\><C-n><C-W>h]], opts)
  vim.api.nvim_buf_set_keymap(0, "t", "<C-j>", [[<C-\><C-n><C-W>j]], opts)
  vim.api.nvim_buf_set_keymap(0, "t", "<C-k>", [[<C-\><C-n><C-W>k]], opts)
  vim.api.nvim_buf_set_keymap(0, "t", "<C-l>", [[<C-\><C-n><C-W>l]], opts)
end

vim.api.nvim_clear_autocmds({ group = toggle_terminal_augroup })
vim.api.nvim_create_autocmd("TermOpen", {
  pattern = { "term://*" },
  group = toggle_terminal_augroup,
  callback = set_terminal_keymaps,
})

nnoremap("<C-t>", '<Cmd>exe v:count1 . "ToggleTerm"<CR>')
inoremap("<C-t>", '<Esc><Cmd>exe v:count1 . "ToggleTerm"<CR>')
tnoremap("<C-t>", '<Cmd>exe v:count1 . "ToggleTerm"<CR>')
