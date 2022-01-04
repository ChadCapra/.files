local M = {}
local DEFAULT_OPTS = { noremap = true, silent = true }

-- Convert table to string for debugging
local table_to_string 
table_to_string = function(o)
   if type(o) == 'table' then
      local s = '{ '
      for k,v in pairs(o) do
         if type(k) ~= 'number' then k = '"'..k..'"' end
         s = s .. '['..k..'] = ' .. table_to_string(v) .. ','
      end
      return s .. '} '
   else
      return tostring(o)
   end
end

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
M.set_augroup = function(group, autocmds)
  local cmd = vim.api.nvim_command
  cmd('augroup ' .. group)
  cmd('au!')
  for _, autocmd in pairs(autocmds) do cmd(autocmd) end
  cmd('augroup end')
end

-- Convert table to string for debugging
M.table_to_string =  table_to_string

-- Pretty Print strings or tables
M.pprint = function(item)
  print("hello")
  print(table_to_string(item))
end

return M
