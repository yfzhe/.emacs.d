;;; init-base.el

;;; Basic settings
(delete-selection-mode t)
(blink-cursor-mode -1)
(show-paren-mode t)
(setq visible-bell 0)
(defalias 'yes-or-no-p 'y-or-n-p)

;; Default encoing use utf-8
(setq default-buffer-file-coding-system 'utf-8)
(prefer-coding-system 'utf-8)

;;; Some UI settings
(tool-bar-mode -1)
(scroll-bar-mode -1)
(global-linum-mode t)
(column-number-mode t)
;;(setq inhibit-splash-screen 1)

(setq use-file-dialog nil)
(setq use-dialog-box nil)

;; time display
(display-time-mode 1)
(setq display-time-24hr-format t)

;;; ibuffer
(use-package ibuffer
  :ensure nil
  :bind ("C-x C-b" . ibuffer))

;;; recentf
(use-package recentf
  :hook (after-init . recentf-mode)
  :init
  (setq recentf-max-saved-items 200)
  (setq recentf-exclude '((expand-file-name package-user-dir)
                          "bookmarks"
                          "recentf"
                          ".elfeed/"
                          "elpa/")))

;;; which-key: hints key bindings
(use-package which-key
  :hook (after-init . which-key-mode))

;;; link-hint
(use-package link-hint
  :bind (("C-c u l" . link-hint-open-link)))
         ;("C-c u c" . link-hint-copy-link)))

(provide 'init-base)
