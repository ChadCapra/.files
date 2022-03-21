local M = {}

M.branch = "stable"

M.config = function ()
  -- local palette = require('mini.base16').mini_palette('#112641', '#e2e98f', 75)
  -- palette["base00"] = "#000000"
  --
  -- require('mini.base16').setup({
  --   palette = palette, name = 'minischeme', use_cterm = true
  -- })

  require('mini.bufremove').setup()
  require('mini.comment').setup()
  -- require('mini.completion').setup()
  -- require('mini.cursorword').setup()
  require('mini.doc').setup()
  -- require('mini.fuzzy').setup()
  -- require('mini.indentscope').setup()
  require('mini.jump').setup()
  -- require('mini.misc').setup()
  require('mini.pairs').setup()
  -- require('mini.sessions').setup()
  require('mini.starter').setup()
  require('mini.statusline').setup()
  require('mini.surround').setup()
  require('mini.tabline').setup()
  require('mini.trailspace').setup()

end

return M
