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
				runners = {
					npm_toggleterm = {
						create_task = function(_, spec)
							return require("tasks.lib.task"):new(function()
								require("toggleterm").exec(table.concat(spec.cmd, " "))
							end)
						end,
					},
				},
				sources = {
					npm = require("tasks.sources.npm"),
					vscode = require("tasks.sources.tasksjson"),
				},
				router = function(_, _, _, source)
					if source == "npm" then
						return "npm_toggleterm"
					end
				end,
			})

			require("telescope").load_extension("tasks")
		end,
	})
end

return M
