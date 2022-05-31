return function(use)
	use({
		"catppuccin/nvim",
		as = "catppuccin",
		config = function()
			require("catppuccin").setup({
				styles = {
					comments = "NONE",
					functions = "NONE",
					keywords = "NONE",
					variables = "NONE",
				},
				integrations = {
					neogit = true,
					lightspeed = true,
				},
			})

			vim.cmd([[colorscheme catppuccin]])
		end,
	})
end
