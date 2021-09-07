(module config.plugin.conjure
  {autoload {nvim aniseed.nvim}})

(set nvim.g.conjure#mapping#doc_word "K")
(set nvim.g.conjure#client#clojure#nrepl#eval#auto_require false)
(set nvim.g.conjure#client#clojure#nrepl#connection#auto_repl#enabled false)

;; ----- Daniel's Customizations -----

(set nvim.g.conjure#eval#result_register "*")
(set nvim.g.conjure#log#botright true)
(set nvim.g.conjure#highlight#enabled true) ; default false
(set nvim.g.conjure#highlight#timeout 300) ; default 500
(set nvim.g.conjure#client#clojure#nrepl#test#runner "kaocha")
(set nvim.g.conjure#client#clojure#nrepl#eval#raw_out true)

(nvim.ex.augroup
  :filetype_clojure
  (nvim.ex.autocmd :FileType :clojure :setlocal "commentstring=;;\\ %s"))
