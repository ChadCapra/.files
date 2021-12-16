local mapkeys = function () 

  --Find Files (ff = Find File / fg = Find git (tracked files) / fr = Find Recent / fe = File Explorer)
  vim.api.nvim_set_keymap('n', '<leader>ff', [[<cmd>lua require('telescope.builtin').find_files()<CR>]], { noremap = true, silent = true })
  vim.api.nvim_set_keymap('n', '<leader>fg', [[<cmd>lua require('telescope.builtin').git_files()<CR>]], { noremap = true, silent = true })
  vim.api.nvim_set_keymap('n', '<leader>fr', [[<cmd>lua require('telescope.builtin').oldfiles()<CR>]], { noremap = true, silent = true })
  vim.api.nvim_set_keymap('n', '<leader>fe', [[<cmd>lua require('telescope.builtin').file_browser({hidden=true})<CR>]], { noremap = true, silent = true })

  --Find in Buffers (fb = Find Buffer / fc = Find Current)
  vim.api.nvim_set_keymap('n', '<leader>fb', [[<cmd>lua require('telescope.builtin').buffers()<CR>]], { noremap = true, silent = true })
  vim.api.nvim_set_keymap('n', '<leader>fc', [[<cmd>lua require('telescope.builtin').current_buffer_fuzzy_find()<CR>]], { noremap = true, silent = true })

  --Find Words/Strings (fw = Find Word (under cursor) / fs = Find String)
  vim.api.nvim_set_keymap('n', '<leader>fw', [[<cmd>lua require('telescope.builtin').grep_string()<CR>]], { noremap = true, silent = true })
  vim.api.nvim_set_keymap('n', '<leader>fs', [[<cmd>lua require('telescope.builtin').live_grep()<CR>]], { noremap = true, silent = true })

  --Find Help (fh)
  vim.api.nvim_set_keymap('n', '<leader>fh', [[<cmd>lua require('telescope.builtin').help_tags()<CR>]], { noremap = true, silent = true })

  --Find Tags (ft)
  vim.api.nvim_set_keymap('n', '<leader>ft', [[<cmd>lua require('telescope.builtin').tags()<CR>]], { noremap = true, silent = true })

end

local init = function ()

  mapkeys()

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
