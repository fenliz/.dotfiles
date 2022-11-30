local find_dotfiles = function(opts)
	opts.prompt_title = "<Dotfiles>"
	opts.cwd = vim.env.DOTFILES
	opts.hidden = true

	require("telescope.builtin").find_files(opts)
end

local search_for_text = function(opts)
	opts.vimgrep_arguments = {
		"rg",
		"--color=never",
		"--no-heading",
		"--with-filename",
		"--line-number",
		"--column",
		"--smart-case",
		"--trim",
	}
	if vim.fn.getcwd() == vim.env.DOTFILES then
		table.insert(opts.vimgrep_arguments, "--hidden")
	end
	require("telescope.builtin").grep_string(opts)
end

local M = {}

M.mappings = function()
	require("mapx").nname("<leader>f", "Find")

	-- Text
	nnoremap("<leader>fs", function()
		search_for_text({ search = vim.fn.input("") })
	end, "<silent>", "Find: Text")
	nnoremap("<leader>fw", function()
		search_for_text({ search = vim.fn.expand("<cword>") })
	end, "<silent>", "Find: Text (Current word)")

	-- Files
	nnoremap("<C-p>", function()
		require("telescope.builtin").find_files()
	end, "<silent>")

	nnoremap("<leader>ff", function()
		find_files()
	end, "<silent>", "Find: File")

	nnoremap("<leader>fF", function()
		local opts = { find_command = { "fdfind", vim.fn.expand("<cword>") } }
		require("telescope.builtin").find_files(opts)
	end, "<silent>", "Find: File (Current word)")

	nnoremap("<leader>fr", function()
		require("telescope.builtin").oldfiles()
	end, "<silent>", "Find: Recent file")

	nnoremap("<leader>fd", function()
		find_dotfiles()
	end, "<silent>", "Find: File in .dotfiles")

	-- Registers
	nnoremap("<leader>fb", function()
		require("telescope.builtin").buffers()
	end, "<silent>", "Find: Buffer")

	nnoremap("<leader>fm", function()
		require("telescope.builtin").marks()
	end, "<silent>", "Find: Mark")

	-- Commands
	nnoremap("<leader>fc", function()
		require("legendary").find("commands")
	end, "<silent>", "Find: Command")

	nnoremap("<leader>fk", function()
		require("legendary").find("keymaps")
	end, "<silent>", "Find: Keymap")

	-- History
	nnoremap("<leader>fl", function()
		require("telescope.builtin").resume()
	end, "<silent>", "Find: Resume last search")

	nnoremap("<leader>fS", function()
		require("telescope.builtin").search_history()
	end, "<silent>", "Find: Search (History)")

	nnoremap("<leader>fC", function()
		require("telescope.builtin").command_history()
	end, "<silent>", "Find: Command (History)")

	nnoremap("<leader>fy", function()
		require("telescope").extensions.neoclip.default()
	end, "<silent>", "Find: Clipboard (History)")

	nnoremap("<leader>fn", function()
		require("telescope").extensions.notify.notify()
	end, "<silent>", "Find: Notification (History)")

	-- Vim
	nnoremap("<leader>fh", function()
		require("telescope.builtin").help_tags()
	end, "<silent>", "Find: Help")

	nnoremap("<leader>fo", function()
		require("telescope.builtin").vim_options()
	end, "<silent>", "Find: Option")
end

M.plugins = function(use)
	use({
		"nvim-telescope/telescope.nvim",
		config = function()
			require("telescope").setup({
				extensions = {
					fzf = {
						fuzzy = true,
						override_generic_sorter = true,
						override_file_sorter = true,
						case_mode = "smart_case",
					},
				},
			})
		end,
	})

	use({
		"nvim-telescope/telescope-fzf-native.nvim",
		run = "make",
		config = function()
			require("telescope").load_extension("fzf")
		end,
	})

	use({
		"AckslD/nvim-neoclip.lua",
		config = function()
			require("neoclip").setup({
				keys = {
					telescope = {
						i = {
							paste = "<CR>",
							select = "<C-y>",
						},
					},
				},
			})
		end,
	})
end

return M
