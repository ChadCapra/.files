local M = {}

M.config = function ()

  require('neoscroll').setup({
    -- Set any options as needed
    performance_mode = true
  })

  local t = {}
  -- Syntax: t[keys] = {function, {function arguments}}
  t['<C-u>'] = {'scroll', {'-vim.wo.scroll', 'true', '200'}}
  t['<C-d>'] = {'scroll', { 'vim.wo.scroll', 'true', '200'}}
  t['<C-b>'] = {'scroll', {'-vim.api.nvim_win_get_height(0)', 'true', '300'}}
  t['<C-f>'] = {'scroll', { 'vim.api.nvim_win_get_height(0)', 'true', '300'}}
  t['<C-y>'] = {'scroll', {'-0.10', 'false', '100'}}
  t['<C-e>'] = {'scroll', { '0.10', 'false', '100'}}
  t['zt']    = {'zt', {'250'}}
  t['zz']    = {'zz', {'250'}}
  t['zb']    = {'zb', {'250'}}
  t['gg']    = {'scroll', {'-2*vim.api.nvim_buf_line_count(0)', 'true', '1', '5', e}}
  t['G']     = {'scroll', {'2*vim.api.nvim_buf_line_count(0)', 'true', '1', '5', e}}

  require('neoscroll.config').set_mappings(t)
end

return M
