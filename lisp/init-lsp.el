;;; init-lsp.el
;;; Config lsp

(use-package lsp-mode
  :hook (elm-mode . lsp)
  :commands lsp)

(use-package lsp-ui
  :commands lsp-ui-mode)

(use-package company-lsp
  :commands company-lsp)

(provide 'init-lsp)
