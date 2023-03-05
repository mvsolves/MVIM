-- Packer Installer
require("packer").startup(function()
 -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  -- Syntax highlighting
  use 'sheerun/vim-polyglot'

  -- Syntax formatting
  use 'jose-elias-alvarez/null-ls.nvim'

  -- Language server
  use 'williamboman/mason-lspconfig.nvim'
  use 'kabouzeid/nvim-lspinstall'
  use 'williamboman/mason.nvim'
  use 'neovim/nvim-lspconfig'

  -- Completion
  use 'rafamadriz/friendly-snippets'
  use 'hrsh7th/cmp-nvim-lsp'
  use 'folke/neodev.nvim'
  use 'hrsh7th/nvim-cmp'
  use 'L3MON4D3/LuaSnip'
  use 'hrsh7th/cmp-path'
  use 'saadparwaiz1/cmp_luasnip'

  -- UI and display
  use 'nvim-lualine/lualine.nvim'
  use 'nvim-tree/nvim-tree.lua'
  use 'ap/vim-css-color'

  -- Utility plugins
  use 'numToStr/Comment.nvim'

  -- Notes
  use 'vimwiki/vimwiki'

  -- Telescope
  use 'nvim-telescope/telescope.nvim'
  use 'nvim-lua/plenary.nvim'

  -- Colorschemes
  use 'rafi/awesome-vim-colorschemes'
  use 'vim-scripts/ScrollColors'
end)




-- MV plugin config
-- require('mvsolves.plugins-config.mason')
require('mvsolves.plugins-config.completion')
require('mvsolves.plugins-config.lspconfig')
require('mvsolves.plugins-config.nvim-tree')
require('mvsolves.plugins-config.lualine')
require('mvsolves.plugins-config.comment')
require('mvsolves.plugins-config.telescope-config')
require('mvsolves.plugins-config.null-ls')
-- require('mvsolves.plugins-config.nvim-cmp-config')

