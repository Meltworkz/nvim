-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'

  use {
	  'nvim-telescope/telescope.nvim', tag = '0.1.8',
	  -- or                            , branch = '0.1.x',
	  requires = { {'nvim-lua/plenary.nvim'} }
  }

--    if you want to use nord colorscheme delete comment

   --  use {
	  -- 'shaunsingh/nord.nvim',
	  -- as = 'nord',
	  -- config = function()
		 --  vim.cmd('colorscheme nord')
	  -- end
	  -- }

-- rose pine color scheme
use{ "rose-pine/neovim", as = "rose-pine" }

use('nvim-treesitter/nvim-treesitter', {run = ':TSUpdate'})
use('nvim-treesitter/playground')
use('ThePrimeagen/harpoon')
use('mbbill/undotree')
use('tpope/vim-fugitive')
use('numToStr/Comment.nvim')

-- if i want to use nvim Tree remove comment
-- use{
--  'nvim-tree/nvim-tree.lua',
--  requires = {
--    'nvim-tree/nvim-web-devicons', -- optional
--  },
--}

use {
    'VonHeikemen/lsp-zero.nvim',
    branch = 'v1.x',
    requires = {
        -- LSP Support
        {'neovim/nvim-lspconfig'},
        {'williamboman/mason.nvim'},
        {'williamboman/mason-lspconfig.nvim'},
        -- Autocompletion
        {'hrsh7th/nvim-cmp'},
        {'hrsh7th/cmp-nvim-lsp'},
        {'L3MON4D3/LuaSnip'},
		-- {'jose-elias-alvarez/null-ls.nvim'},
		{'mhartington/formatter.nvim'},
    }
}

end)
