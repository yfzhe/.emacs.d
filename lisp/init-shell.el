;;; init-shell.el

;;; eshell
(use-package eshell-prompt-extras
  :after esh-opt
  :defines (eshell-highlight-prompt eshell-prompt-function)
  :commands (epe-theme-lambda)
  :init
  (setq eshell-highlight-prompt nil)
  (setq eshell-prompt-function 'epe-theme-lambda))

(provide 'init-shell)
