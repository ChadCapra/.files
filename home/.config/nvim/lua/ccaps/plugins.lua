local plugins = {

  -- plugin manager & common/shared dependencies
  'wbthomason/packer.nvim',
  'nvim-lua/plenary.nvim',
  'kyazdani42/nvim-web-devicons',
  'MunifTanjim/nui.nvim',

  -- mini.nvim (a collection of useful plugins)
  {'echasnovski/mini.nvim', extend = 'mini-nvim'},
  {'akinsho/toggleterm.nvim', extend = 'toggleterm'},

  -- Navigating / Moving
  -- {'kyazdani42/nvim-tree.lua', extend = 'nvim-tree'},
  {'nvim-neo-tree/neo-tree.nvim', extend = 'neo-tree'},
  {'nvim-telescope/telescope.nvim', extend = 'telescope'},
  -- {'ggandor/lightspeed.nvim', extend = 'lightspeed'},


  -- AST / Highlighting
  {'nvim-treesitter/nvim-treesitter', extend = 'treesitter'},
  {'nvim-treesitter/nvim-treesitter-textobjects', extend = 'treesitter-to'},
  -- {'nvim-treesitter/playground', extend = 'treesitter-play'},
  {'elixir-editors/vim-elixir'},


  -- Autocomplete / LSP
  {'hrsh7th/nvim-cmp', extend = 'nvim-cmp'},
  {'neovim/nvim-lspconfig', extend = 'lsp'},
  -- {'folke/trouble.nvim'},


  -- Snippets
  {'L3MON4D3/LuaSnip'},
  {'rafamadriz/friendly-snippets'},


  -- Editing
  -- {'numToStr/Comment.nvim', extend = 'comment'},
  -- {'tpope/vim-surround'},


  -- Theme / Color / Display
  {'karb94/neoscroll.nvim', extend = 'neoscroll'},
  {'bluz71/vim-moonfly-colors'},
  -- {'catppuccin/nvim',	as = 'catppuccin'},
  -- {'folke/tokyonight.nvim'},
  -- {'EdenEast/nightfox.nvim'},

}


-- install packer if not exists
local packer_bootstrap
local fn = vim.fn
local execute = vim.api.nvim_command
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  packer_bootstrap = fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
  execute 'packadd packer.nvim'
end


-- initialize and configure packer
local packer = require("packer")
packer.init {
  enable = true, -- enable profiling via :PackerCompile profile=true
  threshold = 0 -- the amount in ms that a plugins load time must be over for it to be included in the profile
}
packer.reset()


-- Load plugins
local pprint = require(NS .. '.utils').pprint

for _, plugin in pairs(plugins) do
  if type(plugin) == "table" and plugin.extend then
    local plugin_ext = require(NS .. '.config.' .. plugin.extend)
    plugin = vim.tbl_extend("keep", plugin, plugin_ext)
    plugin.extend = nil
  end
  if LOG_ENABLED then pprint(plugin) end
  packer.use(plugin)
end

-- Clean/Update plugins
if packer_bootstrap then
  require('packer').sync()
end
