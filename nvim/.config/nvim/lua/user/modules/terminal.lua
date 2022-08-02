local set_terminal_keymaps = function()
	local opts = { noremap = true }
	vim.api.nvim_buf_set_keymap(0, "t", "<Esc>", [[<C-\><C-n>]], opts)
	vim.api.nvim_buf_set_keymap(0, "t", "<C-h>", [[<C-\><C-n><C-W>h]], opts)
	vim.api.nvim_buf_set_keymap(0, "t", "<C-j>", [[<C-\><C-n><C-W>j]], opts)
	vim.api.nvim_buf_set_keymap(0, "t", "<C-k>", [[<C-\><C-n><C-W>k]], opts)
	vim.api.nvim_buf_set_keymap(0, "t", "<C-l>", [[<C-\><C-n><C-W>l]], opts)
end

local M = {}

M.mappings = function()
	vim.api.nvim_create_autocmd("TermOpen", {
		pattern = { "term://*" },
		group = vim.api.nvim_create_augroup("ToggleTerminal", { clear = true }),
		callback = set_terminal_keymaps,
	})

	nnoremap("<C-t>", '<Cmd>exe v:count1 . "ToggleTerm"<CR>')
	inoremap("<C-t>", '<Esc><Cmd>exe v:count1 . "ToggleTerm"<CR>')
	tnoremap("<C-t>", '<Cmd>exe v:count1 . "ToggleTerm"<CR>')
end

M.plugins = function(use)
	use({
		"akinsho/toggleterm.nvim",
		config = function()
			require("toggleterm").setup()
		end,
	})
end

return M
