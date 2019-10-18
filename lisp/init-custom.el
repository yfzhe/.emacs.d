;;; init-custom.el  -*- lexical-binding: t -*-

;;; Font
;; other great monospace fonts: Operator Mono, Input Mono, IBM Plex Mono
(defvar font-family "Iosevka")

(defvar font-size
  (pcase system-type
    ('windows-nt 11)
    ('darwin 15)))

(set-face-font 'default (concat font-family " " (number-to-string font-size)))

(dolist (charset '(kana han cjk-misc bopomofo))
  (set-fontset-font (frame-parameter nil 'font)
		    charset
		    (font-spec :family "Source Han Sans SC")))

(use-cjk-char-width-table 'zh_CN)

;; (set-fontset-font t 'unicode "Apple Color Emoji" nil 'prepend)

;;; Dashboard
(use-package dashboard
  :init (dashboard-setup-startup-hook)
  :config
  (setq dashboard-items '(;(agenda . 5)
                          (recents . 8)
                          (bookmarks . 6)))
  (let ((banner "~/.emacs.d/assets/left-paren-black-version.png"))
    (setq dashboard-startup-banner
          (if (file-exists-p banner) banner 'logo)))
  (setq dashboard-banner-logo-title "(((Welcome, Paren Hacker!)))")
  (setq dashboard-center-content t)
  (setq dashboard-page-separator " \n \n")
  (setq dashboard-set-heading-icons t))
  ;; (setq dashboard-set-file-icons t))

;;; Modeline
(use-package doom-modeline
  :hook (after-init . doom-modeline-mode)
  :config
  (setq doom-modeline-buffer-file-name-style 'file-name)
  (setq doom-modeline-checker-simple-format nil))

;;; frame settings
;; frame title
(setq frame-title-format "%b - Emacs")

;; initial frame size
(add-to-list 'default-frame-alist '(width . 100))
(add-to-list 'default-frame-alist '(height . 36))

;; transparent background
;; (add-to-list 'default-frame-alist '(alpha . (85 . 50)))

;; titlebar background
(when (eq system-type 'darwin)
  (add-to-list 'default-frame-alist '(ns-transparent-titlebar . t))
  (add-to-list 'default-frame-alist '(ns-appearance . dark)))

;;; theme
;; NOTE: some (not bad) themes
;; - doom-dracula
;; - twillight-anti-bright-theme
(use-package doom-themes)

(provide 'init-custom)
