;;; init-base.el

;;; Basic settings
(delete-selection-mode t)
(blink-cursor-mode -1)
(show-paren-mode t)
(setq visible-bell 0)
(defalias 'yes-or-no-p 'y-or-n-p)

;; Default encoing use utf-8, and goodbey to CRLF
(prefer-coding-system 'utf-8-unix)

;;; Some UI settings
(tool-bar-mode -1)
(scroll-bar-mode -1)
(global-linum-mode t)
(column-number-mode t)
;;(setq inhibit-splash-screen 1)

(setq use-file-dialog nil)
(setq use-dialog-box nil)

;;; better `default-directory' after starting
(setq default-directory
      (pcase system-type
        ('windows-nt "C:/")
        ('darwin "~/Documents/")))

;;; ibuffer
(use-package ibuffer
  :bind ("C-x C-b" . ibuffer)
  :config
  (setq ibuffer-show-empty-filter-groups nil))

;;; recentf
(use-package recentf
  :hook (after-init . recentf-mode)
  :init
  (setq recentf-max-saved-items 1000)
  (setq recentf-exclude '((expand-file-name package-user-dir)
                          "bookmarks"
                          "recentf"
                          ".elfeed/"
                          "elpa/"
                          ".cache/")))

;;; which-key: hints key bindings
(use-package which-key
  :hook (after-init . which-key-mode))

;;; link-hint
(use-package link-hint
  :bind (("C-c u l" . link-hint-open-link)))
         ;("C-c u c" . link-hint-copy-link)))

;;; better package-list
(use-package paradox
  :init
  (setq paradox-execute-asynchronously t)
  (setq paradox-display-star-count nil)
  :config
  (paradox-enable))

(provide 'init-base)
