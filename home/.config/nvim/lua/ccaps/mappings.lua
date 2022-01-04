local mappings = {
  --  {'n', '<Space>', ''},

  --
  -- -- remap navigation for better layouts
  -- {'n', 'n', 'j'},
  -- {'n', 'N', '}'},
  -- {'n', '<C-n>', '<C-d>'},
  -- {'n', 'l', 'k'},
  -- {'n', 'L', '{'},
  -- {'n', '<C-l>', '<C-u>'},
  --
  -- {'n', 'j', 'l'},
  -- {'n', 'k', 'h'},



  -- File/Buffer/Window navigation
  {'n', '<leader>w', '<C-w>w'},
  {'n', '<leader>W', '<C-w>W'},
  {'n', '<leader>b', ':bnext<cr>'},
  {'n', '<leader>B', ':bprev<cr>'},
  {'n', '<leader>s', ':w<cr>'},
  {'n', '<leader>q', ':q<cr>'},
  {'n', '<leader>t', ':NvimTreeToggle<cr>'},


  -- Search/Replace (from visual mode or last search},
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
  {'n', '<leader>vr', ':source $MYVIMRC<cr>'},
}

require(ns .. '.utils').set_mappings(mappings)

