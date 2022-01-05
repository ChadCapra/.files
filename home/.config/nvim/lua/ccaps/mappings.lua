local mappings = {
  {'n', '<Space>', ''},

  -- remap navigation for better layouts
  {'', 'n', 'j'},
  {'', 'N', '}'},
  {'', '<C-n>', '<C-d>'},
  {'', 'l', 'k'},
  {'', 'L', '{'},
  {'', '<C-l>', '<C-u>'},

  {'', 'j', 'l'},
  {'', 'k', 'h'},


  -- File/Buffer/Window navigation
  {'n', '<leader>w', '<C-w>w'},
  {'n', '<leader>W', '<C-w>W'},
  {'n', '<leader>b', ':bnext<cr>'},
  {'n', '<leader>B', ':bprev<cr>'},
  {'n', '<leader>s', ':w<cr>'},
  {'n', '<leader>q', ':q<cr>'},


  -- Search/Replace (from visual mode or last search},
  {'n', 'h', 'n'},  -- use h (highlight) for repeated search
  {'n', 'H', 'n'},  -- use h (highlight) for repeated search

  {'v', '<leader>r', '"ry:%s/<C-r>r//gc<left><left><left>'},
  {'v', '<leader>R', '"ry:%s/<C-r>R//g<left><left>'},

  {'n', '<leader>r', '*``:%s///gc<left><left><left>'},
  {'n', '<leader>R', '*``:%s///g<left><left>'},


  -- Additional mappings
  {'n', '<leader><esc>', ':nohlsearch<cr>'},
  {'n', '<leader>o', 'o<esc>'},
  {'n', '<leader>O', 'O<esc>'},


  -- Edit/Reload vimrc
  {'n', '<leader>ve', ':vsplit $MYVIMRC<cr>'},
  {'n', '<leader>vr', ':source $MYVIMRC<cr>:nohlsearch<cr>'},
}

require(ns .. '.utils').set_mappings(mappings)

