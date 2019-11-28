;;; init-rust.el

(use-package rust-mode
  :hook (rust-mode . lsp-deferred)
  :config
  (when (executable-find "rustfmt")
    (setq rust-format-on-save t)))

(use-package flycheck-rust
  :after rust-mode
  :hook (flycheck-mode . flycheck-rust-setup))

(use-package cargo
  :hook (rust-mode . cargo-minor-mode))

(provide 'init-rust)
