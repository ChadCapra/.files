local map = require(ns .. '.utils').keymap

-- map the leader key
map('n', '<Space>', '')
vim.g.mapleader = ' '

--
-- -- remap navigation for better layouts
-- map('n', 'n', 'j')
-- map('n', 'N', '}')
-- map('n', '<C-n>', '<C-d>')
-- map('n', 'l', 'k')
-- map('n', 'L', '{')
-- map('n', '<C-l>', '<C-u>')
--
-- map('n', 'j', 'l')
-- map('n', 'k', 'h')



-- File/Buffer/Window navigation
map('n', '<leader>w', '<C-w>w')
map('n', '<leader>W', '<C-w>W')
map('n', '<leader>b', ':bnext<cr>')
map('n', '<leader>B', ':bprev<cr>')
map('n', '<leader>s', ':w<cr>')
map('n', '<leader>q', ':q<cr>')
map('n', '<leader>t', ':NvimTreeToggle<cr>')


-- Search/Replace (from visual mode or last search)
map('n', 'h', 'n')

map('v', '<leader>r', '"ry:%s/<C-r>r//gc<left><left><left>')
map('v', '<leader>R', '"ry:%s/<C-r>R//g<left><left>')

map('n', '<leader>r', '*``:%s///gc<left><left><left>')
map('n', '<leader>R', '*``:%s///g<left><left>')


-- Additional mappings
map('n', '<leader><esc>', ':nohlsearch<cr>')
map('n', '<leader>o', 'o<esc>')
map('n', '<leader>O', 'O<esc>')


-- Edit/Reload vimrc
map('n', '<leader>ve', ':vsplit $MYVIMRC<cr>')
map('n', '<leader>vr', ':source $MYVIMRC<cr>')
