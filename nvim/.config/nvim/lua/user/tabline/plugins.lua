return function(use)
	use({
		"akinsho/bufferline.nvim",
		config = function()
			require("bufferline").setup({
				options = {
					show_close_icon = false,
					show_buffer_close_icons = false,
					enforce_regular_tabs = true,
					diagnostics = "nvim_lsp",
					offsets = { { filetype = "NvimTree", text = "", text_align = "left" } },
				},
			})
		end,
	})
end
