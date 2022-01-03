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
            'RRethy/vim-illuminate'
        },
        config = function()
            local signs = {
                { name = "DiagnosticSignError", text = "" },
                { name = "DiagnosticSignWarn", text = "" },
                { name = "DiagnosticSignHint", text = "" },
                { name = "DiagnosticSignInfo", text = "" },
            }

            for _, sign in ipairs(signs) do
                vim.fn.sign_define(sign.name, { texthl = sign.name, text = sign.text, numhl = "" })
            end

            vim.diagnostic.config {
                signs = { active = signs },
                update_in_insert = true,
                underline = true,
                severity_sort = true,
                float = {
                    focusable = false,
                    style = 'minimal',
                    border = 'rounded',
                    source = 'always',
                    header = '',
                    prefix = ''
                }
            }

            require'nvim-lsp-installer'.on_server_ready(function(server)
                local capabilities = vim.lsp.protocol.make_client_capabilities()
                capabilities = require'cmp_nvim_lsp'.update_capabilities(capabilities)

                local opts = {
                    capabilities = capabilities
                }

                opts.on_attach = function(client, _)
                    require'illuminate'.on_attach(client)
                end

                if server.name == 'sumneko_lua' then
                    require'user.language-servers.configs.lua'(opts)
                elseif server.name == 'jsonls' then
                    require'user.language-servers.configs.json'(opts)
                end

                server:setup(opts)
            end)

            require'lsp_signature'.setup { hint_enable = false }

            require'user.language-servers.configs.null-ls'

            vim.lsp.protocol.CompletionItemKind = {
                '', -- Text
                '', -- Method
                '', -- Function
                '', -- Constructor
                '', -- Field
                '', -- Variable
                '', -- Class
                'ﰮ', -- Interface
                '', -- Module
                '', -- Property
                '', -- Unit
                '', -- Value
                '', -- Enum
                '', -- Keyword
                '﬌', -- Snippet
                '', -- Color
                '', -- File
                '', -- Reference
                '', -- Folder
                '', -- EnumMember
                '', -- Constant
                '', -- Struct
                '', -- Event
                'ﬦ', -- Operator
                '', -- TypeParameter
            }

            vim.lsp.handlers['textDocument/codeAction'] = require'lsputil.codeAction'.code_action_handler
            vim.lsp.handlers['textDocument/references'] = require'lsputil.locations'.references_handler
            vim.lsp.handlers['textDocument/definition'] = require'lsputil.locations'.definition_handler
            vim.lsp.handlers['textDocument/declaration'] = require'lsputil.locations'.declaration_handler
            vim.lsp.handlers['textDocument/typeDefinition'] = require'lsputil.locations'.typeDefinition_handler
            vim.lsp.handlers['textDocument/implementation'] = require'lsputil.locations'.implementation_handler
            vim.lsp.handlers['textDocument/documentSymbol'] = require'lsputil.symbols'.document_handler
            vim.lsp.handlers['workspace/symbol'] = require'lsputil.symbols'.workspace_handler
        end
    }

    use {
        'ThePrimeagen/refactoring.nvim',
        config = function()
            require'refactoring'.setup{ }
        end
    }
end
