;;; init-org.el

;;; some great resources
;;; - https://orgmode.org  (of course!)
;;; - https://orgmode.org/worg/org-tutorials/index.html (a list of tutorials)
;;; - https://orgmode.org/worg/org-configs/org-customization-guide.html
;;; - https://www.labri.fr/perso/nrougier/GTD/index.html (GTD with org-mode)

(require 'init-util)

(defconst/os my-org-todos-directory
  :windows "C:/Dropbox/todos"
  :macos "~/Documents/Docs/org/todos")

(use-package org
  :ensure nil
  :bind (("C-c a" . org-agenda)
         ("C-c c" . org-capture))
  :hook ((org-mode . auto-fill-mode))
  :config
  ;; pathes
  (setq org-directory my-org-todos-directory)
  (setq org-agenda-files (list my-org-todos-directory))
  (setq org-default-notes-file "todos.org")

  ;; basic settings
  (setq org-todo-keywords
        '((sequence "TODO" "NEXT" "DOING" "|" "DONE" "CANCEL")))
  (setq org-log-done 'time)

  (setq org-return-follows-link t)

  ;; org-capture
  (setq org-capture-templates
        '(("t" "Todo" entry (file "")
           "* TODO %?\nAdded on %U.")))

  ;; org-agenda
  (setq org-agenda-span 7)

  ;; (setq org-agenda-skip-scheduled-if-done t)
  ;; (setq org-agenda-skip-deadline-if-done t)

  (setq org-agenda-custom-commands
        '(("w" "Weekly agenda"
               ((agenda "" ((org-agenda-span 7)))))
          ("r" "Review"
               ((agenda "" ((org-agenda-span 7)))
                (todo "DOING")
                (todo "TODO"))))))

(use-package ox-pandoc
  :if (executable-find "pandoc"))

;; `ox-md''s export is not "modern"
(use-package ox-gfm)

(use-package org-present)

(provide 'init-org)
