;;; init-note.el
;;; Use Emacs as knowledge management tool

(require 'init-util)

(defconst/os my-note-directory
  :windows "C:/Dropbox/notes"
  :macos "~/Documents/Docs/notes")

(use-package denote
  :hook ((dired-mode . denote-dired-mode-in-directories))
  :bind (("C-c d" . denote-open-or-create))
  :config
  (setq denote-directory my-note-directory)

  (setq denote-prompts '(subdirectory title keywords))
  (setq denote-infer-keywords t)
  (setq denote-file-type 'org)

  ;; note "archives"
  (setq denote-excluded-directories-regexp "^archive$")

  (add-to-list 'vertico-multiform-commands
               '(denote-open-or-create buffer)))

(use-package deft
  :config
  (setq deft-extensions '("txt" "md" "org"))
  (setq deft-default-extension "org")
  (setq deft-directory my-note-directory)
  (setq deft-recursive t)

  (setq deft-use-filename-as-title nil)
  (setq deft-use-filter-string-for-filename t)
  (setq deft-file-naming-rules
        '(;(noslash . "-") ;; don't replace slash, so we can make notes in sub-dir easier
          (nospace . "-")
          (case-fn . downcase)))

  (setq deft-auto-save-interval 30))

(provide 'init-note)
