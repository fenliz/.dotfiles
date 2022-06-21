local gs = require("gitsigns")

local M = {}

M.go_to_next_hunk = function()
	vim.schedule(function()
		gs.next_hunk()
	end)
end

M.go_to_prev_hunk = function()
	vim.schedule(function()
		gs.prev_hunk()
	end)
end

return M
