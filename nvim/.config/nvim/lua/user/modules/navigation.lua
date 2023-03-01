return {
	{
		"tpope/vim-surround",
		lazy = false,
	},
	{
		"ggandor/lightspeed.nvim",
		event = "BufReadPre",
	},
	-- {
	-- 	"karb94/neoscroll.nvim",
	-- 	keys = { "<C-u>", "<C-d>", "gg", "G" },
	-- 	config = function()
	-- 		require("neoscroll").setup({
	-- 			mappings = { "<C-u>", "<C-d>" },
	-- 		})
	--
	-- 		require("neoscroll.config").set_mappings({
	-- 			["<C-u>"] = { "scroll", { "-vim.wo.scroll", "true", "80" } },
	-- 			["<C-d>"] = { "scroll", { "vim.wo.scroll", "true", "80" } },
	-- 		})
	-- 	end,
	-- },
	{
		"ofirgall/open.nvim",
		keys = "gx",
		dependencies = {
			"nvim-lua/plenary.nvim",
		},
		config = function()
			require("open").setup({
				system_open = {
					cmd = "xdg-open",
				},
			})
		end,
		init = function()
			vim.keymap.set("n", "gx", require("open").open_cword)
		end,
	},
	{
		-- Easy navigation between NVIM and TMUX splits
		"christoomey/vim-tmux-navigator",
		lazy = false,
	},
}
