local Terminal  = require('toggleterm.terminal').Terminal
local lazygit = Terminal:new({
  cmd = "lazygit",
  hidden = true,
  direction = "float",
  float_opts = {
    border = "double",
  }
})

function _LAZYGIT_TOGGLE()
  lazygit:toggle()
end

local maps = {

  --File Explorer
  {'n', '<leader>g', [[<cmd>lua _LAZYGIT_TOGGLE()<CR>]]},
}

require(NS .. '.utils').set_mappings(maps)

local M = {}

M.config  = function ()
  require("toggleterm").setup{
    -- size can be a number or function which is passed the current terminal
    size = 20,
    open_mapping = [[<c-\>]],
    shell = 'fish',
  }

end

return M
