local use = require('packer').use

return require('packer').startup(function()
    use { 'wbthomason/packer.nvim' }

    -- Color schemes.
    use {'rose-pine/neovim'}

    -- Toggle comment
    use {
        'terrortylor/nvim-comment',
        cmd = "CommentToggle",
        config = function() --needed to load the plugin
            require('nvim_comment').setup()
        end
    }

    -- Working on matching text
    use { 'andymass/vim-matchup' }

    -- Indent blanklines
    use {
        'lukas-reineke/indent-blankline.nvim',
        event = 'BufRead',
        config= function()
            require('plugins/indent-blankline')
        end
    }

    -- Auto-closes parens
    use {
        'windwp/nvim-autopairs',
        event = 'BufRead',
        config = function()
            require('nvim-autopairs').setup{}
        end
    }

    -- Show trailing whitespace.
    use {
        'ntpeters/vim-better-whitespace',
        cmd = {
        'EnableWhitespace',
        'DisableWhitespace'
        }
    }

    -- Icons.
    use {
        'kyazdani42/nvim-web-devicons',
        event = 'BufEnter'
    }

    -- File explorer tree.
    use { 'kyazdani42/nvim-tree.lua',
        cmd = {
            'NvimTreeOpen',
            'NvimTreeFocus',
            'NvimTreeToggle',
        },
        config = function()
            require('plugins/nvim-tree')
        end
    }

    -- Bufferline.
    use {
        'akinsho/nvim-bufferline.lua',
        after = 'nvim-web-devicons',
        config  = function()
            require('plugins/bufferline')
        end
    }

    -- Statusline
    use {
        'nvim-lualine/lualine.nvim',
        after = 'nvim-bufferline.lua',
        config = function ()
            require('plugins/lualine')
        end
    }

    -- TreeSitter - a parse generator tool
    -- Usage: https://github.com/nvim-treesitter/nvim-treesitter
    use {
        'nvim-treesitter/nvim-treesitter',
        run = ':TSUpdate',
        event = 'BufRead',
        cmd = {
            'TSInstall',
            'TSInstallSync',
            'TSBufEnable',
            'TSBufToggle',
            'TSEnableAll',
            'TSInstallFromGrammer',
            'TSToggleAll',
            'TSUpdate',
            'TSUpdateSync'
        },
        config = function()
            require('plugins/treesitter')
        end
    }

    -- Completion
    use { 'hrsh7th/nvim-cmp' }          -- default completion
    use { 'hrsh7th/cmp-buffer' }        -- completion in buffer
    use { 'hrsh7th/cmp-cmdline' }       -- completion in cmdline
    use { 'hrsh7th/cmp-path' }          -- path completion
    use { 'saadparwaiz1/cmp_luasnip' }  -- snippets completion
    use { 'hrsh7th/cmp-nvim-lsp' }
    require('plugins/cmp')              -- config options for cmp

    -- Snippets
    use { 'L3MON4D3/LuaSnip' }
    use { 'rafamadriz/friendly-snippets' } -- a database of useful snippets

    -- LSP
    use { 'neovim/nvim-lspconfig' }
    use { 'williamboman/nvim-lsp-installer' }
    require('plugins/lsp') -- when requiring directory, lua looks for init.lua
    use { 'ray-x/lsp_signature.nvim',
        config = function()
            require("lsp_signature").setup()
        end
    }
end)
