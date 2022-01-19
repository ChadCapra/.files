local maps = {

  --Find Files (ff = Find File / fg = Find git (tracked files))
  {'n', '<leader>ff', [[<cmd>lua require('telescope.builtin').find_files()<CR>]]},
  {'n', '<leader>fg', [[<cmd>lua require('telescope.builtin').git_files()<CR>]]},

  --Find in Buffers (fb = Find Buffer / fc = Find Current)
  {'n', '<leader>fb', [[<cmd>lua require('telescope.builtin').buffers()<CR>]]},
  {'n', '<leader>fc', [[<cmd>lua require('telescope.builtin').current_buffer_fuzzy_find()<CR>]]},

  --Find Words/Strings (fw = Find Word (under cursor) / fs = Find String)
  {'n', '<leader>fw', [[<cmd>lua require('telescope.builtin').grep_string()<CR>]]},
  {'n', '<leader>fs', [[<cmd>lua require('telescope.builtin').live_grep()<CR>]]},

  --Find Help (fh)
  {'n', '<leader>fh', [[<cmd>lua require('telescope.builtin').help_tags()<CR>]]},

  --Find Tags (ft)
  {'n', '<leader>ft', [[<cmd>lua require('telescope.builtin').tags()<CR>]]},
}

require(NS .. '.utils').set_mappings(maps)


local init = function ()
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
