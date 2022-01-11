return function(use)
	use {
        'TimUntersberger/neogit',
		requires = {
			'sindrets/diffview.nvim',
			'lewis6991/gitsigns.nvim',
		},
		config = function()
            local gitsigns = require('gitsigns')
            local diffview_cb = require('diffview.config').diffview_callback

            require'neogit'.setup({
                integrations = { diffview = true }
            })

            require'diffview'.setup({
                diff_binaries = false,
                file_panel = {
                    width = 35,
                },
                key_bindings = {
                    disable_defaults = true,

                    view = {
                        ['<tab>']		= diffview_cb('select_next_entry'),
                        ['<s-tab>']		= diffview_cb('select_prev_entry'),
                        ['<leader>e']	= diffview_cb('focus_files'),
                        ['<leader>b']	= diffview_cb('toggle_files'),
                    },
                    file_panel = {
                        ['j']			= diffview_cb('next_entry'),
                        ['k']			= diffview_cb('prev_entry'),
                        ['<cr>']		= diffview_cb('select_entry'),
                        ['l']			= diffview_cb('select_entry'),
                        ['-']			= diffview_cb('toggle_stage_entry'),
                        ['S']			= diffview_cb('stage_all'),
                        ['U']			= diffview_cb('unstage_all'),
                        ['X']			= diffview_cb('restore_entry'),
                        ['R']           = diffview_cb('refresh_files'),
                        ['<tab>']       = diffview_cb('select_next_entry'),
                        ['<s-tab>']     = diffview_cb('select_prev_entry'),
                        ['<leader>e']   = diffview_cb('focus_files'),
                        ['<leader>b']	= diffview_cb('toggle_files'),
                    }
                }
            })

            gitsigns.setup()
        end
	}
end