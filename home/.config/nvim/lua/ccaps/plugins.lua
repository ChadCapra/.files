-- install packer if not exists
local execute = vim.api.nvim_command
local fn = vim.fn

local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'

if fn.empty(fn.glob(install_path)) > 0 then
  fn.system({'git', 'clone', 'https://github.com/wbthomason/packer.nvim', install_path})
  execute 'packadd packer.nvim'
end

return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  use {
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate'
  }
  use 'nvim-treesitter/nvim-treesitter-textobjects'
  -- use 'nvim-treesitter/playground'

  use {'elixir-editors/vim-elixir'}

  use 'neovim/nvim-lspconfig'
  use 'williamboman/nvim-lsp-installer'

  use {
    'nvim-telescope/telescope.nvim',
    requires = {{'nvim-lua/plenary.nvim'}}
  }

  use {'numToStr/Comment.nvim'}
  use {'tpope/vim-surround'}
  use {'karb94/neoscroll.nvim'}

  use {
    'phaazon/hop.nvim', 
    branch = 'v1'
  }

  use {'bluz71/vim-moonfly-colors'}

end)
