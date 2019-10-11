;;; init-editing.el
;;; Editing

;; Auto save and backup
(setq auto-save-default nil)
(setq make-backup-files nil)

;; DrRacket-like Unicode Input
(use-package dr-racket-like-unicode
  :bind ("C-M-\\" . dr-racket-like-unicode-char))

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

(global-set-key (kbd "C-c i") 'indent-region-or-buffer)

(global-set-key (kbd "C-c c") 'comment-or-uncomment-region)

;; use space instead of tab for indentation
(setq-default indent-tabs-mode nil)
(setq-default tab-width 4)

(setq-default tab-always-indent 'complete)

(provide 'init-editing)
