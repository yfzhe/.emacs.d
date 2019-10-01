;;; init-haskel.el
;;; Haskell and its cousin languages

(use-package haskell-mode
  :mode "\\.\\(hs\\|lhs\\)\\'"
  :config
  (setq haskell-process-type 'stack-ghci))

;; dante: completion for haskell
(use-package dante
  :after haskell-mode
  :hook (haskell-mode . dante-mode))

(provide 'init-haskell)
