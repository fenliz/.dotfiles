local M = {}

M.plugins = function(use)
	use({
		"vigoux/notifier.nvim",
		config = function()
			require("notifier").setup({})
		end,
	})
end

return M
