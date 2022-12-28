return {
	{
		"folke/which-key.nvim",
		lazy = false,
		config = function()
			require("which-key").setup()
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
