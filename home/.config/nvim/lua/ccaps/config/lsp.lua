local M = {}

M.config = function ()

  local servers = { 'elixirls', 'sumneko_lua', 'svelte', 'tsserver', 'prismals' }
  local nvim_lsp = require('lspconfig')

  local maps = {
    {'n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>'},
    {'n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>'},
    {'n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>'},
    {'n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>'},
    {'n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>'},
    {'n', '<leader>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>'},
    {'n', '<leader>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>'},
    {'n', '<leader>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>'},
    {'n', '<leader>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>'},
    {'n', '<leader>rn', '<cmd>lua vim.lsp.buf.rename()<CR>'},
    {'n', '<leader>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>'},
    {'n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>'},
    {'n', '<leader>e', '<cmd>lua vim.diagnostic.open_float()<CR>'},
    {'n', '[d', '<cmd>lua vim.diagnostic.goto_prev()<CR>'},
    {'n', ']d', '<cmd>lua vim.diagnostic.goto_next()<CR>'},
    {'n', '<leader>q', '<cmd>lua vim.diagnostic.setloclist()<CR>'},
    {'n', '<leader>f', '<cmd>lua vim.lsp.buf.formatting()<CR>'},
  }

  local on_attach = function (_, bufnr)
    require(NS .. '.utils').set_buffer_mappings(bufnr, maps)
  end

    -- Add additional capabilities supported by nvim-cmp
  local capabilities = vim.lsp.protocol.make_client_capabilities()
  local ok, cmp_nvim_lsp = pcall(require, 'cmp_nvim_lsp')
  if ok then
    capabilities = cmp_nvim_lsp.update_capabilities(capabilities)
  end

  -- Loop through servers and load additional config from file (when available)
  -- set 'config' to empty table if no additional config specified
  for _, server in ipairs(servers) do
    local is_ok, config = pcall(require, NS .. '.lsp_settings.' .. server)
    if not is_ok then config = {} end

    config.on_attach = on_attach
    config.capabilities = capabilities

    nvim_lsp[server].setup(config)
  end

end


return M
