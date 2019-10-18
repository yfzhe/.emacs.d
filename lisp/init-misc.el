;;; init-util.el   -*- lexical-binding: t -*-
;;; Make life easier

;;; echo file name
(eval-when-compile
  (require 'init-util))

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
  (interactive)
  (find-file "~/.emacs.d/"))

;; need dictionary to save my poor english
(use-package youdao-dictionary
  :bind (("C-c u y" . youdao-dictionary-search-at-point)))

(provide 'init-misc)
