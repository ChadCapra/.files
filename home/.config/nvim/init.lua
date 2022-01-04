-- Set namespace for all your configuration
ns = 'ccaps'
log_enabled = false

-- Prevent using cached configuration when you :source $MYVIMRC
for name,_ in pairs(package.loaded) do
  if name:match('^' .. ns) then
    package.loaded[name] = nil
  end
end

-- all configuration is done in namespace to prevent naming collisions
require(ns)
