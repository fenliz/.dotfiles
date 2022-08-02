local M = {}

M.options = function()
	vim.o.laststatus = 3
end

M.plugins = function(use)
	use({
		"feline-nvim/feline.nvim",
		requires = {
			"kyazdani42/nvim-web-devicons",
		},
		config = function()
			require("feline").setup({
				components = require("catppuccin.groups.integrations.feline").get(),
			})
			require("feline").winbar.setup()
		end,
	})
end

return M
