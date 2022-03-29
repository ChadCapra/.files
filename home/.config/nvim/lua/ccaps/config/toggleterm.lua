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
