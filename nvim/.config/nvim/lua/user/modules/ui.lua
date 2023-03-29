return {
	{
		"rcarriga/nvim-notify",
		event = "BufReadPre",
		opts = {
			render = "compact",
		},
	},
	{
		"stevearc/dressing.nvim",
		event = "BufReadPre",
		dependencies = {
			"MunifTanjim/nui.nvim",
		},
		opts = {
			select = {
				get_config = function(opts)
					if opts.kind == "codeaction" then
						return {
							-- Avoid code actions getting cached since it
							-- interferes with telescope.resume()
							telescope = require("telescope.themes").get_cursor({
								cache_picker = false,
							}),
						}
					end
				end,
			},
		},
	},
	{
		"folke/noice.nvim",
		event = "BufReadPre",
		dependencies = {
			"MunifTanjim/nui.nvim",
		},
		keys = {
			{
				"<leader>fn",
				function()
					require("noice").cmd("history")
				end,
				desc = "Find: Notification",
			},
		},
		opts = {
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
				long_message_to_split = false,
				inc_rename = false,
				lsp_doc_border = true,
			},
			routes = {
				{
					filter = {
						any = {
							-- "written" messages when saving a file
							{ event = "msg_show", kind = "", find = "written" },
							-- When hover doesn't have any information (mostly for multiple LSPs)
							{ find = "No information available" },
						},
					},
					opts = { skip = true },
				},
			},
		},
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
		config = true,
	},
	{
		"lukas-reineke/indent-blankline.nvim",
		event = "BufReadPost",
		config = true,
	},
}
