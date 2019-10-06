;;; init-eshell.el

(use-package esh-autosuggest
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
  :defines eshell-highlight-prompt
  :commands (epe-theme-lambda)
  :init
  (setq eshell-highlight-prompt nil)
  (setq eshell-prompt-function 'epe-theme-lambda))

(provide 'init-eshell)
