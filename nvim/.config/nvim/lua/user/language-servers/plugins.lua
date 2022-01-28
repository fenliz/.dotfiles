return function(use)
    use {
        'neovim/nvim-lspconfig',
        requires = {
            'williamboman/nvim-lsp-installer',
            'b0o/SchemaStore.nvim',
            'jose-elias-alvarez/null-ls.nvim',
            'RishabhRD/popfix',
            'RishabhRD/nvim-lsputils',
            'ray-x/lsp_signature.nvim',
            'simrat39/rust-tools.nvim',
        },
        config = function()
            vim.lsp.handlers['textDocument/codeAction'] = require'lsputil.codeAction'.code_action_handler
            vim.lsp.handlers['textDocument/references'] = require'lsputil.locations'.references_handler
            vim.lsp.handlers['textDocument/definition'] = require'lsputil.locations'.definition_handler
            vim.lsp.handlers['textDocument/declaration'] = require'lsputil.locations'.declaration_handler
            vim.lsp.handlers['textDocument/typeDefinition'] = require'lsputil.locations'.typeDefinition_handler
            vim.lsp.handlers['textDocument/implementation'] = require'lsputil.locations'.implementation_handler
            vim.lsp.handlers['textDocument/documentSymbol'] = require'lsputil.symbols'.document_handler
            vim.lsp.handlers['workspace/symbol'] = require'lsputil.symbols'.workspace_handler

            require'user.language-servers.diagnostics'
            require'user.language-servers.configs.null-ls'
            require'lsp_signature'.setup { hint_enable = false }

            require'nvim-lsp-installer'.on_server_ready(function(server)
                local capabilities = vim.lsp.protocol.make_client_capabilities()

                local opts = {
                    capabilities = require'cmp_nvim_lsp'.update_capabilities(capabilities),
                    on_attach = function(client, bufnr)
                        require'user.language-servers.buffer-mappings'(bufnr)

                        if client.resolved_capabilities.document_formatting then
                            vim.cmd('autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting()')
                        end
                    end
                }

                if server.name == 'sumneko_lua' then
                    require'user.language-servers.configs.lua'(opts)
                elseif server.name == 'tsserver' then
                    require'user.language-servers.configs.typescript'(opts)
                elseif server.name == 'jsonls' then
                    require'user.language-servers.configs.json'(opts)
                elseif server.name == 'rust_analyzer' then
                    require'user.language-servers.configs.rust'(server, opts)
                    server:attach_buffers()
                    return;
                end

                server:setup(opts)
            end)
        end
    }

    use {
        'ThePrimeagen/refactoring.nvim',
        config = function()
            require'refactoring'.setup{ }
        end
    }
end
