return function(use)
    use {
        'feline-nvim/feline.nvim',
        config = function()
            require'feline'.setup {
                components = require'catppuccin.core.integrations.feline'
            }
        end
    }
end
