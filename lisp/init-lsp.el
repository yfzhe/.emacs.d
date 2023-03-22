;;; init-lsp.el

(setq read-process-output-max (* 1 1024 1024))

(use-package lsp-mode
  :hook ((lsp-mode . lsp-enable-which-key-integration))
  :bind (:map lsp-mode-map
         ("C-c C-d" . lsp-describe-thing-at-point)
         ("C-c C-r" . lsp-rename)
         ([remap xref-find-definitions] . lsp-find-definition)
         ([remap xref-find-references] . lsp-find-references))
  :init
  (setq lsp-keymap-prefix "C-c l")

  (setq lsp-enable-indentation t)
  (setq lsp-enable-folding nil)
  (setq lsp-enable-text-document-color nil)
  (setq lsp-headerline-breadcrumb-enable nil)

  (setq lsp-eldoc-enable-hover nil))

(use-package lsp-ui
  :commands lsp-ui-mode
  :init
  (setq lsp-ui-doc-enable t)
  (setq lsp-ui-doc-delay 0.5)
  (setq lsp-ui-doc-max-width 72)
  (setq lsp-ui-doc-max-height 20)
  (setq lsp-ui-doc-include-signature t)
  (setq lsp-ui-doc-show-with-cursor t)
  (setq lsp-ui-doc-show-with-mouse t)

  (setq lsp-ui-sideline-show-hover nil)
  (setq lsp-ui-sideline-show-code-actions nil)
  (setq lsp-ui-sideline-show-diagnostics t))

(provide 'init-lsp)
