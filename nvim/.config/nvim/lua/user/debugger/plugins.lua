return function(use)
    use {
        'mfussenegger/nvim-dap',
        requires = {
            'Pocco81/DAPInstall.nvim',
            'rcarriga/nvim-dap-ui',
        },
        config = function()
            require'dap'
            require'dap-install'.setup()
            require'dapui'.setup()

            local listeners = require'dap'.listeners

            listeners.after.event_initialized['dapui_config'] = function()
                require'dapui'.open()
            end
            listeners.before.event_terminated['dapui_config'] = function()
                require'dapui'.close()
            end
            listeners.before.event_exited['dapui_config'] = function()
                require'dapui'.close()
            end
            

            local signs = {
                { name = 'DapBreakpoint', text='●' },
                { name = 'DapBreakpointCondition', text='◆' },
                { name = 'DapLogPoint', text='◉' },
                { name = 'DapBreakpointRejected', text = '○' },
                { name = 'DapStopped', text='▶' },
            }

            for _, sign in ipairs(signs) do
                vim.fn.sign_define(sign.name, { text = sign.text, texthl = '', linehl = '', numhl = '' })
            end
        end
    }
end
