return {
	{
		"tpope/vim-surround",
		lazy = false,
	},
	{
		"ggandor/lightspeed.nvim",
		event = "BufReadPre",
	},
	{
		"ofirgall/open.nvim",
		keys = "gx",
		dependencies = {
			"nvim-lua/plenary.nvim",
		},
		config = function()
			require("open").setup({
				system_open = {
					cmd = "xdg-open",
				},
			})
		end,
		init = function()
			vim.keymap.set("n", "gx", require("open").open_cword)
		end,
	},
	{
		-- Easy navigation between NVIM and TMUX splits
		"christoomey/vim-tmux-navigator",
		lazy = false,
	},
}
