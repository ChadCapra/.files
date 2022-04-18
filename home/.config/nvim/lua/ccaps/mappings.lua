local mappings = {
  {'n', '<Space>', ''},

-- File/Buffer/Window navigation
  {'n', '<leader>w', '<C-w>w'},
  {'n', '<leader>W', '<C-w>W'},
  {'n', '<leader>b', ':bnext<cr>'},
  {'n', '<leader>B', ':bprev<cr>'},
  {'n', '<leader>s', ':w<cr>'},
  {'n', '<leader>x', ':q<cr>'},

-- Quick fix list navigation
  {'n', '<leader>j', ':cn<cr>'},
  {'n', '<leader>k', ':cp<cr>'},


  -- Search/Replace (from visual mode or last search},
  {'v', '<leader>r', '"ry:%s/<C-r>r//gc<left><left><left>'},
  {'v', '<leader>R', '"ry:%s/<C-r>R//g<left><left>'},

  {'n', '<leader>r', '*``:%s///gc<left><left><left>'},
  {'n', '<leader>R', '*``:%s///g<left><left>'},


  -- Additional mappings
  {'n', '<leader><esc>', ':nohlsearch<cr>'},
  {'n', '<leader>o', 'o<esc>'},
  {'n', '<leader>O', 'O<esc>'},
  {'n', 'U', '<C-r>'},  -- such a better 'redo'
  {'n', '<leader>T', '<C-w>T'}, -- Open buffer in new tab
  {'n', '<leader>bo', [[:%bd|e#|bd#<cr>|'"]]}, -- Close all other buffers


  -- Navigate with arrows
  {'n', '<S-Up>', '{'},
  {'n', '<S-Down>', '}'},
  {'n', '<S-Left>', 'b'},
  {'n', '<S-Right>', 'w'},

  -- Navigate with arrows
  {'n', '<C-Up>', ':bnext<cr>'},
  {'n', '<C-Down>', ':bprev<cr>'},
  {'n', '<C-Left>', '<C-w>W'},
  {'n', '<C-Right>', '<C-w>w'},

  -- Resize with arrows
  {'n', '<A-Up>', ':resize -2<cr>'},
  {'n', '<A-Down>', ':resize +2<cr>'},
  {'n', '<A-Left>', ':vertical resize -2<cr>'},
  {'n', '<A-Right>', ':vertical resize +2<cr>'},


  -- Move text up and down
  {'n', '<A-j>', ':m .+1<cr>=='},
  {'n', '<A-k>', ':m .-2<cr>=='},
  {'i', '<A-j>', '<Esc>:m .+1<cr>==gi'},
  {'i', '<A-k>', '<Esc>:m .-2<cr>==gi'},
  {'v', '<A-j>', ':m ">+1<cr>gv=gv'},
  {'v', '<A-k>', ':m "<-2<cr>gv=gv'},


  -- Visual mode helpers
  {'v', '<', '<gv'},
  {'v', '>', '>gv'},


  -- Edit/Reload vimrc
  {'n', '<leader>ve', ':vsplit $MYVIMRC<cr>'},
  {'n', '<leader>vr', ':source $MYVIMRC<cr>:nohlsearch<cr>'},


  -- Renumber lists
  {'v', '<leader>rn', [[:s/\d\+/0/g<cr>:nohlsearch<cr>gv]]},

}

require(NS .. '.utils').set_mappings(mappings)

