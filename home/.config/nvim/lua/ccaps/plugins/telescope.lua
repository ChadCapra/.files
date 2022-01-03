local ns = select('1', ...):match(".-%.") or ""
local map = require(ns .. 'utils').keymap

local init = function ()

  --Find Files (ff = Find File / fg = Find git (tracked files) / fr = Find Recent / fe = File Explorer)
  map('n', '<leader>ff', [[<cmd>lua require('telescope.builtin').find_files()<CR>]])
  map('n', '<leader>fg', [[<cmd>lua require('telescope.builtin').git_files()<CR>]])
  map('n', '<leader>fr', [[<cmd>lua require('telescope.builtin').oldfiles()<CR>]])
  map('n', '<leader>fe', [[<cmd>lua require('telescope.builtin').file_browser({hidden=true})<CR>]])

  --Find in Buffers (fb = Find Buffer / fc = Find Current)
  map('n', '<leader>fb', [[<cmd>lua require('telescope.builtin').buffers()<CR>]])
  map('n', '<leader>fc', [[<cmd>lua require('telescope.builtin').current_buffer_fuzzy_find()<CR>]])

  --Find Words/Strings (fw = Find Word (under cursor) / fs = Find String)
  map('n', '<leader>fw', [[<cmd>lua require('telescope.builtin').grep_string()<CR>]])
  map('n', '<leader>fs', [[<cmd>lua require('telescope.builtin').live_grep()<CR>]])

  --Find Help (fh)
  map('n', '<leader>fh', [[<cmd>lua require('telescope.builtin').help_tags()<CR>]])

  --Find Tags (ft)
  map('n', '<leader>ft', [[<cmd>lua require('telescope.builtin').tags()<CR>]])


  -- Telescope
  require('telescope').setup {
    defaults = {
      mappings = {
        i = {
          ['<C-u>'] = false,
          ['<C-d>'] = false,
        },
      },
    },
  }
end


return { config = init }
