return function(use)
    use { 'catppuccin/nvim',
        as = 'catppuccin',
        config = function()
            require'catppuccin'.setup {
                integrations = {
                    neogit = true,
                    lightspeed = true
                }
            }

            vim.cmd[[colorscheme catppuccin]]
        end
    }
end
