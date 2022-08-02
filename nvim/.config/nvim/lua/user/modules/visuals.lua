local M = {}

M.plugins = function(use)
	use({
		"catppuccin/nvim",
		as = "catppuccin",
		config = function()
			require("catppuccin").setup({
				integrations = {
					lightspeed = true,
					which_key = true,
					lsp_trouble = true,
				},
			})

			vim.cmd([[colorscheme catppuccin]])
		end,
	})

	-- UI Tweaks
	use({
		"stevearc/dressing.nvim",
		config = function()
			require("dressing").setup({
				select = {
					-- Avoid code actions to get cached and interfere with require("telescope.builtin").resume()
					telescope = require("telescope.themes").get_dropdown({ cache_picker = false }),
				},
			})
		end,
	})
end

return M
