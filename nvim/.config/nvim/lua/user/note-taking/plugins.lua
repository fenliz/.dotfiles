return function(use)
    use {
        'nvim-neorg/neorg',
        config = function()
            require'neorg'.setup {
                load = {
                    ['core.defaults'] = {},
                    ['core.norg.concealer'] = {},
                    ['core.norg.dirman'] = {
                        config = {
                            workspaces = {
                                my_workspace = '~/neorg'
                            }
                        }
                    },
                    ['core.norg.completion'] = {
                        config = {
                            engine = 'nvim-cmp'
                        }
                    }
                }
            }
        end
    }
end
