local rg_opts = {
	additional_args = {
		"--color=never",
		"--no-heading",
		"--with-filename",
		"--line-number",
		"--column",
		"--smart-case",
		"--trim",
	},
}
if vim.fn.getcwd() == vim.env.DOTFILES then
	table.insert(rg_opts.additional_args, "--hidden")
end

return {
	{
		"nvim-telescope/telescope.nvim",
		dependencies = {
			"nvim-lua/plenary.nvim",
		},
		keys = {
			{
				"<leader>fs",
				function()
					require("telescope.builtin").live_grep(rg_opts)
				end,
				desc = "Find: Text",
			},
			{
				"<leader>fw",
				function()
					require("telescope.builtin").grep_string(rg_opts)
				end,
				desc = "Find: Text (Current Word)",
			},
			{
				"<leader>ff",
				function()
					require("telescope.builtin").find_files()
				end,
				desc = "Find: File",
			},
			{
				"<leader>fF",
				function()
					require("telescope.builtin").find_files({ search_file = vim.fn.expand("<cword>") })
				end,
				desc = "Find: File (Current Word)",
			},
			{
				"<leader>fd",
				function()
					require("telescope.builtin").find_files({
						prompt_title = "<Dotfiles>",
						cwd = vim.env.DOTFILES,
						hidden = true,
					})
				end,
				desc = "Find: File (.dotfiles)",
			},
			{
				"<leader>fr",
				function()
					require("telescope.builtin").oldfiles()
				end,
				desc = "Find: File (Recent)",
			},
			{
				"<leader>fb",
				function()
					require("telescope.builtin").buffers()
				end,
				desc = "Find: Buffer",
			},
			{
				"<leader>fh",
				function()
					require("telescope.builtin").help_tags()
				end,
				desc = "Find: Help",
			},
			{
				"<leader>fm",
				function()
					require("telescope.builtin").marks()
				end,
				desc = "Find: Mark",
			},
			{
				"<leader>ft",
				function()
					require("telescope.builtin").tags()
				end,
				desc = "Find: Tag",
			},
			{
				"<leader>fo",
				function()
					require("telescope.builtin").vim_options()
				end,
				desc = "Find: Option",
			},
			{
				"<leader>fc",
				function()
					require("telescope.builtin").commands()
				end,
				desc = "Find: Command",
			},
			{
				"<leader>fk",
				function()
					require("telescope.builtin").keymaps()
				end,
				desc = "Find: Keymap",
			},
			{
				"<leader>fl",
				function()
					require("telescope.builtin").resume()
				end,
				desc = "Find: Resume last search",
			},
			{
				"<leader>fS",
				function()
					require("telescope.builtin").search_history()
				end,
				desc = "Find: Search History",
			},
			{
				"<leader>fC",
				function()
					require("telescope.builtin").command_history()
				end,
				desc = "Find: Command History",
			},
			{
				"<leader>gs",
				function()
					require("telescope.builtin").git_status()
				end,
				desc = "Git: Status",
			},
			{
				"<leader>gb",
				function()
					require("telescope.builtin").git_branches()
				end,
				desc = "Git: Branches",
			},
			{
				"<leader>gc",
				function()
					require("telescope.builtin").git_commits()
				end,
				desc = "Git: Commits",
			},
			{
				"<leader>gS",
				function()
					require("telescope.builtin").git_stash()
				end,
				desc = "Git: Stashes",
			},
			{
				"<C-p>",
				function()
					require("telescope.builtin").find_files()
				end,
				desc = "Find: File",
			},
		},
		config = function()
			require("telescope").setup({
				defaults = {
					mappings = {
						i = { ["<C-t>"] = require("trouble.providers.telescope").open_with_trouble },
						n = { ["<C-t>"] = require("trouble.providers.telescope").open_with_trouble },
					},
					preview = {
						timeout = 250,
						filesize_limit = 5,
					},
				},
				pickers = {
					find_files = {
						find_command = {
							"rg",
							"--files",
							"--hidden",
							"-g",
							"!.git",
						},
					},
				},
			})
		end,
	},
	{
		"AckslD/nvim-neoclip.lua",
		event = "BufWritePre",
		keys = {
			{
				"<leader>fy",
				function()
					require("telescope").extensions.neoclip.default()
				end,
				desc = "Find: Clipboard History",
			},
		},
		config = function()
			require("neoclip").setup({
				keys = {
					telescope = {
						i = {
							paste = "<cr>",
							select = "<C-y>",
						},
					},
				},
			})
		end,
	},
}
