;;; init-lsp.el

(use-package lsp-mode
  :hook ((elm-mode . lsp-deferred))
  :bind (:map lsp-mode-map
         ("C-c C-d" . lsp-describe-thing-at-point))
  :init
  (setq lsp-auto-guess-root t)
  (setq lsp-prefer-flymake nil)
  (setq lsp-enable-indentation t)
  (setq lsp-enable-snippet t))

(use-package lsp-ui
  :commands lsp-ui-mode
  :init
  (setq lsp-ui-doc-use-webkit nil)
  (setq lsp-ui-doc-delay 0.5)
  (setq lsp-ui-doc-max-width 50)
  ;; move signature info from eldoc to lsp-ui-doc
  (setq lsp-ui-doc-include-signature t)
  (setq lsp-eldoc-enable-hover nil))

(use-package company-lsp
  :commands company-lsp)

(provide 'init-lsp)
