local lazygit = require("toggleterm.terminal").Terminal:new({
	cmd = "lazygit",
	hidden = true,
	direction = "float",
	on_open = function(term)
		vim.cmd("startinsert!")
		nnoremap("q", "<cmd>close<cr>", "<silent>", "Terminal: Close", { buffer = term.bufnr })
		nnoremap("<Esc>", "<cmd>close<cr>", "<silent>", "Terminal: Close", { buffer = term.bufnr })
	end,
})

local toggle_lazygit = function()
	lazygit:toggle()
end

local M = {}

M.mappings = function()
	require("mapx").nname("<leader>g", "Git")

	nnoremap("<leader>gg", function()
		toggle_lazygit()
	end, "<silent>", "Git: Browser")

	nnoremap("<leader>gs", function()
		require("telescope.builtin").git_status()
	end, "<silent>", "Git: Status")

	nnoremap("<leader>gb", function()
		require("telescope.builtin").git_branches()
	end, "<silent>", "Git: Branches")

	nnoremap("<leader>gc", function()
		require("telescope.builtin").git_commits()
	end, "<silent>", "Git: Commits")

	nnoremap("<leader>gh", ":DiffviewFileHistory %<CR>", "<silent>", "Git: File history")

	nnoremap("<leader>gS", function()
		require("telescope.builtin").git_stash()
	end, "<silent>", "Git: Stashes")

	nnoremap("<leader>gd", function()
		require("gitsigns").diffthis()
	end, "<silent>", "Git: Diff current file")

	nnoremap("ä", function()
		vim.schedule(function()
			require("gitsigns").next_hunk()
		end)
	end, "<silent>", "Git: Next hunk")

	nnoremap("ö", function()
		vim.schedule(function()
			require("gitsigns").prev_hunk()
		end)
	end, "<silent>", "Git: Prev hunk")
end

M.plugins = function(use)
	use({
		"lewis6991/gitsigns.nvim",
		config = function()
			require("gitsigns").setup({
				current_line_blame = true,
			})
		end,
	})

	use({
		"sindrets/diffview.nvim",
		requires = {
			"nvim-lua/plenary.nvim",
		},
		config = function() end,
	})
end

return M
