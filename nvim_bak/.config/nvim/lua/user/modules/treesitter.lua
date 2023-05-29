return {
	"nvim-treesitter/nvim-treesitter",
	event = "BufReadPost",
	build = ":TSUpdate",
	dependencies = {
		"nvim-treesitter/nvim-treesitter-textobjects",
		"nvim-treesitter/playground",
		"RRethy/nvim-treesitter-textsubjects",
		"JoosepAlviste/nvim-ts-context-commentstring",
		"windwp/nvim-ts-autotag",
	},
	config = function()
		require("nvim-treesitter.configs").setup({
			ensure_installed = "all",
			sync_install = false,
			autotag = {
				enable = true,
			},
			context_commentstring = {
				enable = true,
				enable_autocmd = false,
			},
			highlight = {
				enable = true,
			},
			textobjects = {
				select = {
					enable = true,
					lookahead = true,
					keymaps = {
						["af"] = "@function.outer",
						["if"] = "@function.inner",
						["ac"] = "@class.outer",
						["ic"] = "@class.inner",
					},
				},
			},
			textsubjects = {
				enable = true,
				keymaps = {
					["."] = "textsubjects-smart",
					[";"] = "textsubjects-container-outer",
				},
			},
		})
	end,
}
