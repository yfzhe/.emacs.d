;;; init-org.el

(setq org-directory '("~/Documents/Docs/org/"))
(setq org-agenda-files '("~/Documents/Docs/org/todos/"))

(setq show-week-agenda-p t)
(setq org-log-done 'time)

(global-set-key (kbd "C-c a") 'org-agenda)
(global-set-key (kbd "C-c l") 'org-store-link)

;; TODO: should read this article and follow it on day
;; https://orgmode.org/worg/org-configs/org-customization-guide.html

(provide 'init-org)
