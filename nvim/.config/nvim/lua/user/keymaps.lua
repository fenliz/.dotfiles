vim.keymap.set("t", "<Esc>", "<C-\\><C-n>")

-- Indent
vim.keymap.set("v", "<", "<gv")
vim.keymap.set("v", ">", ">gv")
vim.keymap.set("v", "J", ":m '>+1<cr>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<cr>gv=gv")
vim.keymap.set("n", "J", "mzJ`z")

-- Clipboard
vim.keymap.set("n", "<leader>y", '"+y')
vim.keymap.set("v", "<leader>y", '"+y')
vim.keymap.set("n", "<leader>p", '"+p"')
vim.keymap.set("x", "<leader>p", '"_dP')

vim.keymap.set("n", "<c-s>", "<cmd>w<cr>")
vim.keymap.set("n", "<leader>qq", "<cmd>qa<cr>")

vim.api.nvim_create_autocmd("TextYankPost", {
	group = vim.api.nvim_create_augroup("HightlightYank", {}),
	callback = function()
		vim.highlight.on_yank({
			higroup = "Search",
		})
	end,
})
