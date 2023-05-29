return {
	"nvim-neotest/neotest",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-treesitter/nvim-treesitter",
		"antoinemadec/FixCursorHold.nvim",

		-- Adapters
		"haydenmeade/neotest-jest",
		"marilari88/neotest-vitest",
	},
	keys = {
		{
			"<leader>tt",
			function()
				require("neotest").run.run()
			end,
			desc = "Test: Nearest test",
		},
		{
			"<leader>tf",
			function()
				require("neotest").run.run(vim.fn.expand("%"))
			end,
			desc = "Test: Current file",
		},
		{
			"<leader>tl",
			function()
				require("neotest").run.run_last()
			end,
			desc = "Test: Rerun last",
		},
		{
			"<leader>te",
			function()
				require("neotest").summary.toggle()
			end,
			desc = "Test: Toggle summary",
		},
		{
			"<leader>tK",
			function()
				require("neotest").output.open()
			end,
			desc = "Test: Show output",
		},
	},
	opts = function()
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

		return {

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
		}
	end,
}
