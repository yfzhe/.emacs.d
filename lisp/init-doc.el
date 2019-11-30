;;; init-doc.el
;;; Docs, words, but no knowledge

(use-package markdown-mode
  :commands (markdown-mode gfm-mode)
  :mode (("README\\.md\\'" . gfm-mode)
         ("\\.md\\'" . markdown-mode)
         ("\\.markdown\\'" . markdown-mode))
  :hook (markdown-mode . auto-fill-mode))

;;; use `deft' for notes
(defvar my-deft-directory
  (pcase system-type
    ('windows-nt "C:/Dropbox/notes")
    ('darwin "~/Documents/Docs/notes")))

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
