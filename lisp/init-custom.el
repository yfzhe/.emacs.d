;;; init-custom.el

;;; Font
;; other great monospace fonts: Operator Mono, Input Mono, IBM Plex Mono
(defvar font-family "Iosevka")

(defvar font-size
  (pcase system-type
    ('windows-nt 11)
    ('darwin 15)))

(defvar font-string (concat font-family " " (number-to-string font-size)))
(set-face-attribute 'default nil :font font-string)

(dolist (charset '(kana han cjk-misc bopomofo))
  (set-fontset-font (frame-parameter nil 'font)
		    charset
		    (font-spec :family "Source Han Sans SC")))

(use-cjk-char-width-table 'zh_CN)

;; (set-fontset-font t 'unicode "Apple Color Emoji" nil 'prepend)

;;; Dashboard
(use-package dashboard
  :ensure t
  :config
  (dashboard-setup-startup-hook)
  (setq dashboard-items '((recents . 5)
                          (bookmarks . 6)))
  (setq dashboard-startup-banner 'logo)
  (setq dashboard-banner-logo-title "Welcome to Emacs Dashboard")
  (setq dashboard-center-content t)
  (setq dashboard-page-separator " \n \n")
  (setq dashboard-set-heading-icons t)
  ;; (setq dashboard-set-file-icons t)
  ;; (setq dashboard-set-navigator t))
  (setq show-week-agenda-p t))

;;; Modeline
(use-package doom-modeline
  :ensure t
  :hook (after-init . doom-modeline-mode)
  :config
  (setq doom-modeline-buffer-file-name-style 'file-name
        doom-modeline-enable-word-count t))

;; initial frame size
(add-to-list 'default-frame-alist '(width . 100))
(add-to-list 'default-frame-alist '(height . 36))

;; transparent background
;; (add-to-list 'default-frame-alist '(alpha . (85 . 50)))

(provide 'init-custom)
