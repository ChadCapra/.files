local mappings = {
  {'n', '<Space>', ''},

-- File/Buffer/Window navigation
  {'n', '<leader>l', '<C-w>w'},
  {'n', '<leader>h', '<C-w>W'},
  {'n', '<leader>n', ':bnext<cr>'},
  {'n', '<leader>p', ':bprev<cr>'},
  {'n', '<leader>s', ':w<cr>'},
  {'n', '<leader>x', ':q<cr>'},


  -- Search/Replace (from visual mode or last search},
  {'v', '<leader>r', '"ry:%s/<C-r>r//gc<left><left><left>'},
  {'v', '<leader>R', '"ry:%s/<C-r>R//g<left><left>'},

  {'n', '<leader>r', '*``:%s///gc<left><left><left>'},
  {'n', '<leader>R', '*``:%s///g<left><left>'},


  -- Additional mappings
  {'n', '<leader><esc>', ':nohlsearch<cr>'},
  {'n', '<leader>o', 'o<esc>'},
  {'n', '<leader>O', 'O<esc>'},
  {'n', 'U', '<C-r>'},  -- such a better "redo"


  -- Resize with arrows
  {"n", "<C-Up>", ":resize -2<cr>"},
  {"n", "<C-Down>", ":resize +2<cr>"},
  {"n", "<C-Left>", ":vertical resize -2<cr>"},
  {"n", "<C-Right>", ":vertical resize +2<cr>"},


  -- Move text up and down
  {"n", "<A-j>", ":m .+1<cr>=="},
  {"n", "<A-k>", ":m .-2<cr>=="},
  {"i", "<A-j>", "<Esc>:m .+1<cr>==gi"},
  {"i", "<A-k>", "<Esc>:m .-2<cr>==gi"},
  {"v", "<A-j>", ":m '>+1<cr>gv=gv"},
  {"v", "<A-k>", ":m '<-2<cr>gv=gv"},


  -- Visual mode helpers
  {"v", "<", "<gv"},
  {"v", ">", ">gv"},


  -- Edit/Reload vimrc
  {'n', '<leader>ve', ':vsplit $MYVIMRC<cr>'},
  {'n', '<leader>vr', ':source $MYVIMRC<cr>:nohlsearch<cr>'},


  -- Renumber lists
  {'v', '<leader>rn', [[:s/\d\+/0/g<cr>:nohlsearch<cr>gv]]},

}

require(NS .. '.utils').set_mappings(mappings)

