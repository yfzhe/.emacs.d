;;; init-git.el

(use-package magit
  :bind (("C-x g" . magit-status)
         ("C-x M-g" . magit-dispatch)
         ("C-c M-g" . magit-file-dispatch)))

(use-package magit-todos
  :hook (emacs-startup . magit-todos-mode))

;; use `diff-hl' to show git status in dired-mode
;; (it conflicts with flycheck, maybe should use `diff-hl-margin-mode')
(use-package diff-hl
  :hook ((after-init . global-diff-hl-mode)
         (dired-mode . diff-hl-dired-mode)
         (magit-post-refresh . diff-hl-magit-post-refresh))
  :config
  (diff-hl-flydiff-mode t))

;; don't forget `smerge-mode' for resolve conflicts!
;; (use-package smerge-mode)

(use-package git-timemachine
  :bind ("C-c g t" . git-timemachine))

(use-package git-messenger
  :bind (("C-c g m" . git-messenger:popup-message)
         :map git-messenger-map
         ("m" . git-messenger:copy-message))
  :init
  (setq git-messenger:use-magit-popup t)
  (setq git-messenger:show-detail t))

(use-package git-link
  :bind ("C-c g l" . git-link)
  :config
  (setq git-link-use-commit t))

(use-package git-modes)

(provide 'init-git)
