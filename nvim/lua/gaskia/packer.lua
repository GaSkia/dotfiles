vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
	--------------
	--- PACKER ---
	--------------
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  -----------------
  --- TELESCOPE ---
  -----------------
  use {
	  'nvim-telescope/telescope.nvim', tag = '0.1.6',
	  -- or                            , branch = '0.1.x',
	  requires = { {'nvim-lua/plenary.nvim'} }
  }

end)
