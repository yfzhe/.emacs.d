;;; init-git.el

(use-package magit
  :bind (("C-x g" . magit-status)
         ("C-x M-g" . magit-dispatch)
         ("C-c M-g" . magit-file-popup)))

;; `magit-todos' would open git-grep html manual on Windows, which is annoying.
;; It is a known bug, see https://github.com/alphapapa/magit-todos/issues/43
;; Before the issue get fixed, shoule we not use this package on Windows?
(use-package magit-todos
  :hook (emacs-startup . magit-todos-mode))

;; use `diff-hl' to show git status in dired-mode
;; (it conflicts with flycheck, so not used in file buffers
;;  maybe we can use `diff-hl-margin-mode')
(use-package diff-hl
  :hook ((dired-mode . diff-hl-dired-mode)
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
  :bind ("C-c g l" . git-link))

(use-package gitattributes-mode)
(use-package gitconfig-mode)
(use-package gitignore-mode)

(provide 'init-git)
