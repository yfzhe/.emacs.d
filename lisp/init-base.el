;;; init-base.el

;;; Basic settings
(delete-selection-mode t)
(blink-cursor-mode -1)
(show-paren-mode t)
(setq visible-bell 0)
(defalias 'yes-or-no-p 'y-or-n-p)

;; Default encoing use utf-8
(setq default-buffer-file-coding-system 'utf-8)
(prefer-coding-system 'utf-8)

;; Rainbow Delimiters
;;(add-hook 'prog-mode-hook #'rainbow-delimiters-mode)

;; DrRacket-like Unicode Input
(global-set-key (kbd "C-\\") 'dr-racket-like-unicode-char)

;; recentf
(use-package recentf
  :hook (after-init . recentf-mode)
  :init
  (setq recentf-max-saved-items 200)
  (setq recentf-exclude '((expand-file-name package-user-dir)
			  "bookmarks"
			  "recentf"
              ".elfeed/")))

(provide 'init-base)
