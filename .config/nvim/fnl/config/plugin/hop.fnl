(module config.plugin.hop
  {autoload {nvim aniseed.nvim}})

(nvim.set_keymap "" :<leader>j "<cmd>lua require'hop'.hint_lines()<cr>" {})
