;;; init-dashboard.el
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

(provide 'init-dashboard)
