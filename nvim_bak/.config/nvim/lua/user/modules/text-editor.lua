return {
	{
		"dvoytik/hi-my-words.nvim",
		event = "BufReadPre",
		config = true,
		keys = {
			{ "<leader>h", "<cmd>HiMyWordsToggle<cr>", desc = "Toggle word highlight" },
		},
	},
	{
		"mrshmllow/document-color.nvim",
		event = "BufReadPre",
		config = true,
	},
	{
		"norcalli/nvim-colorizer.lua",
		event = "BufReadPre",
		opts = {
			"*",
			-- Disable in filetypes covered by document-color.nvim
			"!css",
			"!html",
			"!tsx",
			"!dart",
		},
	},
	{
		"numToStr/Comment.nvim",
		keys = { "gc", "gb", { mode = "v", "gc" }, { mode = "v", "gb" } },
		dependencies = {
			"JoosepAlviste/nvim-ts-context-commentstring",
		},
		config = function()
			require("Comment").setup({
				pre_hook = require("ts_context_commentstring.integrations.comment_nvim").create_pre_hook(),
			})
		end,
	},
}
