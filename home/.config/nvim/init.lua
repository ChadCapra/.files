-- Set namespace for all your configuration
local namespace = 'ccaps'

-- Prevent using cached configuration when you :source $MYVIMRC
for name,_ in pairs(package.loaded) do
  if name:match('^' .. namespace) then
    package.loaded[name] = nil
  end
end

-- all configuration is done in namespace to prevent naming collisions
require(namespace)
