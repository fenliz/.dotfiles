local M = {}

M.mappings = function()
	vim.api.nvim_create_user_command("OverseerRestartLast", function()
		local overseer = require("overseer")
		local tasks = overseer.list_tasks({ recent_first = true })
		if vim.tbl_isempty(tasks) then
			vim.notify("No recent tasks found", vim.log.levels.WARN)
		else
			overseer.run_action(tasks[1], "restart")
		end
	end, {})

	nnoremap("<leader>qq", "<cmd>OverseerRun<cr>", "<silent>", "Task: List")
	nnoremap("<leader>ql", "<cmd>OverseerRestartLast<cr>", "<silent>", "Task: Run last")
end

M.plugins = function(use)
	use({
		"stevearc/overseer.nvim",
		config = function()
			require("overseer").setup({
				strategy = {
					"toggleterm",
					open_on_start = true,
				},
			})
		end,
	})
end

return M
