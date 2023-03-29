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
		dependencies = {
			"nvim-lua/plenary.nvim",
		},
		keys = {
			{
				"gx",
				function()
					require("open").open_cword()
				end,
				desc = "Open: Open current word",
			},
		},
		opts = {
			system_open = {
				cmd = "xdg-open",
			},
		},
	},
	{
		"christoomey/vim-tmux-navigator",
		lazy = false,
	},
}
