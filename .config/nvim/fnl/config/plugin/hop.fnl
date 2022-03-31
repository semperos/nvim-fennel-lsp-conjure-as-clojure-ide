(module config.plugin.hop
  {autoload {nvim aniseed.nvim}})

((. (require "hop") :setup))
(nvim.set_keymap "" :<leader>j "<cmd>lua require'hop'.hint_lines()<cr>" {})
