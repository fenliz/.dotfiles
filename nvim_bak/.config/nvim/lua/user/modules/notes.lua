return {
	"phaazon/mind.nvim",
	dependencies = "nvim-lua/plenary.nvim",
	keys = {
		{ "<leader>nn", "<cmd>MindOpenMain<cr>", desc = "Notes: Project" },
		{ "<leader>ng", "<cmd>MindOpenProject<cr>", desc = "Notes: Global" },
	},
	config = true,
}
