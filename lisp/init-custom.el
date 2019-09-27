;;; Custom

;;; Dashboard
(use-package dashboard
  :ensure t
  :config
  (progn
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
    (setq show-week-agenda t)))

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
