(module config.plugin
  {autoload {nvim aniseed.nvim
             a aniseed.core
             util config.util
             packer packer}})

(defn- safe-require-plugin-config [name]
  (let [(ok? val-or-err) (pcall require (.. :config.plugin. name))]
    (when (not ok?)
      (print (.. "config error: " val-or-err)))))

(defn- use [...]
  "Iterates through the arguments as pairs and calls packer's use function for
  each of them. Works around Fennel not liking mixed associative and sequential
  tables as well."
  (let [pkgs [...]]
    (packer.startup
      (fn [use]
        (for [i 1 (a.count pkgs) 2]
          (let [name (. pkgs i)
                opts (. pkgs (+ i 1))]
            (-?> (. opts :mod) (safe-require-plugin-config))
            (use (a.assoc opts 1 name))))))))

;plugins managed by packer
(use
  ;plugin Manager
  :wbthomason/packer.nvim {}
  ;nvim config and plugins in Fennel
  :Olical/aniseed {:branch :develop}
  ;clojure
  :Olical/conjure {:branch :master :mod :conjure}
  ;file searching
  :nvim-telescope/telescope.nvim {:requires [:nvim-lua/popup.nvim
                                             :nvim-lua/plenary.nvim]}
  ;parsing system
  :nvim-treesitter/nvim-treesitter {:run ":TSUpdate"
                                    :mod :treesitter}
  ;lsp
  :neovim/nvim-lspconfig {:mod :lspconfig}
  ;autocomplete
  :hrsh7th/nvim-cmp {:requires [:hrsh7th/cmp-buffer
                                :hrsh7th/cmp-nvim-lsp
                                :PaterJason/cmp-conjure]
                     :mod :cmp}
  ;theme
  ;; :projekt0n/github-nvim-theme {:mod :theme}
  
  ;; Daniel's custom

  ;; :srcery-colors/srcery-vim {:mod :srcery}
  :shaunsingh/doom-vibrant.nvim {:mod :doom}

  ;; Show Git index status in Vim's gutter.
  :airblade/vim-gitgutter {}
  :bakpakin/janet.vim {}
  ;; Jump to lines/chars with ease.
  ;; :easymotion/vim-easymotion {:mod :easymotion}
  :phaazon/hop.nvim {:mod :hop}
  ;; S-expression editing, including text objects.
  :guns/vim-sexp {:mod :sexp}
  ;; Terraform syntax support.
  :hashivim/vim-terraform {}
  ;; List Git branches and act on them.
  :idanarye/vim-merginal {}
  ;; Automatically insert matching delimiters.
  :jiangmiao/auto-pairs {:mod :auto-pairs}
  ;; FZF for searching of all kinds
  :junegunn/fzf {:mod :fzf}
  :junegunn/fzf.vim {}
  ;; LaTeX support.
  :lervag/vimtex {}
  ;; Better overall Vim defaults.
  :liuchengxu/vim-better-default {:mod :better-default}
  ;; Popup showing available key bindings
  :liuchengxu/vim-which-key {}
  ;; Visualizer for undo tree, can also be used to jump.
  :mbbill/undotree {} ;; {:mod :undotree}
  ;; JavaScript support.
  :pangloss/vim-javascript {}
  ;; Trim trailing whitespace, but not in csv files.
  :semperos/vim-strip-trailing-whitespace {}
  ;; Comment stuff out.
  :tpope/vim-commentary {}
  ;; Git UI for Vim
  :tpope/vim-fugitive {:mod :fugitive}
  ;; Make . repeat plugin actions natively. Extensible.
  :tpope/vim-repeat {}
  ;; S-expression navigation and editing mappings.
  :tpope/vim-sexp-mappings-for-regular-people {}
  ;; Keep indentation in files consistent.
  :tpope/vim-sleuth {}
  ;; Surround selections and text objects with delimiters.
  :tpope/vim-surround {}
  ;; Mappings for up/down left/right on/off commands.
  :tpope/vim-unimpaired {}
  ;; Press - anywhere and get the directory listing.
  :tpope/vim-vinegar {}
  ;; Enable to test startup time with :StartupTime
  :tweekmonster/startuptime.vim {}
  ;; Zig language support.
  :ziglang/zig.vim {}
  )
