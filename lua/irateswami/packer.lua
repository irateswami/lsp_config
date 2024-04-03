vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
	use 'wbthomason/packer.nvim'

	use { 'nvim-telescope/telescope.nvim', tag = '0.1.5', -- or                            , branch = '0.1.x',
		requires = { {'nvim-lua/plenary.nvim'} }
	}

	use ({
		'folke/tokyonight.nvim',
		as = 'tokyonight',
		config = function()
			vim.cmd('colorscheme tokyonight-night')
		end
	})

	use {
	    'nvim-treesitter/nvim-treesitter-context',
		'nvim-treesitter/nvim-treesitter',
		run = function()
			local ts_update = require('nvim-treesitter.install').update({ with_sync = true })
			ts_update()
		end
	}

	use {
		'VonHeikemen/lsp-zero.nvim',
		branch = 'v3.x',
		requires = {
			-- LSP Support
			{'neovim/nvim-lspconfig'},
			{'williamboman/mason.nvim'},
			{'williamboman/mason-lspconfig.nvim'},

			-- Autocompletion
			{'hrsh7th/nvim-cmp'},
			{'hrsh7th/cmp-buffer'},
			{'hrsh7th/cmp-path'},
			{'saadparwaiz1/cmp_luasnip'},
			{'hrsh7th/cmp-nvim-lsp'},
			{'hrsh7th/cmp-nvim-lua'},

			-- Snippets
			{'L3MON4D3/LuaSnip'},
			{'rafamadriz/friendly-snippets'},
		}
	}

    use{
        'nvim-pack/nvim-spectre',
        requires = {
            {'nvim-lua/plenary.nvim'},
        }
    }

    use({
        'iamcco/markdown-preview.nvim',
        run = function() vim.fn['mkdp#util#install']() 
        end,
    })

    use { 
        "rcarriga/nvim-dap-ui", 
        requires = {
            "mfussenegger/nvim-dap", 
            "nvim-neotest/nvim-nio"
        } 
    }

    use('mrcjkb/rustaceanvim')
    use 'buoto/gotests-vim'
	use 'theprimeagen/harpoon'
	use 'theprimeagen/refactoring.nvim'
	use 'mbbill/undotree'
	use 'tpope/vim-fugitive'
	use 'onsails/lspkind.nvim'
	use 'folke/zen-mode.nvim'
	use 'github/copilot.vim'
	use 'eandrju/cellular-automaton.nvim'
	use 'laytan/cloak.nvim'
    use 'stevearc/oil.nvim'
    use 'leoluz/nvim-dap-go'
    use 'theHamsta/nvim-dap-virtual-text'
    use 'nvim-telescope/telescope-dap.nvim'
    use 'ldelossa/nvim-dap-projects'
end)
