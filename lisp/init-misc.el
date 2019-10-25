;;; init-util.el   -*- lexical-binding: t -*-
;;; Make life easier

;;; echo file name
(require 'init-util)

(defun echo-file-name ()
  (interactive)
  (let ((msg
         (if (buffer-file-name)
             (yfzhe-shrink-path (buffer-file-name))
           (concat "Buffer \"" (buffer-name) "\" is not openning a file!"))))
    (message msg)))

(global-set-key (kbd "C-c u f") 'echo-file-name)

;; quick open ~/.emacs.d
(defun open-emacs-d ()
  "Open ~/.emacs.d"
  (interactive)
  (find-file "~/.emacs.d/"))

;; reload init file
(defun reload-init-file ()
  "Reload Emacs configurations"
  (interactive)
  (load-file user-init-file))

;; need dictionary to save my poor english
(use-package youdao-dictionary
  :bind (("C-c u y" . youdao-dictionary-search-at-point)))

(provide 'init-misc)
