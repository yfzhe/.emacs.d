;;; init-org.el

;;; some great resources
;;; - https://orgmode.org  (of course!)
;;; - https://orgmode.org/worg/org-tutorials/index.html (a list of tutorials)
;;; - https://orgmode.org/worg/org-configs/org-customization-guide.html

(defvar my-org-agenda-files
  (pcase system-type
    ('windows-nt "C:/Dropbox/todos/")
    ('darwin "~/Documents/Docs/org/todos/")))

(use-package org
  :ensure nil
  :bind (("C-c a" . org-agenda)
         ("C-c l" . org-store-link))
  :hook (; use auto-fill-mode when edit org files
         (org-mode . auto-fill-mode))
  :config
  (setq org-directory '("~/Documents/Docs/org/"))
  (setq org-agenda-files (list my-org-agenda-files))

  (setq show-week-agenda-p t)
  (setq org-todo-keywords
        '((sequence "TODO" "DOING" "|" "DONE" "CANCEL")))
  (setq org-log-done 'time)
  ;;(setq org-agenda-skip-scheduled-if-done t)
  ;;(setq org-agenda-skip-deadline-if-done t)

  (setq org-return-follows-link t))

;; enable markdown backend
(use-package ox-md
  :ensure nil)

(provide 'init-org)
