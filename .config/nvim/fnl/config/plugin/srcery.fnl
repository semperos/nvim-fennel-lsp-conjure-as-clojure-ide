(module config.plugin.srcery
  {autoload {nvim aniseed.nvim}
   require-macros [config.macros]})

(defn colorscheme-fixes []
  (_ex hi :SpellBad :gui=underline)
  (_ex hi :SpellLocal :gui=underline)
  (_ex hi :SpellRare :gui=underline))

(augroup srcery_colorscheme_fixes
  (autocmd :ColorScheme :srcery (viml->fn colorscheme-fixes)))

(_ex colorscheme :srcery)

