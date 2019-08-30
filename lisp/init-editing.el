;;; Editing

;; Auto save and backup
(setq auto-save-default nil)
(setq make-backup-files nil)

;; Default encoing use utf-8
(setq default-buffer-file-coding-system 'utf-8)
(prefer-coding-system 'utf-8)

;; Rainbow Delimiters
;;(add-hook 'prog-mode-hook #'rainbow-delimiters-mode)

;; DrRacket-like Unicode Input
(global-set-key (kbd "C-\\") 'dr-racket-like-unicode-char)

;; Indent
(defun indent-buffer ()
  (interactive)
  (indent-region (point-min) (point-max)))

(defun indent-region-or-buffer ()
  (interactive)
  (save-excursion
    (if (region-active-p)
	(progn
	  (indent-region (region-beginning) (region-end))
	  (message "Indent selected region."))
      (progn
	(indent-buffer)
	(message "Indent buffer.")))))

;;(global-set-key (kbd "C-M-\\") 'indent-region-or-buffer)
(global-set-key (kbd "C-i") 'indent-region-or-buffer)

;;; ----------------------------------------
;;; Dired Mode
(setq dired-recursive-deletes 'always)
(setq dired-recursive-copies 'always)

;; Reuse the only one buffer for dired mode
(put 'dired-find-alternate-file 'disabled nil)
(with-eval-after-load 'dired
  (define-key dired-mode-map (kbd "RET") 'dired-find-alternate-file))

;; Dired mode sorting: show directories first
(require 'ls-lisp)
(setq ls-lisp-use-insert-directory-program nil)
(setq ls-lisp-dirs-first t)

;; EShell
(setq shell-command-switch "-ic")

(provide 'init-editing)

