(module config.plugin.auto-pairs
  {autoload {core aniseed.core
             nvim aniseed.nvim}})

(defn init []
  (let [auto-pairs nvim.g.AutoPairs]
    (tset auto-pairs "'" nil)
    (tset auto-pairs "`" nil)
    (set nvim.b.AutoPairs auto-pairs)))

(vim.schedule
  (fn []
    (nvim.ex.autocmd
      :FileType
      "clojure,fennel,scheme"
      "lua require('config.plugin.auto-pairs').init()")))

