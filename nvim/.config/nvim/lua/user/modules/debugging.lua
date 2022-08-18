local M = {}

M.plugins = function(use)
	use({
		"andrewferrier/debugprint.nvim",
		config = function()
			require("debugprint").setup()
		end,
	})
end

return M
