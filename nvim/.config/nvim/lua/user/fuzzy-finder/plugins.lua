return function(use)
	use {
		'nvim-telescope/telescope.nvim',
        config = function()
            require'telescope'.setup {
                defaults = {
                    layout_strategy = 'bottom_pane',
                    layout_config = {
                        height = 25,
                        prompt_position = 'bottom'
                    }
                },
                extensions = {
                    fzf = {
                        fuzzy = true,
                        override_generic_sorter = true,
                        override_file_sorter = true,
                        case_mode = 'smart_case'
                    }
                }
            }
        end
	}

    use {
        'nvim-telescope/telescope-fzf-native.nvim',
        run = 'make',
        config = function()
            require'telescope'.load_extension('fzf')
        end
    }

    use {
        'ThePrimeagen/harpoon',
        config = function()
            require"telescope".load_extension('harpoon')
        end
    }
 
    use {
        'AckslD/nvim-neoclip.lua',
        config = function()
            require'neoclip'.setup {
                keys = {
                    telescope = {
                        i = {
                            paste = '<CR>',
                            select = '<C-y>',
                        }
                    }
                }
            }
        end
    }
end
