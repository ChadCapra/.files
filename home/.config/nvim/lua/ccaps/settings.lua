local opt = vim.opt   -- to set options
local g = vim.g       -- to set globals

-- Use bash because fish shell can slow things down
opt.shell = "/bin/bash"

opt.expandtab = true                -- Use spaces instead of tabs
opt.hidden = true                   -- Enable background buffers
opt.ignorecase = true               -- Ignore case
opt.joinspaces = false              -- No double spaces with join
opt.list = true                     -- Show some invisible characters
opt.mouse = "a"                     -- Allow mouse interactions
opt.number = true                   -- Show line numbers
opt.relativenumber = false          -- Relative line numbers
opt.scrolloff = 4                   -- Lines of context
opt.shiftround = true               -- Round indent
opt.shiftwidth = 2                  -- Size of an indent
opt.sidescrolloff = 8               -- Columns of context
opt.smartcase = true                -- Do not ignore case with capitals
opt.smartindent = true              -- Insert indents automatically
opt.splitbelow = true               -- Put new windows below current
opt.splitright = true               -- Put new windows right of current
opt.tabstop = 2                     -- Number of spaces tabs count for
opt.termguicolors = true            -- True color support
opt.wrap = false                    -- Disable line wrap

--
-- -- disable some builtin vim plugins
-- local disabled_built_ins = {
--    "2html_plugin",
--    "getscript",
--    "getscriptPlugin",
--    "gzip",
--    "logipat",
--    "netrw",
--    "netrwPlugin",
--    "netrwSettings",
--    "netrwFileHandlers",
--    "matchit",
--    "tar",
--    "tarPlugin",
--    "rrhelper",
--    "spellfile_plugin",
--    "vimball",
--    "vimballPlugin",
--    "zip",
--    "zipPlugin",
-- }
--
-- for _, plugin in pairs(disabled_built_ins) do
-- --   g["loaded_" .. plugin] = 1
-- end
