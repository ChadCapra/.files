local ns = select('1', ...):match(".+%.") or ""
  
local map = require(ns .. '.utils').keymap

-- map the leader key
map('n', '<Space>', '')
vim.g.mapleader = ' '

map('n', '<leader><esc>', ':nohlsearch<cr>')
map('n', '<leader>w', '<C-w>w')
map('n', '<leader>W', '<C-w>W')
map('n', '<leader>b', ':bnext<cr>')
map('n', '<leader>B', ':bprev<cr>')
map('n', '<leader>s', ':w<cr>')
map('n', '<leader>q', ':q<cr>')
map('n', '<leader>t', ':NvimTreeToggle<cr>')

map('n', '<leader>ve', ':vsplit $MYVIMRC<cr>')
map('n', '<leader>vr', ':source $MYVIMRC<cr>')

