vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = "rounded" })
vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, { border = "rounded" })

return {
	{
		"stevearc/dressing.nvim",
		event = "BufReadPre",
		config = function()
			require("dressing").setup({
				-- Avoid code actions getting cached since it
				-- interferes with telescope.resume()
				telescope = require("telescope.themes").get_dropdown({
					cache_picker = false,
				}),
			})
		end,
	},
	{
		"folke/trouble.nvim",
		keys = "<leader>x",
		config = function()
			require("trouble").setup()
		end,
		init = function()
			require("which-key").register({
				["<leader>x"] = {
					name = "Trouble",

					x = {
						"<cmd>TroubleToggle<cr>",
						"Toggle",
					},
					w = {
						"<cmd>TroubleToggle workspace_diagnostics<cr>",
						"Workspace diagnostics",
					},
					d = {
						"<cmd>TroubleToggle document_diagnostics<cr>",
						"Document diagnostics",
					},
					q = {
						"<cmd>TroubleToggle quickfix<cr>",
						"Quickfix list",
					},
					l = {
						"<cmd>TroubleToggle loclist<cr>",
						"Location list",
					},
					n = {
						function()
							require("trouble").next({
								skip_groups = true,
								jump = true,
							})
						end,
						"Next item",
					},
					p = {
						function()
							require("trouble").previous({
								skip_groups = true,
								jump = true,
							})
						end,
						"Previous item",
					},
				},
			})
		end,
	},
	{
		"lukas-reineke/indent-blankline.nvim",
		event = "BufReadPre",
		config = function()
			require("indent_blankline").setup()
		end,
	},
	{
		"feline-nvim/feline.nvim",
		event = "BufReadPre",
		dependencies = {
			"nvim-tree/nvim-web-devicons",
		},
		config = function()
			require("feline").setup({
				components = require("catppuccin.groups.integrations.feline").get(),
			})
			require("feline").winbar.setup()
		end,
	},
}
