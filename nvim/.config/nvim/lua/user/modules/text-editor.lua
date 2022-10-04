local M = {}

M.options = function()
	-- Indentation
	vim.o.smarttab = true
	vim.o.tabstop = 2
	vim.o.softtabstop = 2
	vim.o.shiftwidth = 2
	vim.o.shiftround = true
	vim.o.expandtab = false

	-- Search
	vim.o.hlsearch = false
	vim.o.smartcase = true

	-- Text
	vim.o.wrap = false
	vim.o.encoding = "UTF-8"

	-- Visuals
	vim.o.termguicolors = true
	vim.o.showmode = false
	--[[ vim.o.cmdheight = 0 ]]
	--[[ vim.o.laststatus = 0 ]]

	-- Line numbers
	vim.o.number = true
	vim.o.relativenumber = true
	vim.o.signcolumn = "yes"

	-- Splits
	vim.o.splitright = true
	vim.o.splitbelow = true

	-- Scrolling
	vim.o.scrolloff = 8
	vim.o.cursorline = true

	-- Buffers
	vim.o.hidden = true

	-- Files
	vim.o.swapfile = false
	vim.o.backup = false
	vim.o.writebackup = false
	vim.o.undofile = true
end

M.mappings = function()
	vnoremap("<", "<gv", "Indent")
	vnoremap(">", ">gv", "Indent")

	nnoremap("<leader>y", '"+y', "Copy: To system clipboard")
	vnoremap("<leader>y", '"+y', "Copy: To system clipboard")

	nnoremap("<leader>p", '"+p"', "Paste: From system clipboard")

	tnoremap("<Esc>", "<C-\\><C-n>")
end

M.plugins = function(use)
	use({
		"numToStr/Comment.nvim",
		config = function()
			require("Comment").setup({
				pre_hook = function(ctx)
					local U = require("Comment.utils")

					local location = nil
					if ctx.ctype == U.ctype.block then
						location = require("ts_context_commentstring.utils").get_cursor_location()
					elseif ctx.cmotion == U.cmotion.v or ctx.cmotion == U.cmotion.V then
						location = require("ts_context_commentstring.utils").get_visual_start_location()
					end

					return require("ts_context_commentstring.internal").calculate_commentstring({
						key = ctx.ctype == U.ctype.line and "__default" or "__multiline",
						location = location,
					})
				end,
			})
		end,
	})

	use({
		"lukas-reineke/indent-blankline.nvim",
		config = function()
			require("indent_blankline").setup()
		end,
	})

	use("tpope/vim-surround")

	use("ggandor/lightspeed.nvim")

	use({
		"norcalli/nvim-colorizer.lua",
		config = function()
			require("colorizer").setup()
		end,
	})
end

return M
