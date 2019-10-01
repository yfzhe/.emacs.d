;;; init-racket.el
;;; Racket and its languages

(use-package racket-mode
  :mode "\\.rkt\\'"
  :hook (racket-mode . rainbow-delimiters-mode)
  ;; :requires dr-racket-like-unicode-mode
  )


(use-package scribble-mode
  :mode "\\.scrbl\\'")

(use-package pollen-mode
  :mode "\\.\\(p\\|pp\\|pm\\|pmd\\|poly\\|ptree\\)\\'"
  :requires company-pollen)

(provide 'init-racket)
