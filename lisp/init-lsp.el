;;; init-lsp.el

(use-package lsp-mode
  :hook ((elm-mode . lsp))
  :commands lsp
  :init
  (setq lsp-auto-guess-root t)
  (setq lsp-prefer-flymake nil)
  (setq lsp-enable-indentation t))

(use-package lsp-ui
  :commands lsp-ui-mode)

(use-package company-lsp
  :commands company-lsp)

(provide 'init-lsp)
