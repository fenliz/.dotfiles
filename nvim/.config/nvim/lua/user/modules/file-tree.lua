return {
	{
		"s1n7ax/nvim-window-picker",
		lazy = false,
		config = function()
			require("window-picker").setup({
				autoselect_one = true,
				include_current = false,
				show_prompt = false,
				use_winbar = "always",
				other_win_hl_color = "#8839ef",
				filter_rules = {
					bo = {
						filetype = { "neo-tree", "neo-tree-popup", "notify" },
						buftype = { "terminal", "quickfix" },
					},
				},
			})
		end,
	},
	{
		"nvim-neo-tree/neo-tree.nvim",
		lazy = false,
		branch = "v2.x",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-tree/nvim-web-devicons",
			"MunifTanjim/nui.nvim",
		},
		keys = {
			{ "<leader>ee", "<cmd>NeoTreeReveal<cr>", desc = "File tree: Open" },
			{ "<leader>ec", "<cmd>NeoTreeClose<cr>", desc = "File tree: Close" },
		},
		opts = {
			window = {
				mappings = {
					["l"] = "open_with_window_picker",
					["h"] = "close_node",
					["<C-x>"] = "split_with_window_picker",
					["<C-v>"] = "vsplit_with_window_picker",
				},
			},
			filesystem = {
				filtered_items = {
					hide_dotfiles = vim.fn.getcwd() ~= vim.env.DOTFILES,
					hide_hidden = vim.fn.getcwd() ~= vim.env.DOTFILES,
				},
			},
		},
	},
}
