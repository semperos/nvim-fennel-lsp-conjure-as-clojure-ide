(module config.plugin.doom
  {autoload {nvim aniseed.nvim}
   require-macros [config.macros]})

((. (require :doom) :set))
