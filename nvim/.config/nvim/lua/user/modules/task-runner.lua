local M = {}

M.mappings = function()
	nnoremap("<leader>qq", "<cmd>Telescope tasks specs<cr>", "<silent>", "Task: List")
	nnoremap("<leader>qr", "<cmd>Telescope tasks running<cr>", "<silent>", "Task: Running")

	nnoremap("<leader>ql", function()
		require("tasks").run_last()
	end, "<silent>", "Task: Run last")
end

M.plugins = function(use)
	use({
		"GustavoKatel/tasks.nvim",
		requires = { "nvim-lua/plenary.nvim" },
		config = function()
			require("tasks").setup({
				sources = {
					npm = require("tasks.sources.npm"),
					vscode = require("tasks.sources.tasksjson"),
				},
			})

			require("telescope").load_extension("tasks")
		end,
	})
end

return M
