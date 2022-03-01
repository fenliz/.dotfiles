return function(use)
    use {
        'hrsh7th/nvim-cmp',
        requires = {
            'hrsh7th/cmp-buffer',
            'hrsh7th/cmp-emoji',
            'hrsh7th/cmp-nvim-lua',
            'hrsh7th/cmp-nvim-lsp',
            'hrsh7th/cmp-path',
            'hrsh7th/cmp-cmdline',
            'hrsh7th/cmp-nvim-lsp-document-symbol',

            'windwp/nvim-autopairs',

			'L3MON4D3/LuaSnip',
            'rafamadriz/friendly-snippets',
			'saadparwaiz1/cmp_luasnip',

            'github/copilot.vim',
        },
        config = function()
            local cmp = require'cmp'
	        local luasnip = require'luasnip'

            require'nvim-autopairs'.setup()

            vim.g.copilot_no_tab_map = true
            vim.g.copilot_assume_mapped = true
            vim.g.copilot_tab_fallback = ""
            vim.api.nvim_set_keymap('i', '<C-l>', 'copilot#Accept("<CR>")', {expr=true, silent=true})

            cmp.setup({
                sources = {
                    { name = 'nvim_lsp' },
                    { name = 'nvim_lua' },
                    { name = 'luasnip' },
                    { name = 'orgmode' },
                    { name = 'emoji' },
                    { name = 'buffer' },
                    { name = 'path' },
                },
                formatting = {
                    fields = { 'abbr', 'kind', 'menu' },
                    format = require'user.code-completion.utils'.format,
                },
                mapping = {
                    ['<C-p>'] = cmp.mapping.select_prev_item(),
                    ['<C-n>'] = cmp.mapping.select_next_item(),
                    ['<C-d>'] = cmp.mapping.scroll_docs(-4),
                    ['<C-f>'] = cmp.mapping.scroll_docs(4),
                    ['<C-Space>'] = cmp.mapping.complete(),
                    ['<C-c>'] = cmp.mapping {
                        i = cmp.mapping.abort(),
                        c = cmp.mapping.close(),
                    },
                    ['<CR>'] = cmp.mapping.confirm { select = true },
        			['<Tab>'] = cmp.mapping(function(fallback)
                        if luasnip.expand_or_jumpable() then
                            luasnip.expand_or_jump()
                        else
                            fallback()
                        end
                        -- end
           --              if cmp.visible() then
           --                  cmp.select_next_item()
        			-- 	elseif luasnip.expand_or_jumpable() then
           --                  luasnip.expand_or_jump()
           --              else
           --                  local copilot_keys = vim.fn["copilot#Accept"]()
           --                  if copilot_keys ~= "" then
           --                      vim.api.nvim_feedkeys(copilot_keys, "i", true)
           --                  else
           --                      fallback()
           --                  end
        			-- 	end
        			end, { 'i', 's' }),
        			['<S-Tab>'] = cmp.mapping(function(fallback)
        				if luasnip.jumpable(-1) then
                            luasnip.jump(-1)
        				else
        					fallback()
        				end
           --              if cmp.visible() then
           --                  cmp.select_prev_item()
        			-- 	elseif luasnip.jumpable(-1) then
           --                  luasnip.jump(-1)
        			-- 	else
        			-- 		fallback()
        			-- 	end
        			end, { 'i', 's' }),
                },
                snippet = {
                    expand = function(args)
                        require('luasnip').lsp_expand(args.body)
                    end
                },
            })

            cmp.setup.cmdline(':', {
                sources = {
                    { name = 'cmdline' }
                }
            });

            cmp.setup.cmdline('/', {
                sources = cmp.config.sources({
                    { name = 'nvim_Lsp_document_symbol' },
                }, {
                    { name = 'buffer' }
                })
            })

            require'user.code-completion.snippets'
        end
    }
end
