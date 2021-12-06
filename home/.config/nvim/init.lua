-- unload existing requires (to prevent using cached configuration)
for name,_ in pairs(package.loaded) do
  if name:match('^ccaps') then
    package.loaded[name] = nil
  end
end

-- Install plugins, default settings, and mappings
require('ccaps.plugins')
require('ccaps.settings')
require('ccaps.mappings')


-- Load Default Configurations
require('Comment').setup()
require('hop').setup()
require('neoscroll').setup()


-- Configure Plugins (beyond default)
require('ccaps.treesitter')
require('ccaps.telescope')
-- require('ccaps.lsp')

