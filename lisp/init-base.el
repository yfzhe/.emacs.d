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

;; frame title
(setq frame-title-format "%b - Emacs")

;; time display
(display-time-mode 1)
(setq display-time-24hr-format t)

;;; Rainbow Delimiters
;;(add-hook 'prog-mode-hook #'rainbow-delimiters-mode)

;;; recentf
(use-package recentf
  :hook (after-init . recentf-mode)
  :init
  (setq recentf-max-saved-items 200)
  (setq recentf-exclude '((expand-file-name package-user-dir)
                          "bookmarks"
                          "recentf"
                          ".elfeed/")))

(provide 'init-base)
