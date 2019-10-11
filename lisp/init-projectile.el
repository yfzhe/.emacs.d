;;; init-projectile.el

(use-package projectile
  :hook (after-init . projectile-mode)
  :bind (:map projectile-mode-map
         ("C-c p" . 'projectile-command-map))
  :init
  (setq projectile-mode-line-prefix "")
  (setq projectile-sort-order 'recentf)
  (setq projectile-use-git-grep t)
  (setq projectile-completion-system 'ivy))

(provide 'init-projectile)
