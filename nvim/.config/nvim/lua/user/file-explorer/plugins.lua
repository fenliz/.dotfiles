
return function(use)
	use {
		'kyazdani42/nvim-tree.lua',
		config = function()
			local nvim_tree = require'nvim-tree'
			local nvim_tree_cb = require'nvim-tree.config'.nvim_tree_callback

            vim.g.nvim_tree_disable_window_picker = 1
            vim.g.nvim_tree_quit_on_open = 1

            nvim_tree.setup {
				update_focused_file = { 
                    enable = true
                },
				view = {
					width = 40,
					hide_root_folder = true,
					auto_resize = true,
					mappings = {
						list = {
							{ key = 't', cb = nvim_tree_cb('tabnew') },
							{ key = 'l', cb = nvim_tree_cb('edit') },
							{ key = 'h', cb = nvim_tree_cb('parent_node') },
						}
					},
				}
			}
		end
	}
end
