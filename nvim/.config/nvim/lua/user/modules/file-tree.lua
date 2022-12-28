return {
	{
		"nvim-neo-tree/neo-tree.nvim",
		lazy = false,
		branch = "v2.x",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-tree/nvim-web-devicons",
			"MunifTanjim/nui.nvim",
		},
		config = function()
			require("neo-tree").setup({
				window = {
					mappings = {
						["l"] = "open",
						["h"] = "close_node",
					},
				},
			})
		end,
		init = function()
			require("which-key").register({
				["<leader>e"] = {
					name = "Explorer",
					e = {
						"<cmd>NeoTreeRevealToggle<cr>",
						"Toggle explorer",
					},
				},
			})
		end,
	},
}
