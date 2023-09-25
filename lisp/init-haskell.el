;;; init-haskel.el
;;; Haskell and its cousin languages

(use-package haskell-mode
  :mode "\\.\\(hs\\|lhs\\)\\'"
  :config
  (setq haskell-process-type 'stack-ghci))

(use-package lsp-haskell
  :hook ((haskell-mode . lsp)
         (haskell-literate-mode . lsp))
  :config
  (setq lsp-haskell-server-path "haskell-language-server-wrapper"))

(provide 'init-haskell)
