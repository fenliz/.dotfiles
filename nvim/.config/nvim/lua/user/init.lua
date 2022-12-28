vim.g.mapleader = " "

require("user.options")
require("user.keymaps")

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

-- Clone plugin manager repository
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"--single-branch",
		"git@github.com:folke/lazy.nvim.git",
		lazypath,
	})
end
vim.opt.runtimepath:prepend(lazypath)

-- Setup plugin manager
require("lazy").setup("user.modules", {
	defaults = {
		lazy = true,
	},
	install = {
		colorscheme = { "catppuccin" },
	},
})

vim.keymap.set("n", "<leader>l", "<cmd>:Lazy<cr>")
