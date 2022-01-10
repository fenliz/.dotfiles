return function(use)
    use {
        'nvim-lualine/lualine.nvim',
        config = function()
            require'lualine'.setup {
                options = {
                    theme = 'nightfox',
                    disabled_filetypes = {
                        'NvimTree',
                        'dapui_scopes' ,
                        'dapui_breakpoints' ,
                        'dapui_stacks' ,
                        'dapui_watches' ,
                    }
                }
            }
        end
    }
end
