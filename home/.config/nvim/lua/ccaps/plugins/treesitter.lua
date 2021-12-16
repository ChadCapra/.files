local init = function () require('nvim-treesitter.configs').setup {
  ensure_installed = {
    -- "elixir",
    "typescript",
    "lua",
  },
  highlight = {
    enable = true,
  },
  index = {
    enable = false,
    disable = {},
  },
  incremental_selection = {
    enable = true,
    keymaps = {
      init_selection = "gnn",
      node_incremental = "grn",
      scope_incremental = "grc",
      node_decremental = "grm",
    }
  }
}
end

return { run = ':TSUpdate', config = init }
