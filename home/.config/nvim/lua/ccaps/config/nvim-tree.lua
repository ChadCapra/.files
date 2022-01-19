require(NS .. '.utils').set_mapping({'n', '<leader>t', ':NvimTreeFindFileToggle<cr>'})

local init = function ()
  local tree_cb = require "nvim-tree.config".nvim_tree_callback

  local list = {
    -- { key = {"<leader>v"},     cb = tree_cb("vsplit"), mode = "n" },
    { key = {"<leader><Tab>"}, cb = tree_cb("tabnew"), mode = "n" },
    { key = {"e"},             cb = tree_cb("edit"),   mode = "n" }
  }

  require('nvim-tree').setup {
    -- auto_close = true,
    update_to_buf_dir = {
      enable = true,
      auto_open = true,
    },
    view = {
      width = 35,
      auto_resize = true,
      mappings = {
        custom_only = false,
        list = list,
      }
    }
  }
end

return { config = init }
