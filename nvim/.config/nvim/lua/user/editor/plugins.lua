return function(use)
    use {
        'numToStr/Comment.nvim',
        config = function()
            require'Comment'.setup()
        end
    }

    use {
        'lukas-reineke/indent-blankline.nvim',
        config = function()
            require'indent_blankline'.setup()
        end
    }

    use 'tpope/vim-surround'

    use 'ggandor/lightspeed.nvim'

    use {
        'norcalli/nvim-colorizer.lua',
        config = function()
          require'colorizer'.setup()
        end
    }
end
