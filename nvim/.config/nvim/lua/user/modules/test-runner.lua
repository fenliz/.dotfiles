return {
	"nvim-neotest/neotest",
	keys = "<leader>t",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-treesitter/nvim-treesitter",
		"antoinemadec/FixCursorHold.nvim",

		-- Adapters
		"haydenmeade/neotest-jest",
		"marilari88/neotest-vitest",
	},
	config = function()
		local npm_executable_exists = function(name)
			local path = vim.fn.getcwd() .. "/node_modules/.bin/" .. name
			local ok = vim.loop.fs_stat(path)
			return ok
		end

		local adapters = {}

		-- Conditionally add correct adapter based on
		-- what executable is found
		if npm_executable_exists("jest") then
			table.insert(adapters, require("neotest-jest"))
		elseif npm_executable_exists("vitest") then
			table.insert(adapters, require("neotest-vitest"))
		end

		require("neotest").setup({
			adapters = adapters,
			discovery = {
				enabled = false,
			},
			icons = {
				passed = "✅",
				failed = "❎",
				running = "🔃",
				skipped = "🔲",
			},
		})
	end,
	init = function()
		require("which-key").register({
			["<leader>t"] = {
				name = "Test",

				t = {
					require("neotest").run.run,
					"Nearest test",
				},
				f = {
					function()
						require("neotest").run.run(vim.fn.expand("%"))
					end,
					"Current file",
				},
				r = {
					require("neotest").run.run_last,
					"Rerun test",
				},
				e = {
					function()
						require("neotest").summary.toggle()
					end,
					"Toggle explorer",
				},
				K = {
					require("neotest").output.open,
					"Show output",
				},
				d = {
					function()
						require("neotest").run.run({ strategy = "dap" })
					end,
					"Debug nearest test",
				},
				s = {
					require("neotest").run.stop,
					"Stop nearest test",
				},
				a = {
					require("neotest").run.attach,
					"Attach nearest test",
				},
			},
		})
	end,
}
