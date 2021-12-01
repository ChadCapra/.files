-- mappings.lua
local map = vim.api.nvim_set_keymap

-- map the leader key
map('n', '<Space>', '', {})
vim.g.mapleader = ' '  -- 'vim.g' sets global variables


local options = { noremap = true }
map('n', '<leader><esc>', ':nohlsearch<cr>', options)
map('n', '<leader>n', ':bnext<cr>', options)
map('n', '<leader>p', ':bprev<cr>', options)
map('n', '<leader>w', ':w<cr>', options)
map('n', '<leader>q', ':q<cr>', options)
map('n', '<leader>e', ':e %:h<cr>', options)
map('n', '<leader>v', ':vs %:h<cr>', options)

