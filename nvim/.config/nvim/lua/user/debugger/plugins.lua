return function(use)
    use {
        'mfussenegger/nvim-dap',
        requires = {
            'Pocco81/DAPInstall.nvim',
        },
        config = function()
            require'dap-install'.setup()
        end
    }
end
