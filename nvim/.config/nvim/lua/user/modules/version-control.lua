return {
	{
		"lewis6991/gitsigns.nvim",
		event = "BufReadPre",
		keys = {
			{
				"ä",
				function()
					require("gitsigns").next_hunk()
				end,
			},
			{
				"ö",
				function()
					require("gitsigns").prev_hunk()
				end,
			},
		},
		config = function()
			require("gitsigns").setup({
				current_line_blame = true,
			})
		end,
	},
	{
		"sindrets/diffview.nvim",
		keys = {
			{ "<leader>gh", "<cmd>DiffviewFileHistory %<cr>", desc = "Git: File History" },
		},
		config = function()
			require("diffview").setup()
		end,
	},
	{
		"akinsho/git-conflict.nvim",
		event = "BufReadPre",
		config = function()
			require("git-conflict").setup()
		end,
	},
}
