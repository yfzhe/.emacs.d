;;; init-treemacs.el
;;; Use Treemacs for file explorer

(use-package treemacs
  :commands (treemacs-follow-mode
             treemacs-filewatch-mode
             treemacs-fringe-indicator-mode
             treemacs-git-mode)
  :bind (([f8]        . treemacs)
         ("M-0"       . treemacs-select-window)
         ("C-x t 1"   . treemacs-delete-other-windows)
         ("C-x t t"   . treemacs)
         ("C-x t b"   . treemacs-bookmark)
         ("C-x t C-t" . treemacs-find-file)
         ("C-x t M-t" . treemacs-find-tag)
         :map treemacs-mode-map
         ([mouse-1]   . treemacs-single-click-expand-action))
  :config
  ;; (setq treemacs-collapse-dirs (if treemacs-python-executable 3 0))
  (setq treemacs-follow-after-init t)
  (setq treemacs-silent-filewatch t)
  (setq treemacs-silent-refresh t)
  (setq treemacs-width 30)
  (setq treemacs-no-png-images t)
  (setq treemacs-display-in-side-window t)
  ;; treemacs-missing-project-action        'ask
  ;; treemacs-project-follow-cleanup        nil

  (treemacs-follow-mode t)
  (treemacs-filewatch-mode t)
  (treemacs-fringe-indicator-mode t)

  (when (executable-find "git")
    (if (executable-find "python3")
        (treemacs-git-mode 'deferred)
      (treemacs-git-mode 'simple))))

(use-package treemacs-magit
  :after (magit treemacs)
  :commands treemacs-magit--schedule-update
  ;; :hook ((magit-post-commit
  ;;         git-commit-post-finish
  ;;         magit-post-stage
  ;;         magit-post-unstage)
  ;;        . treemacs-magit--schedule-update)))
  )

(provide 'init-treemacs)
