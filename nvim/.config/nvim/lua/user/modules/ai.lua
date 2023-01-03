return {
	{
		"zbirenbaum/copilot.lua",
		event = "VimEnter",
		config = function()
			vim.defer_fn(function()
				require("copilot").setup({
					suggestion = {
						auto_trigger = true,
						keymap = {
							accept = "<C-l>",
							next = "<C-k>",
							prev = "<C-j>",
						},
					},
				})
			end, 100)
		end,
	},
	{
		"jackMort/ChatGPT.nvim",
		enabled = vim.env.OPENAI_API_KEY ~= nil,
		keys = {
			{ "<leader>fa", "<cmd>ChatGPT<cr>", desc = "ChatGPT" },
		},
		dependencies = {
			"nvim-telescope/telescope.nvim",
			"nvim-lua/plenary.nvim",
			"MunifTanjim/nui.nvim",
		},
		config = function()
			require("chatgpt").setup()
		end,
	},
}
