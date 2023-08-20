;;; init-biblio.el
;;; Bibliography

(require 'org)
(require 'init-util)

(defvar/os my-library-directory
  :windows "C:/Dropbox/library")

(defvar my-biblio
  (if (not my-library-directory)
      nil
    (directory-files-recursively my-library-directory "\\.bib\\'")))

(use-package oc ; org-cite
  :ensure nil
  :config
  (setq org-cite-global-bibliography my-biblio))

(use-package citar
  :init
  (setq citar-bibliography my-biblio)

  (setq citar-library-paths (list my-library-directory))

  (setq org-cite-insert-processor 'citar)
  (setq org-cite-follow-processor 'citar)
  (setq org-cite-activate-processor 'citar)
  :config
  ;; before using pdf-tools, open pdf files in system default application
  (add-to-list 'citar-file-open-functions
               '("pdf" . org-open-file)))

(use-package citar-embark
  :hook ((after-init . citar-embark-mode)))

(provide 'init-biblio)
