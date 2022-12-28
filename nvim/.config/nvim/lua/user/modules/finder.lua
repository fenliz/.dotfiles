return {
	{
		"nvim-telescope/telescope.nvim",
		lazy = false,
		dependencies = {
			"nvim-lua/plenary.nvim",
		},
		config = function()
			require("telescope").setup({
				defaults = {
					mappings = {
						i = { ["<C-t>"] = require("trouble.providers.telescope").open_with_trouble },
						n = { ["<C-t>"] = require("trouble.providers.telescope").open_with_trouble },
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
		init = function()
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

			local telescope = require("telescope.builtin")

			vim.keymap.set("n", "<C-p>", telescope.find_files)

			require("which-key").register({
				["<leader>f"] = {
					name = "Find",

					-- Text
					s = {
						function()
							telescope.live_grep(rg_opts)
						end,
						"Text",
					},
					w = {
						function()
							telescope.grep_string(rg_opts)
						end,
						"Text - Current Word",
					},

					-- Files
					f = {
						telescope.find_files,
						"File",
					},
					F = {
						function()
							telescope.find_files({
								search_file = vim.fn.expand("<cword>"),
							})
						end,
						"File - Current Word",
					},
					d = {
						function()
							telescope.find_files({
								prompt_title = "<Dotfiles>",
								cwd = vim.env.DOTFILES,
								hidden = true,
							})
						end,
						"File - .dotfiles",
					},
					r = {
						telescope.oldfiles,
						"File - Recent",
					},

					-- Registers
					b = {
						telescope.buffers,
						"Buffer",
					},
					m = {
						telescope.marks,
						"Mark",
					},

					-- History
					l = {
						telescope.resume,
						"Resume last search",
					},
					S = {
						telescope.search_history,
						"History - Search",
					},
					c = {
						telescope.command_history,
						"History - Command",
					},
					y = {
						require("telescope").extensions.neoclip.default,
						"History - Clipboard",
					},

					-- VIM
					h = {
						telescope.help_tags,
						"Help",
					},
					o = {
						telescope.vim_options,
						"Option",
					},
				},
				["<leader>g"] = {
					name = "Git",

					s = {
						telescope.git_status,
						"Status",
					},
					b = {
						telescope.git_branches,
						"Branches",
					},
					c = {
						telescope.git_commits,
						"Commits",
					},
					S = {
						telescope.git_stash,
						"Stashes",
					},
				},
			})
		end,
	},
	{
		"AckslD/nvim-neoclip.lua",
		event = "BufWritePre",
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
