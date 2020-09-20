;;; init-org.el

;;; some great resources
;;; - https://orgmode.org  (of course!)
;;; - https://orgmode.org/worg/org-tutorials/index.html (a list of tutorials)
;;; - https://orgmode.org/worg/org-configs/org-customization-guide.html

(require 'init-util)

(defconst/os my-org-directory
  :macos "~/Documents/Docs/org")

(defconst/os my-org-agenda-files
  :windows "C:/Dropbox/todos"
  :default (concat my-org-directory "/todos"))

(defconst my-org-default-notes-file
  (concat my-org-agenda-files "/todos.org"))

(use-package org
  :ensure nil
  :bind (("C-c a" . org-agenda)
         ("C-c c" . org-capture))
  :hook ((org-mode . auto-fill-mode))
  :config
  (setq org-directory (list my-org-directory))

  ;; basic settings
  (setq org-todo-keywords
        '((sequence "TODO" "DOING" "|" "DONE" "CANCEL")))
  (setq org-log-done 'time)

  (setq org-return-follows-link t)

  ;; org-capture
  (setq org-default-notes-file my-org-default-notes-file)

  (setq org-capture-templates
        '(("t" "Todo" entry (file "")
           "* TODO %?\n\nAdded at %U.")))

  ;; org-agenda
  (setq org-agenda-files (list my-org-agenda-files))

  (setq show-week-agenda-p t)
  ;; (setq org-agenda-skip-scheduled-if-done t)
  ;; (setq org-agenda-skip-deadline-if-done t)

  (setq org-agenda-custom-commands
        '(("r" "Weekly review"
           ((agenda "" ((org-agenda-span 7)))
            (todo "WORKING")
            (todo "TODO"))))))

(use-package ox-pandoc
  :if (executable-find "pandoc"))

;; `ox-md''s export is not "modern"
(use-package ox-gfm)

(use-package org-present)

(provide 'init-org)
