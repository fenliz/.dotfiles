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
		keys = {
			{ "<leader>xx", "<cmd>TroubleToggle<cr>", desc = "Trouble: Toggle" },
			{ "<leader>xw", "<cmd>TroubleToggle workspace_diagnostics<cr>", desc = "Trouble: Workspace" },
			{ "<leader>xd", "<cmd>TroubleToggle document_diagnostics<cr>", desc = "Trouble: Document" },
			{ "<leader>xl", "<cmd>TroubleToggle loclist<cr>", desc = "Trouble: Loclist" },
			{ "<leader>xq", "<cmd>TroubleToggle quickfix<cr>", desc = "Trouble: Quickfix" },
			{
				"<leader>xn",
				function()
					require("trouble").next({ skip_groups = true, jump = true })
				end,
				desc = "Trouble: Next item",
			},
			{
				"<leader>xp",
				function()
					require("trouble").previous({ skip_groups = true, jump = true })
				end,
				desc = "Trouble: Previous item",
			},
		},
		config = function()
			require("trouble").setup()
		end,
	},
	{
		"lukas-reineke/indent-blankline.nvim",
		event = "BufReadPost",
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
