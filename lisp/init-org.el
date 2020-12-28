;;; init-org.el

;;; some great resources
;;; - https://orgmode.org  (of course!)
;;; - https://orgmode.org/worg/org-tutorials/index.html (a list of tutorials)
;;; - https://orgmode.org/worg/org-configs/org-customization-guide.html
;;; - https://www.labri.fr/perso/nrougier/GTD/index.html (GTD with org-mode)

(require 'init-util)

(defconst/os my-org-directory
  :windows "C:/Dropbox"
  :macos "~/Documents/Docs/org")

(defun my-org-file (path)
  "build file-path based on `my-org-directory'"
  (expand-file-name path my-org-directory))

(use-package org
  :ensure nil
  :bind (("C-c a" . org-agenda)
         ("C-c c" . org-capture))
  :hook ((org-mode . auto-fill-mode))
  :config
  ;; pathes
  (setq org-directory my-org-directory)
  (setq org-agenda-files (list (my-org-file "todos")))
  (setq org-default-notes-file (my-org-file "./todos/inbox.org"))
  (let ((archive-file (my-org-file "./archive/todos.org")))
    (setq org-archive-location (concat archive-file "::")))

  ;; basic settings
  (setq org-todo-keywords
        '((sequence "TODO" "NEXT" "DOING" "|" "DONE" "CANCEL")))
  (setq org-log-done 'time)

  (setq org-return-follows-link t)

  ;; org-capture
  (setq org-capture-templates
        '(("t" "Todo" entry (file "")
           "* TODO %?\nAdded on %U.")))

  ;; org-refile
  (setq org-refile-targets
        '((org-agenda-files :todo . "TODO")))

  (setq org-refile-use-outline-path 'file)
  (setq org-outline-path-complete-in-steps nil)

  ;; don't automatically set bookmarks
  (setq org-bookmark-names-plist nil)

  ;; org-agenda
  (setq org-agenda-span 7)

  ;; (setq org-agenda-skip-scheduled-if-done t)
  ;; (setq org-agenda-skip-deadline-if-done t)

  (setq org-agenda-custom-commands
        '(("a" "Today Agenda"
           ((todo "NEXT")
            (agenda "" ((org-agenda-span 1)))
            (todo "DOING")))
          ("i" "Inbox"
           ((tags "inbox")))
          ("w" "Weekly agenda"
           ((agenda "" ((org-agenda-span 7))))))))

(use-package ox-pandoc
  :if (executable-find "pandoc"))

;; `ox-md''s export is not "modern"
(use-package ox-gfm)

(use-package org-present)

(provide 'init-org)
