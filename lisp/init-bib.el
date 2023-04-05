;;; init-bib.el
;;; Bibliography

(require 'dash)
(require 'init-util)

(defvar/os my-library-directory
  :windows "C:/Dropbox/library")

(defvar my-biblio
  (if (not my-library-directory)
      nil
    (-filter (lambda (file) (equal (file-name-extension file) "bib"))
             (directory-files my-library-directory))))

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
  (setq org-cite-activate-processor 'citar))

(use-package citar-embark
  :hook ((after-init . citar-embark-mode)))

(provide 'init-bib)
