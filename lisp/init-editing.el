;;; init-editing.el
;;; Editing

;;; auto save and backup
(setq auto-save-default nil)
(setq make-backup-files nil)

;; use space instead of tab for indentation
(setq-default indent-tabs-mode nil)
(setq-default tab-width 4)

(setq-default tab-always-indent 'complete)

;; DrRacket-like unicode input
(use-package dr-racket-like-unicode
  :bind ("C-M-\\" . dr-racket-like-unicode-char))

;;; rainbow delimiters
(use-package rainbow-delimiters)

;;; highlight current line
;; (use-package hl-line
;;   :hook (after-init . global-hl-line-mode))

;;; highlight indentation
;; (use-package highlight-indent-guides
;;   :hook (prog-mode . highlight-indent-guides-mode)
;;   :init
;;   (setq highlight-indent-guides-method 'character)
;;   (setq highlight-indent-guides-auto-enabled nil)
;;   :config
;;   (set-face-foreground 'highlight-indent-guides-character-face "dimgray"))

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

;; better comment-or-uncomment experience
;; see: https://stackoverflow.com/questions/9688748/emacs-comment-uncomment-current-line
(defun comment-or-uncomment-region-or-line ()
  (interactive)
  (if (region-active-p)
      (comment-or-uncomment-region (region-beginning) (region-end))
    (comment-or-uncomment-region (line-beginning-position) (line-end-position))))

(global-set-key (kbd "C-c c") 'comment-or-uncomment-region-or-line)

;; highlight todo
(use-package hl-todo
  :hook (after-init . global-hl-todo-mode))

(provide 'init-editing)
