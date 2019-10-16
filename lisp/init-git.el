;;; init-git.el

(use-package magit
  :bind (("C-x g" . magit-status)
         ("C-x M-g" . magit-dispatch)
         ("C-c M-g" . magit-file-popup)))

(use-package magit-todos
  ;; FIXME: it seems this package would open git-grep html manual
  ;;        on Windows, which is annoying
  :hook (emacs-startup . magit-todos-mode))

(use-package git-timemachine)

;; (use-package forge
;;  :after magit)

;; use `diff-hl' to show git status in dired-mode
;; (it conflicts with flycheck, so not used in file buffers
;;  maybe we can use `diff-hl-margin-mode')
(use-package diff-hl
  :hook ((dired-mode . diff-hl-dired-mode)
         (magit-post-refresh . diff-hl-magit-post-refresh)))

;; TODO: some useful packages about git
;; - smerge-mode
;; - git-messenger
;; - git-link

(use-package gitattributes-mode)
(use-package gitconfig-mode)
(use-package gitignore-mode)

(provide 'init-git)
