-- MV plugin config
-- require('mvsolves.plugins-config.mason')
require('mvsolves.plugins-config.completion')
require('mvsolves.plugins-config.lspconfig')
require('mvsolves.plugins-config.nvim-tree')
require('mvsolves.plugins-config.lualine')
require('mvsolves.plugins-config.comment')
require('mvsolves.plugins-config.telescope-config')
require('mvsolves.plugins-config.null-ls')
require('mvsolves.plugins-config.md-preview')
require('mvsolves.plugins-config.vim-wiki')
-- require('mvsolves.plugins-config.autopairs')
-- require('mvsolves.plugins-config.nvim-cmp-config')


local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
    vim.cmd [[packadd packer.nvim]]

    -- require('packer').init({
    --   snapshot_path = vim.fn.stdpath('config')..'/lua/mvsolves/snapshots/'
    -- })
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()

require('packer').init({
  snapshot_path = vim.fn.stdpath('config')..'/lua/mvsolves/snapshots/',
  snapshot = 'stable.vim'
})

-- Packer Installer
return require("packer").startup(function(use)
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
	use 'tpope/vim-surround'
  -- use 'windwp/nvim-autopairs'
  use 'mvsolves/MV-pairs'
  use 'christoomey/vim-run-interactive' -- Run terminal commands within Neovim

  -- Notes
  use 'vimwiki/vimwiki'
  -- install without yarn or npm
  use({
      "iamcco/markdown-preview.nvim",
      run = function() vim.fn["mkdp#util#install"]() end,
  })

  -- Telescope
  use 'nvim-telescope/telescope.nvim'
  use 'nvim-lua/plenary.nvim'

  -- Colorschemes
  use 'rafi/awesome-vim-colorschemes'
  use 'vim-scripts/ScrollColors'

	-- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if packer_bootstrap then
    require('packer').sync()
  end
end)
