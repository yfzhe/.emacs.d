;;; init-misc.el   -*- lexical-binding: t -*-
;;; Make life easier

(require 'init-util)

;;; echo current file name
(defun echo-file-name ()
  "show current buffer-file-name"
  (interactive)
  (let ((msg
         (if (buffer-file-name)
             (my-shrink-path (buffer-file-name))
           (format "Buffer \"%s\" is not openning a file!" (buffer-name)))))
    (message msg)))

(global-set-key (kbd "C-c u f") 'echo-file-name)

;; quick open ~/.emacs.d
(defun open-emacs-config ()
  "Open ~/.emacs.d"
  (interactive)
  (find-file "~/.emacs.d/"))

;;; dictionaries
(use-package fanyi
  :bind (("C-c u w" . fanyi-dwim2))
  :custom
  (fanyi-providers '(fanyi-longman-provider
                     fanyi-haici-provider
                     fanyi-etymon-provider)))

(use-package youdao-dictionary
  :bind (("C-c u y" . youdao-dictionary-search-at-point)))

;;; profile startup
(use-package esup
  ;; see https://github.com/jschaf/esup/issues/85
  :config (setq esup-depth 0))

(provide 'init-misc)
