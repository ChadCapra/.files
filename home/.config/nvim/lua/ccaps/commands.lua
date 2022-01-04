local cmds = {
  "set whichwrap+=<,>,[,],h,l",
  [[set iskeyword+=-]],
  'colorscheme moonfly',
}

require(ns .. '.utils').set_commands(cmds)
