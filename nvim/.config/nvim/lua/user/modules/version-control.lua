return {
	{
		"lewis6991/gitsigns.nvim",
		event = "BufReadPre",
		opts = {
			current_line_blame = true,
		},
	},
	{
		"sindrets/diffview.nvim",
		keys = {
			{ "<leader>gh", "<cmd>DiffviewFileHistory %<cr>", desc = "Git: File History" },
		},
	},
	{
		"akinsho/git-conflict.nvim",
		event = "BufReadPre",
	},
}
