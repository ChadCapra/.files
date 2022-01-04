local init = function ()
  require('nvim-tree').setup {
    -- auto_close = true,
    view = {
      width = 35,
      auto_resize = false
    }
  }
end

return { config = init }
