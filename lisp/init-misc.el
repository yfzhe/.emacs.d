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
  :bind (("C-c u y" . fanyi-dwim2))
  :custom
  (fanyi-providers '(fanyi-longman-provider
                     fanyi-haici-provider
                     fanyi-etymon-provider)))

;;; DrRacket-like unicode input
(use-package dr-racket-like-unicode
  :bind ("C-M-\\" . dr-racket-like-unicode-char))

;;; better package-list
(use-package paradox
  :hook (after-init . paradox-enable)
  :init
  (setq paradox-execute-asynchronously t)
  (setq paradox-display-star-count nil))

;;; profile startup
(use-package esup
  ;; see https://github.com/jschaf/esup/issues/85
  :config (setq esup-depth 0))

(provide 'init-misc)
