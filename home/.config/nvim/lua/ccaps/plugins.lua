local plugins = {

  -- plugin manager & common/shared dependencies
  'wbthomason/packer.nvim',
  'nvim-lua/plenary.nvim',
  'kyazdani42/nvim-web-devicons',


  -- Navigating / Moving
  {'kyazdani42/nvim-tree.lua', extend = 'nvim-tree'},
  {'nvim-telescope/telescope.nvim', extend = 'telescope'},
  {'phaazon/hop.nvim', extend = 'telescope'},


  -- AST / Highlighting
  {'nvim-treesitter/nvim-treesitter', extend = 'treesitter'},
  {'nvim-treesitter/nvim-treesitter-textobjects', extend = 'ts-textobjects'},
  -- {'nvim-treesitter/playground', extend = 'ts-playground'},
  {'elixir-editors/vim-elixir'},


  -- LSP / Autocomplete
  {'neovim/nvim-lspconfig'},
  {'williamboman/nvim-lsp-installer'},
  {'hrsh7th/nvim-cmp', extend = 'nvim-cmp'},

  -- Snippets
  {'L3MON4D3/LuaSnip'},
  {'rafamadriz/friendly-snippets'},

  
  -- Editing
  {'numToStr/Comment.nvim', extend = 'comment'},
  -- {'tpope/vim-surround'}


  -- Theme / Color / Display
  {'karb94/neoscroll.nvim', extend = 'neoscroll'},
  {'bluz71/vim-moonfly-colors'},
  -- {'catppuccin/nvim',	as = 'catppuccin'},
  -- {'folke/tokyonight.nvim'},
  -- {'EdenEast/nightfox.nvim'},

}


-- install packer if not exists 
local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  packer_bootstrap = fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
end


-- initialize and configure packer
local packer = require("packer")
packer.init {
    enable = true, -- enable profiling via :PackerCompile profile=true
    threshold = 0 -- the amount in ms that a plugins load time must be over for it to be included in the profile
}
packer.reset()


-- Load plugins
local pprint = require(ns .. '.utils').pprint

for _, plugin in pairs(plugins) do
  if type(plugin) == "table" and plugin.extend then
    plugin_ext = require(ns .. '.config.' .. plugin.extend)
    plugin = vim.tbl_extend("keep", plugin, plugin_ext)
    plugin.extend = nil
  end
  if log_enabled then pprint(plugin) end
  packer.use(plugin)
end

-- Clean/Update plugins
if packer_bootstrap then
  require('packer').sync()
end
