;;; init-shell.el

;;; vterm
(use-package vterm
  :unless (eq system-type 'windows-nt)
  :init (setq vterm-always-compile-module t))

;;; eshell
(use-package esh-autosuggest
  :defines (ivy-display-functions-alist)
  :hook ((eshell-mode . esh-autosuggest-mode)
         (eshell-mode . setup-eshell-ivy-completion))
  :preface
  (defun setup-eshell-ivy-completion ()
    (setq-local ivy-display-functions-alist
                (remq (assoc 'ivy-completion-in-region ivy-display-functions-alist)
                      ivy-display-functions-alist)))
  :bind (:map eshell-mode-map
              ([remap eshell-pcomplete] . completion-at-point)))

(use-package eshell-prompt-extras
  :after esh-opt
  :defines (eshell-highlight-prompt eshell-prompt-function)
  :commands (epe-theme-lambda)
  :init
  (setq eshell-highlight-prompt nil)
  (setq eshell-prompt-function 'epe-theme-lambda))

(provide 'init-shell)
