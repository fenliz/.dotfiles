return {
	{
		"lewis6991/gitsigns.nvim",
		event = "BufReadPre",
		config = function()
			require("gitsigns").setup({
				current_line_blame = true,
			})
		end,
		init = function()
			vim.keymap.set("n", "ä", function()
				require("gitsigns").next_hunk()
			end)
			vim.keymap.set("n", "ö", function()
				require("gitsigns").prev_hunk()
			end)
		end,
	},
	{
		"sindrets/diffview.nvim",
		cmd = { "DiffviewFileHistory" },
		config = function()
			require("diffview").setup()
		end,
		init = function()
			require("which-key").register({
				["<leader>g"] = {
					name = "Git",
					h = {
						"<cmd>DiffviewFileHistory %<cr>",
						"File history",
					},
				},
			})
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
