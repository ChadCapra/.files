return {

  -- plugin manager
  'wbthomason/packer.nvim',


  -- common/shared dependencies
  'nvim-lua/plenary.nvim',
  'kyazdani42/nvim-web-devicons',


  -- Navigating / Moving
  {'kyazdani42/nvim-tree.lua'},
  {'nvim-telescope/telescope.nvim', extend = 'telescope'},
  {'phaazon/hop.nvim', extend = 'telescope'},


  -- AST / Highlighting
  {'nvim-treesitter/nvim-treesitter', extend = 'treesitter'},
  {'nvim-treesitter/nvim-treesitter-textobjects', extend = 'ts-textobjects'},
  -- {'nvim-treesitter/playground', extend = 'ts-playground'},
  {'elixir-editors/vim-elixir'},


  -- LSP / Autocomplete / Snippets
  -- {'neovim/nvim-lspconfig'},
  -- {'williamboman/nvim-lsp-installer'},

  
  -- Editing
  {'numToStr/Comment.nvim', extend = 'comment'},
  -- {'tpope/vim-surround'}


  -- Theme / Color / Display
  {'karb94/neoscroll.nvim', extend = 'neoscroll'},
  {'bluz71/vim-moonfly-colors', extend = 'colorscheme'},

}
