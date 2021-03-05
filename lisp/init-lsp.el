;;; init-lsp.el

(use-package lsp-mode
  :bind (:map lsp-mode-map
         ("C-c C-d" . lsp-describe-thing-at-point))
  :hook ((lsp-mode . lsp-enable-which-key-integration))
  :init
  (setq lsp-auto-guess-root t)
  (setq lsp-prefer-flymake nil)
  (setq lsp-enable-indentation t)
  (setq lsp-enable-snippet t)
  (setq lsp-headerline-breadcrumb-enable nil)

  (setq lsp-keymap-prefix "C-c l"))

(use-package lsp-ui
  :commands lsp-ui-mode
  :init
  (setq lsp-ui-doc-use-webkit nil)
  (setq lsp-ui-doc-delay 0.5)
  (setq lsp-ui-doc-max-width 56)
  ;; move signature info from eldoc to lsp-ui-doc
  (setq lsp-ui-doc-include-signature t)
  (setq lsp-eldoc-enable-hover nil)

  (setq lsp-ui-sideline-show-code-actions nil)
  (setq lsp-ui-sideline-show-diagnostics t))

(use-package company-lsp
  :commands company-lsp)

;;; set lsp-python here temporaryly
(use-package lsp-python-ms
  :hook (python-mode . (lambda ()
                         (require 'lsp-python-ms)
                         (lsp-deferred)))
  :init
  (setq lsp-python-ms-auto-install-server t)
  (when (executable-find "python3")
       (setq lsp-python-ms-python-executable-cmd "python3")))

(provide 'init-lsp)
