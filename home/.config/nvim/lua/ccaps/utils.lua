local M = {}
local DEFAULT_OPTS = { noremap = true, silent = true }

-- Global key map
-- @param mode
M.keymap = function(mode_or_table, lhs, rhs, opts)
  if type(mode_or_table) == 'table' then
    mode, lhs, rhs, opts = table.unpack(mode_or_table)
  else
    mode = mode_or_table
  end

  local has_opts = opts ~= nil and not vim.tbl_isempty(opts)
  if has_opts then
    vim.api.nvim_set_keymap(mode, lhs, rhs, vim.tbl_extend('force', DEFAULT_OPTS, opts))
  else
    vim.api.nvim_set_keymap(mode, lhs, rhs, DEFAULT_OPTS)
  end
end

-- Buffer key map
M.buf_keymap = function(bufnr, mode, lhs, rhs, opts)
  if type(bufnr_or_table) == 'table' then
    bufnr, mode, lhs, rhs, opts = table.unpack(bufnr_or_table)
  else
    bufnr, mode = bufnr_or_table
  end

  local has_opts = opts ~= nil and not vim.tbl_isempty(opts)
  if has_opts then
    vim.api.nvim_buf_set_keymap(bufnr, mode, lhs, rhs, vim.tbl_extend('force', DEFAULT_OPTS, opts))
  else
    vim.api.nvim_buf_set_keymap(bufnr, mode, lhs, rhs, DEFAULT_OPTS)
  end
end

-- Dumb way to set an autocmd group
function M.set_augroup(group, autocmds)
  local cmd = vim.api.nvim_command
  cmd('augroup ' .. group)
  cmd('au!')
  for _, autocmd in pairs(autocmds) do cmd(autocmd) end
  cmd('augroup end')
end

return M
