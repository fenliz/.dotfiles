return {
	{
		"folke/which-key.nvim",
		lazy = false,
		config = function()
			require("which-key").setup()
			require("which-key").register({
				["<leader>x"] = { name = "Trouble" },
				["<leader>t"] = { name = "Test" },
				["<leader>f"] = { name = "Find" },
				["<leader>g"] = { name = "Git" },
				["<leader>e"] = { name = "File tree" },
				["<leader>n"] = { name = "Notes" },
			})
		end,
	},
	{
		"klen/nvim-config-local",
		lazy = false,
		config = function()
			require("config-local").setup()
		end,
	},
}
