local function open_terminal_at_node(node)
	local status_ok, toggleterm = pcall(require, "toggleterm")
	if not status_ok then
		return
	end

	vim.notify(vim.inspect(node))
	toggleterm.exec_command("cwd=" .. node.absolute_path)
end

local M = {}

M.mappings = function()
	nnoremap("<leader>ee", ":NvimTreeFindFile<CR>", "<silent>", "Open file explorer")
	nnoremap("<leader>ec", ":NvimTreeClose<CR>", "<silent>", "Close file explorer")
end

M.plugins = function(use)
	use({
		"kyazdani42/nvim-tree.lua",
		requires = {
			"kyazdani42/nvim-web-devicons",
		},
		tag = "nightly",
		config = function()
			require("nvim-tree").setup({
				view = {
					width = 40,
					hide_root_folder = true,
					mappings = {
						list = {
							{ key = "t", action = "open_terminal", action_cb = open_terminal_at_node },
							{ key = "l", action = "edit" },
							{ key = "h", action = "close_node" },
							{ key = "<C-t>", action = "" },
						},
					},
				},
				actions = {
					open_file = {
						resize_window = true,
					},
				},
			})
		end,
	})
end

return M
