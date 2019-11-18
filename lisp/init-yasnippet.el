;;; init-yasnippet.el

(use-package yasnippet
  :hook (after-init . yas-global-mode))

(use-package yasnippet-snippets
  :after yasnippet)

(provide 'init-yasnippet)
