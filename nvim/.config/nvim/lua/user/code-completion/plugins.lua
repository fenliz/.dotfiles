
return function(use)
    use {
        'hrsh7th/nvim-cmp',
        requires = {
            'hrsh7th/cmp-buffer',
            'hrsh7th/cmp-emoji',
            'hrsh7th/cmp-nvim-lua',
            'hrsh7th/cmp-nvim-lsp',
            'hrsh7th/cmp-path',

            'windwp/nvim-autopairs',

			'L3MON4D3/LuaSnip',
			'saadparwaiz1/cmp_luasnip',
        },
        config = function()
            local cmp = require'cmp'
	        local luasnip = require'luasnip'

            require'nvim-autopairs'.setup()

            local check_backspace = function()
                local col = vim.fn.col '.' - 1
                return col == 0 or vim.fn.getline('.'):sub(col, col):match '%s' ~= nil
            end

            cmp.setup({
                sources = {
                    { name = 'nvim_lsp' },
                    { name = 'nvim_lua' },
                    { name = 'luasnip' },
                    { name = 'orgmode' },
                    { name = 'emoji' },
                    { name = 'buffer' },
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
                    ['<C-e>'] = cmp.mapping {
                        i = cmp.mapping.abort(),
                        c = cmp.mapping.close(),
                    },
                    ['<CR>'] = cmp.mapping.confirm { select = true },
        			['<Tab>'] = cmp.mapping(function(fallback)
                        if cmp.visible() then
                            cmp.select_next_item()
                        elseif luasnip.expandable() then
                            luasnip.expand()
        				elseif luasnip.expand_or_jumpable() then
                            luasnip.expand_or_jump()
        				elseif check_backspace() then
                            fallback()
        				else
        					fallback()
        				end
        			end, { 'i', 's' }),
        			['<S-Tab>'] = cmp.mapping(function(fallback)
                        if cmp.visible() then
                            cmp.select_prev_item()
        				elseif luasnip.jumpable(-1) then
                            luasnip.jump(-1)
        				else
        					fallback()
        				end
        			end, { 'i', 's' }),
                },
                snippet = {
                    expand = function(args)
                        require('luasnip').lsp_expand(args.body)
                    end
                },
            })

            require'user.code-completion.snippets'
        end
    }
end
