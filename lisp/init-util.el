;;; init-util.el  -*-lexical-binding: t -*-
;;; Some helper functions

(require 'dash)

(defvar shrink-bases
  `(("~" . ,(expand-file-name "~"))
    ("~/D" . "~/Documents")
    ("*Dejavu-Code*:" . "~/D/Dejavu/Code/")
    ("*Org*:" . "~/D/Docs/Org/"))
  "a list of path shrink-base: (care for the order!)")

(defun yfzhe-shrink-path (full-path)
  (-reduce-from (lambda (path base)
                  (replace-regexp-in-string
                   (concat "^" (cdr base)) (car base) path))
                full-path
                shrink-bases))

(provide 'init-util)
