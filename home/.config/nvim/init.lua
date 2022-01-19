-- Set namespace for all your configuration
NS = 'ccaps'
LOG_ENABLED = false

-- Prevent using cached configuration when you :source $MYVIMRC
for name,_ in pairs(package.loaded) do
  if name:match('^' .. NS) then
    package.loaded[name] = nil
  end
end

-- all configuration is done in namespace to prevent naming collisions
require(NS)
