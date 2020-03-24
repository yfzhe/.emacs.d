;;; init-racket.el
;;; Racket and its languages

(use-package racket-mode
  :mode "\\.rkt\\'"
  :hook ((racket-mode . racket-xp-mode)
         (racket-mode . rainbow-delimiters-mode))
  :bind (:map racket-mode-map
         ("C-c C-s" . racket-check-syntax-mode)
         (")" . racket-insert-closing)
         ("]" . racket-insert-closing)
         ("}" . racket-insert-closing)
         ("C-M-\\" . racket-unicode-input-method-enable))
  :config
  ;; don't show the pos-tip
  (delete #'racket-show-pos-tip racket-show-functions))

(use-package scribble-mode
  :mode "\\.scrbl\\'"
  :hook ((scribble-mode . rainbow-delimiters-mode)))

(use-package pollen-mode
  :mode "\\.\\(p\\|pp\\|pm\\|pmd\\|poly\\|ptree\\)\\'"
  :requires company-pollen)

(provide 'init-racket)
