;;; init-ui.el  -*- lexical-binding: t -*-

;;; Dashboard
(use-package dashboard
  :init (dashboard-setup-startup-hook)
  :config
  (setq dashboard-items '((recents . 8)
                          (bookmarks . 6)))
  (setq dashboard-startup-banner
        (let ((banner (expand-file-name "assets/left-paren-black-version.png"
                                        user-emacs-directory)))
          (if (file-exists-p banner) banner 'logo)))
  (setq dashboard-banner-logo-title "(((Welcome, Paren Hacker!)))")
  (setq dashboard-center-content t)
  (setq dashboard-page-separator " \n \n")
  (setq dashboard-set-heading-icons t)
  ;; (setq dashboard-set-file-icons t)

  (setq dashboard-set-navigator t)
  (setq dashboard-navigator-buttons
        `(((nil
            "Restore" "Restore last session"
            (lambda (&rest _) (restore-last-session))))))

  (defun restore-last-session ()
    (interactive)
    (cond
     ((bound-and-true-p persp-mode)
      (message "Restoring last session...")
      (persp-load-state-from-file))
     (desktop-save-mode
      (message "Restoring last desktop session...")
      (desktop-read))))

  :bind (:map dashboard-mode-map
         ("R" . restore-last-session)))

;;; Modeline
(setq display-time-24hr-format t)
(setq display-time-default-load-average nil)
(display-time-mode 1)

(use-package doom-modeline
  :hook (after-init . doom-modeline-mode)
  :config
  (setq doom-modeline-buffer-file-name-style 'file-name)
  (setq doom-modeline-checker-simple-format nil))

;;; frame settings
;; frame title
(setq frame-title-format "%b - Emacs")

;; initial frame size
(add-to-list 'default-frame-alist '(width . 90))
(add-to-list 'default-frame-alist '(height . 36))

;; transparent background
;; (add-to-list 'default-frame-alist '(alpha . (95 . 0)))

;; titlebar background
(when (eq system-type 'darwin)
  (add-to-list 'default-frame-alist '(ns-transparent-titlebar . t))
  (add-to-list 'default-frame-alist '(ns-appearance . dark)))

;; when frames are maximized, please spilt windows horizontally
(setq split-width-threshold 120)

;;; theme
;; NOTE: some (not bad) themes
;; - doom-dracula (from `doom-themes')
;; - kaolin-ocean and kaolin-dark (from `kaolin-themes', support terminal)
;; - panda-theme
;; - twillight-bright-theme & twillight-anti-bright-theme
(use-package doom-themes)
(use-package kaolin-themes) ;; better in terminal

(unless (display-graphic-p)
  (load-theme 'kaolin-ocean))

;;; highlight cursor (disabled)
(use-package beacon
  :disabled t
  :init (setq beacon-color "#99d4e8")
  :hook (after-init . beacon-mode))

(provide 'init-ui)
