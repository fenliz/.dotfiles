local find_dotfiles = function(opts)
	opts.prompt_title = "<Dotfiles>"
	opts.cwd = vim.env.DOTFILES
	opts.hidden = true

	require("telescope.builtin").find_files(opts)
end

local rg_opts = function()
	local opts = {
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
		table.insert(opts.additional_args, "--hidden")
	end
	return opts
end

local M = {}

M.mappings = function()
	require("mapx").nname("<leader>f", "Find")

	-- Text
	nnoremap("<leader>fs", function()
		require("telescope.builtin").live_grep(rg_opts())
	end, "<silent>", "Find: Text")
	nnoremap("<leader>fw", function()
		require("telescope.builtin").grep_string(rg_opts())
	end, "<silent>", "Find: Text (Current word)")

	-- Files
	nnoremap("<C-p>", function()
		require("telescope.builtin").find_files()
	end, "<silent>")

	nnoremap("<leader>ff", function()
		require("telescope.builtin").find_files()
	end, "<silent>", "Find: File")

	nnoremap("<leader>fF", function()
		require("telescope.builtin").find_files({
			search_file = vim.fn.expand("<cword>"),
		})
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

	-- Vim
	nnoremap("<leader>fh", function()
		require("telescope.builtin").help_tags()
	end, "<silent>", "Find: Help")

	nnoremap("<leader>fo", function()
		require("telescope.builtin").vim_options()
	end, "<silent>", "Find: Option")

	-- AI
	nnoremap("<leader>fa", "<cmd>ChatGPT<cr>", "<silent>", "Find: AI")
	vnoremap("<leader>fa", "<mcd>ChatGPTEditWithInstructions<cr>", "<silent>", "Find: AI")
end

M.plugins = function(use)
	use({
		"nvim-telescope/telescope.nvim",
		config = function()
			require("telescope").setup({
				pickers = {
					find_files = {
						find_command = { "rg", "--files", "--hidden", "-g", "!.git" },
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

	use({
		"jackMort/ChatGPT.nvim",
		requires = {
			"nvim-telescope/telescope.nvim",
			"nvim-lua/plenary.nvim",
			"MunifTanjim/nui.nvim",
		},
		cond = function()
			return vim.env.OPENAI_API_KEY ~= nil
		end,
		config = function()
			require("chatgpt").setup()
		end,
	})
end

return M
