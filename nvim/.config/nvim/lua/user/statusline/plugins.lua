return function(use)
    use {
        'nvim-lualine/lualine.nvim',
        config = function()
            require'lualine'.setup {
                options = {
                    theme = 'nightfox'
                }
            }
        end
    }
end
