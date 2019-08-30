;;; Custom

;;; Dashboard
(use-package dashboard
  :ensure t
  :config
  (progn
    (dashboard-setup-startup-hook)
    (setq dashboard-items '((recents . 5)
			    (bookmarks . 8))
	  dashboard-startup-banner 'logo
	  dashboard-banner-logo-title "Welcome to Emacs Dashboard"
	  dashboard-center-content t
	  dashboard-page-separator " \n \n"
	  dashboard-set-heading-icons t)))
;; dashboard-set-file-icons t
;; dashboard-set-navigator t)))

;;; Modeline
(use-package doom-modeline
  :ensure t
  :hook (after-init . doom-modeline-mode)
  :config
  (setq doom-modeline-buffer-file-name-style 'file-name
	doom-modeline-enable-word-count t))

;; nyan-mode
;;(nyan-mode t)

;;; Basic
(tool-bar-mode -1)
(scroll-bar-mode -1)
(global-linum-mode t)
(column-number-mode t)
;;(setq inhibit-splash-screen 1)
(delete-selection-mode t)
(blink-cursor-mode -1)
(show-paren-mode t)
(setq visible-bell 0)
(defalias 'yes-or-no-p 'y-or-n-p)

;; Initial Frame Size
(setq initial-frame-alist
      (append (list
	       '(width . 100)
	       '(height . 36))
	      initial-frame-alist))
(setq default-frame-alist initial-frame-alist)

;; Frame Title
(setq frame-title-format "%b - Emacs")

;; Time Display
(display-time-mode 1)
(setq display-time-24hr-format t)

(provide 'init-custom)
