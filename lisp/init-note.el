;;; init-note.el
;;; Use Emacs as knowledge management tool

(require 'init-util)

(defconst/os my-note-directory
  :windows "C:/Dropbox/notes"
  :macos "~/Documents/Docs/notes")

(use-package denote
  :hook ((dired-mode . denote-dired-mode-in-directories))
  :bind (("C-c d c" . denote))
  :config
  (setq denote-directory my-note-directory)

  (setq denote-prompts '(subdirectory title keywords))
  (setq denote-infer-keywords t)
  (setq denote-file-type 'org)

  ;; note "archives"
  (setq denote-excluded-directories-regexp "^archive$"))

(use-package citar-denote
  :hook ((after-init . citar-denote-mode))
  :init
  (setq citar-notes-paths (list my-note-directory))
  (setq citar-denote-title-format 'author-year))

(use-package consult-notes
  :hook ((after-init . consult-notes-denote-mode))
  :bind (("C-c d f" . consult-notes)
         ("C-c d s" . consult-notes-search-in-all-notes)))

(provide 'init-note)
