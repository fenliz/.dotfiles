return function(use)
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

	use {
		'nvim-telescope/telescope.nvim',
        config = function()
            require'telescope'.setup() 
        end
	}

end
