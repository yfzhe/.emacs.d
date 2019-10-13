;;; init-util.el
;;; Make life easier

(require 'dash)

(defvar shrink-bases
  `(("~" . ,(expand-file-name "~"))))

(defun yfzhe:shrink-path (full-path)
  (-reduce-from (lambda (path base)
                  (replace-regexp-in-string
                   (concat "^" (cdr base)) (car base) full-path))
                full-path
                shrink-bases))

;;; echo file name
(defun echo-file-name ()
  (interactive)
  (let ((msg
         (if (buffer-file-name)
             (yfzhe:shrink-path (buffer-file-name))
           (concat "Buffer \"" (buffer-name) "\" is not openning a file!"))))
    (message msg)))

(global-set-key (kbd "C-c u f") 'echo-file-name)

;; quick open ~/.emacs.d
(defun open-emacs-d ()
  (interactive)
  (find-file "~/.emacs.d/"))

;; need dictionary to save my poor english
(use-package youdao-dictionary
  :ensure t
  :bind (("C-c u y" . youdao-dictionary-search-at-point)))

(provide 'init-util)
