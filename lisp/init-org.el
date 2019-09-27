;;; init-org.el

(defvar org-directory '("~/Documents/Docs/org/"))
(defvar org-agenda-files '("~/Documents/Docs/org/todos/"))

(global-set-key (kbd "C-c a") 'org-agenda)
(global-set-key (kbd "C-c l") 'org-store-link)

;; TODO: should read this article and follow it on day
;; https://orgmode.org/worg/org-configs/org-customization-guide.html

(provide 'init-org)
