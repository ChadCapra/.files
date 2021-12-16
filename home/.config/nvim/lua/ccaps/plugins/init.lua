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
local ns = (...)

print(ns)

local plugins = require(ns .. '.all')

for _, plugin in pairs(plugins) do
  if type(plugin) == "table" and plugin.extend then
    plugin_ext = require(ns .. '.' .. plugin.extend)
    plugin = vim.tbl_extend("keep", plugin, plugin_ext)
  end
  packer.use plugin
end


-- Clean/Update plugins
if packer_bootstrap then
  require('packer').sync()
end
