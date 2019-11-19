;;; init-yasnippet.el

(use-package yasnippet
  :hook (after-init . yas-global-mode))

(use-package ivy-yasnippet
  :bind ("C-c C-y" . ivy-yasnippet))

(use-package yasnippet-snippets
  :after yasnippet)

(provide 'init-yasnippet)
