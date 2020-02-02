;;; init-util.el  -*-lexical-binding: t -*-
;;; Some helper functions

(require 'dash)

;;; ----------------------------------------
;;; abstract the `(pcase system-type ...)' pattern
(defmacro value/os (&rest args)
  "Value depended on `system-type',
each clause using a keyword, `:windows', `:macos', or `:linux',
and an optional `:default' clause."
  (let ((windows (plist-member args :windows))
        (macos (plist-member args :macos))
        (linux (plist-member args :linux))
        (default (plist-member args :default)))
    `(pcase system-type
       ,@(and windows `(('windows-nt ,(cadr windows))))
       ,@(and macos `(('darwin ,(cadr macos))))
       ,@(and linux `(('gnu/linux ,(cadr linux))))
       ,@(and default `((t ,(cadr default)))))))

(defmacro defvar/os (id &rest rhs)
  "Define variable based on `system-type', see `value/os'."
  `(defvar ,id (value/os ,@rhs)))

;;; ----------------------------------------
;;; shrink-path
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
