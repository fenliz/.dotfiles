local M = {}

M.plugins = function(use)
	--[[ use({ ]]
	--[[   "rcarriga/nvim-notify", ]]
	--[[   config = function() ]]
	--[[     vim.notify = require("notify") ]]
	--[[     require("notify").setup({ ]]
	--[[       render = "minimal", ]]
	--[[       timeout = 1000, ]]
	--[[     }) ]]
	--[[   end, ]]
	--[[ }) ]]

	use({
		"vigoux/notifier.nvim",
		config = function()
			require("notifier").setup({})
		end,
	})
end

return M
