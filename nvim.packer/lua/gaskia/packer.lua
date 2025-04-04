vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  use {
	  'nvim-telescope/telescope.nvim', tag = '0.1.6',
	  -- or                            , branch = '0.1.x',
	  requires = { {'nvim-lua/plenary.nvim'} }
  }

  use {
	  'theprimeagen/harpoon',
	  branch = 'harpoon2',
	  dependencies =  {'nvim-lua/plenary.nvim'}
  }

  use('nvim-treesitter/nvim-treesitter', {run = ':TSUpdate'})

  use ({
      'shaunsingh/nord.nvim',
      as = 'nord',
      config = function()
          vim.cmd('colorscheme nord')
      end;
      })

  use 'nvim-treesitter/playground'

  use('mbbill/undotree')

  use('tpope/vim-fugitive')
  use {
      'VonHeikemen/lsp-zero.nvim',
      branch = 'v3.x',
      requires = {
          --- Uncomment the two plugins below if you want to manage the language servers from neovim
          {'williamboman/mason.nvim'},
          {'williamboman/mason-lspconfig.nvim'},

          {'neovim/nvim-lspconfig'},
          {'hrsh7th/nvim-cmp'},
          {'hrsh7th/cmp-nvim-lsp'},
          {'L3MON4D3/LuaSnip'},
      }
  }

  use 'fladson/vim-kitty'

  use {
      "nvim-neo-tree/neo-tree.nvim",
      branch = "v3.x",
      requires = {
          "nvim-lua/plenary.nvim",
          "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
          "MunifTanjim/nui.nvim",
          -- "3rd/image.nvim", -- Optional image support in preview window: See `# Preview Mode` for more information
      }
  }
  use {
      'akinsho/flutter-tools.nvim',
      requires = {
          'nvim-lua/plenary.nvim',
          'stevearc/dressing.nvim', -- optional for vim.ui.select
      },
  }
  use 'nvim-lualine/lualine.nvim'
  use 'folke/tokyonight.nvim'
end)
