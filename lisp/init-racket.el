;;; Racket and its languages

(use-package racket-mode
  :mode "\\.rkt\\'"
  :init
  (add-hook 'racket-mode-hook #'rainbow-delimiters-mode)
  ;; :requires dr-racket-like-unicode-mode
  :config
  (setq racket-program "/Applications/Racket/bin/racket"))

(use-package scribble-mode
  :mode "\\.scrbl\\'")

(use-package pollen-mode
  :mode "\\.\\(p\\|pp\\|pm\\|pmd\\|poly\\|ptree\\)\\'"
  :requires company-pollen)

(provide 'init-racket)
