return {
	"dvoytik/hi-my-words.nvim",
	event = "BufReadPre",
	config = function()
		require("hi-my-words").setup()
	end,
	keys = {
		{ "<leader>h", "<cmd>HiMyWordsToggle<cr>", desc = "Toggle word highlight" },
	},
}
