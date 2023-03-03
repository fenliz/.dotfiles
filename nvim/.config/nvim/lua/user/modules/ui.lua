-- vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
-- 	border = "rounded",
-- 	silent = true,
-- })

vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, {
	border = "rounded",
})

return {
	{
		"rcarriga/nvim-notify",
		event = "BufReadPre",
		config = function()
			require("notify").setup()
		end,
	},
	{
		"stevearc/dressing.nvim",
		event = "BufReadPre",
		dependencies = {
			"MunifTanjim/nui.nvim",
		},
		config = function()
			require("dressing").setup({
				select = {
					get_config = function(opts)
						if opts.kind == "codeaction" then
							-- Avoid code actions getting cached since it
							-- interferes with telescope.resume()
							return {
								telescope = require("telescope.themes").get_cursor({
									cache_picker = false,
								}),
							}
						end
					end,
				},
			})
		end,
	},
	{
		"folke/noice.nvim",
		event = "BufReadPre",
		dependencies = {
			"MunifTanjim/nui.nvim",
		},
		config = function()
			require("noice").setup({
				lsp = {
					override = {
						["vim.lsp.util.convert_input_to_markdown_lines"] = true,
						["vim.lsp.util.stylize_markdown"] = true,
						["cmp.entry.get_documentation"] = true,
					},
				},
				presets = {
					bottom_search = false,
					command_palette = true,
					long_message_to_split = true,
					inc_rename = false,
					lsp_doc_border = true,
				},
				view = {
					cmdline_popup = {
						position = {
							row = 5,
							col = "50%",
						},
						size = {
							width = 60,
							height = "auto",
						},
					},
					popupmenu = {
						relative = "editor",
						position = {
							row = 8,
							col = "50%",
						},
						size = {
							width = 60,
							height = 10,
						},
						border = {
							style = "rounded",
							padding = { 0, 1 },
						},
						win_options = {
							winhighlight = { Normal = "Normal", FloatBorder = "DiagnosticInfo" },
						},
					},
				},
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
