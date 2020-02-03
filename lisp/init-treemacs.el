;;; init-treemacs.el
;;; Use Treemacs for file explorer

(require 'init-font)

(use-package treemacs
  :commands (treemacs-follow-mode
             treemacs-filewatch-mode
             treemacs-fringe-indicator-mode
             treemacs-git-mode)
  :bind (([f8] . treemacs)
         ("M-0" . treemacs-select-window)
         ("C-x t 1" . treemacs-delete-other-windows)
         ("C-x t t" . treemacs)
         ("C-x t b" . treemacs-bookmark)
         ("C-x t C-t" . treemacs-find-file)
         ("C-x t M-t" . treemacs-find-tag)
         :map treemacs-mode-map
         ([mouse-1] . treemacs-single-click-expand-action))
  :config
  ;; (setq treemacs-collapse-dirs (if treemacs-python-executable 3 0))
  (setq treemacs-follow-after-init t)
  (setq treemacs-silent-filewatch t)
  (setq treemacs-silent-refresh t)
  (setq treemacs-width 30)
  (setq treemacs-indentation 1)
  (setq treemacs-display-in-side-window t)

  (treemacs-follow-mode t)
  (treemacs-filewatch-mode t)
  (treemacs-fringe-indicator-mode t)

  (when (executable-find "git")
    (if (executable-find "python3")
        (treemacs-git-mode 'deferred)
      (treemacs-git-mode 'simple)))

  (setq treemacs-no-png-images t) ; they are ugly

  ;; use sans serif font to make treemacs look modern
  (dolist (face '(treemacs-root-face
                  treemacs-directory-face
                  treemacs-file-face
                  treemacs-git-modified-face
                  treemacs-git-renamed-face
                  treemacs-git-ignored-face
                  treemacs-git-untracked-face
                  treemacs-git-added-face
                  treemacs-git-conflict-face
                  treemacs-tags-face))
    (set-face-font face font-sans-family))

  ;; `doom-themes' has a `doom-themes-treemacs-config' function,
  ;; it does more things. But icons from `all-the-icons' have the
  ;; unbearable size problem, make it look like disaster. So I
  ;; have to write my inferior version of such things.
  ;; But still thanks for all the standard icons!
  ;; (setq doom-themes-treemacs-theme "doom-colors")
  ;; (doom-themes-treemacs-config)
  )

(use-package treemacs-magit
  :after (magit treemacs)
  :commands treemacs-magit--schedule-update
  ;; :hook ((magit-post-commit
  ;;         git-commit-post-finish
  ;;         magit-post-stage
  ;;         magit-post-unstage)
  ;;        . treemacs-magit--schedule-update)))
  )

(use-package treemacs-projectile
  :after (projectile treemacs))

(provide 'init-treemacs)
