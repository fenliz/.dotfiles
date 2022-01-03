local wk = require('which-key')
local g = vim.g

-- Show indent markers
g.nvim_tree_indent_markers = 1

g.nvim_tree_show_icons = {
	git = 0,
	folders = 1,
	files = 1,
	folder_arrows = 1,
}

wk.register({
	e = {
		name = 'Explorer',
		e = { ':NvimTreeFocus<CR>', 'Open' },
		c = { ':NvimTreeClose<CR>', 'Close' },
	}
}, { prefix = '<leader>' })

local M = {}

M.bootstrap = function()
	local nvim_tree = require('nvim-tree')
	local nvim_tree_cb = require('nvim-tree.config').nvim_tree_callback

	nvim_tree.setup({
        diagnostics = { enable = true },
		update_focused_file = { enable = true },
		view = {
			width = 30,
			auto_resize = true,
            hide_root_folder = true,
			mappings = {
				list = {
					{ key = 't', cb = nvim_tree_cb('tabnew') },
					{ key = 'l', cb = nvim_tree_cb('edit') },
					{ key = 'h', cb = nvim_tree_cb('parent_node') },
				}
			}
		},
        git = {
            enable = true,
            ignore = true,
            timeout = 500,
        }
	})
end

return M
