
return function(use)
	use {
		'kyazdani42/nvim-tree.lua',
		config = function()
			local nvim_tree = require'nvim-tree'
			local nvim_tree_cb = require'nvim-tree.config'.nvim_tree_callback

            nvim_tree.setup {
				update_focused_file = {
                    enable = true
                },
				view = {
					width = 40,
					hide_root_folder = true,
					mappings = {
						list = {
							{ key = 't', cb = nvim_tree_cb('tabnew') },
							{ key = 'l', cb = nvim_tree_cb('edit') },
							{ key = 'h', cb = nvim_tree_cb('parent_node') },
						}
					},
				},
                actions = {
                    open_file = {
                        resize_window = true
                    }
                },
                renderer = {
                    indent_markers = {
                        enable = true
                    }
                },
			}
		end
	}
end
