;;; init-racket.el
;;; Racket and its languages

(use-package racket-mode
  :mode (("\\.rkt\\'" . racket-mode)
         ("\\.rhm\\'" . racket-hash-lang-mode)
         ("\\.scrbl\\'" . racket-hash-lang-mode))
  :hook (((racket-mode racket-hash-lang-mode) . racket-xp-mode)
         (racket-mode . paredit-mode)
         (racket-mode . rainbow-delimiters-mode))
  :bind (:map racket-mode-map
         (")" . racket-insert-closing)
         ("]" . racket-insert-closing)
         ("}" . racket-insert-closing)
         ("C-M-\\" . racket-unicode-input-method-enable))
  :config
  ;; don't show the pos-tip, either the pseudo tip
  (setq racket-show-functions '(racket-show-echo-area)))

(use-package pollen-mode
  :mode "\\.\\(p\\|pp\\|pm\\|pmd\\|poly\\|ptree\\)\\'"
  :requires company-pollen)

(provide 'init-racket)
