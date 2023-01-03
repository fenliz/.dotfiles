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
		keys = {
			{ "<leader>ee", "<cmd>NeoTreeReveal<cr>", desc = "Explorer: Open" },
			{ "<leader>ec", "<cmd>NeoTreeClose<cr>", desc = "Explorer: Close" },
		},
		config = function()
			require("neo-tree").setup({
				window = {
					mappings = {
						["l"] = "open",
						["h"] = "close_node",
						["<C-x>"] = "open_split",
						["<C-v>"] = "open_vsplit",
					},
				},
			})
		end,
	},
}
