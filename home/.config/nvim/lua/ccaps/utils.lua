local M = {}
local DEFAULT_OPTS = { noremap = true, silent = true }


-- Pretty Print strings or tables (used for debugging)
local table_to_string
local pprint = function(item) print(table_to_string(item)) end
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

M.pprint = pprint


-- set options
local set_option = function(key, value) vim.opt[key] = value end

M.set_option = set_option
M.set_options = function(options)
  for k, v in pairs(options) do set_option(k,v) end
end


-- set commands
local set_command = function(cmd) vim.cmd(cmd) end

M.set_command = set_command
M.set_commands = function(commands)
  for _, v in pairs(commands) do set_command(v) end
end


-- Global key mappings
local set_mapping = function(mode, lhs, rhs, opts)
  if type(mode) == 'table' then
    mode, lhs, rhs, opts = unpack(mode)
  end

  if opts ~= nil and not vim.tbl_isempty(opts) then
    vim.api.nvim_set_keymap(mode, lhs, rhs, vim.tbl_extend('force', DEFAULT_OPTS, opts))
  else
    vim.api.nvim_set_keymap(mode, lhs, rhs, DEFAULT_OPTS)
  end
end

M.set_mapping = set_mapping
M.set_mappings = function(mappings)
  if type(mappings[1]) == 'table' then
    for _, mapping in pairs(mappings) do set_mapping(mapping) end
  else
    set_mapping(mappings)
  end
end


-- Buffer key mappings
local set_buffer_mapping = function(bufnr, mode, lhs, rhs, opts)
  if type(mode) == 'table' then
    mode, lhs, rhs, opts = unpack(mode)
  end

  if opts ~= nil and not vim.tbl_isempty(opts) then
    vim.api.nvim_buf_set_keymap(bufnr, mode, lhs, rhs, vim.tbl_extend('force', DEFAULT_OPTS, opts))
  else
    vim.api.nvim_buf_set_keymap(bufnr, mode, lhs, rhs, DEFAULT_OPTS)
  end
end

M.set_buffer_mapping = set_buffer_mapping
M.set_buffer_mappings = function(mappings)
  if type(mappings[1]) == 'table' then
    for _, mapping in pairs(mappings) do set_buffer_mapping(mapping) end
  else
    set_buffer_mapping(mappings)
  end
end

return M
