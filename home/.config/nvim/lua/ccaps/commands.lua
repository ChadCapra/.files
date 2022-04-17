local cmds = {
  "set whichwrap+=<,>,[,],h,l",
  [[set iskeyword+=-]],
  'silent! colorscheme moonfly',
}

require(NS .. '.utils').set_commands(cmds)


-- Highlight on yank
vim.cmd [[
  augroup YankHighlight
    autocmd!
    autocmd TextYankPost * silent! lua vim.highlight.on_yank()
  augroup end
]]
