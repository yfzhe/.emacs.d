;;; init-doc.el
;;; Docs, words, but no knowledge

(require 'init-util)

(use-package markdown-mode
  :commands (markdown-mode gfm-mode)
  :mode (("README\\.md\\'" . gfm-mode)
         ("\\.\\(md\\|mkd\\|markdown\\)\\'" . markdown-mode)))

;;; use `deft' for notes
(defconst/os my-deft-directory
  :windows "C:/Dropbox/notes"
  :macos "~/Documents/Docs/notes")

(use-package deft
  :config
  (setq deft-extensions '("txt" "md" "org" "tex"))
  (setq deft-default-extension "org")
  (setq deft-directory my-deft-directory)
  (setq deft-recursive t)

  (setq deft-use-filename-as-title nil)
  (setq deft-use-filter-string-for-filename t)
  (setq deft-file-naming-rules
        '(;(noslash . "-") ;; don't replace slash, so we can make notes in sub-dir easier
          (nospace . "-")
          (case-fn . downcase)))

  (setq deft-auto-save-interval 30))

(provide 'init-doc)
