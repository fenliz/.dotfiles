return {
	"phaazon/mind.nvim",
	cmd = { "MindOpenProject", "MindOpenMain" },
	dependencies = "nvim-lua/plenary.nvim",
	config = function()
		require("mind").setup()
	end,
	init = function()
		require("which-key").register({
			["<leader>n"] = {
				name = "Notes",

				n = {
					"<cmd>MindOpenProject<cr>",
					"Project",
				},
				g = {
					"<cmd>MindOpenMain<cr>",
					"Global",
				},
			},
		})
	end,
}
