local M = {}

M.mappings = function()
	nnoremap("<leader>nn", "<Cmd>MindOpenProject<CR>", "<silent>", "Notes: Project")
	nnoremap("<leader>ng", "<Cmd>MindOpenMain<CR>", "<silent>", "Notes: Global")
end

M.plugins = function(use)
	use({
		"phaazon/mind.nvim",
		requires = { "nvim-lua/plenary.nvim" },
		config = function()
			require("mind").setup()
		end,
	})
end

return M
