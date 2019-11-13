;;; init-org.el

;;; some great resources
;;; - https://orgmode.org  (of course!)
;;; - https://orgmode.org/worg/org-tutorials/index.html (a list of tutorials)
;;; - https://orgmode.org/worg/org-configs/org-customization-guide.html

(setq org-directory '("~/Documents/Docs/org/"))
(setq org-agenda-files '("~/Documents/Docs/org/todos/"))

(global-set-key (kbd "C-c a") 'org-agenda)
(global-set-key (kbd "C-c l") 'org-store-link)

(setq show-week-agenda-p t)
(setq org-todo-keywords
      '((sequence "TODO" "DOING" "|" "DONE" "CANCEL")))
(setq org-log-done 'time)
;;(setq org-agenda-skip-scheduled-if-done t)
;;(setq org-agenda-skip-deadline-if-done t)

(setq org-return-follows-link t)

;; enable markdown backend
(use-package ox-md
  :ensure nil)

(provide 'init-org)
