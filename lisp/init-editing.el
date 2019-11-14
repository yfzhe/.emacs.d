;;; init-editing.el
;;; It is for editing to use Emacs, isn't it?

;; disable auto-save and backup
(setq auto-save-default nil)
(setq make-backup-files nil)

;; use space instead of tab for indentation
(setq-default indent-tabs-mode nil)
(setq-default tab-width 4)

(setq-default tab-always-indent 'complete)

;; automatically reload files was modified elsewhere
(global-auto-revert-mode t)

;; undo-tree: better undo and redo
(use-package undo-tree
  :defines recentf-exclude
  :hook (after-init . global-undo-tree-mode)
  :init
  (setq undo-tree-visualizer-diff t)
  (setq undo-tree-enable-undo-in-region nil)
  (setq undo-tree-auto-save-history nil)
  (setq undo-tree-history-directory-alist
        `(("." . ,(locate-user-emacs-file "undo-tree-hist/"))))
  :config
  (dolist (dir undo-tree-history-directory-alist)
    (push (expand-file-name (cdr dir)) recentf-exclude)))

;; DrRacket-like unicode input
(use-package dr-racket-like-unicode
  :bind ("C-M-\\" . dr-racket-like-unicode-char))

;; rainbow delimiters
(use-package rainbow-delimiters)

;; show "whitespace"
(global-set-key (kbd "C-c u w") 'whitespace-mode)

;; auto fill-column
(global-set-key (kbd "C-c u q") 'auto-fill-mode)

;;; lots of highlight
;; highlight current line
(use-package hl-line
  :hook ((prog-mode text-mode) . hl-line-mode))

;; highlight indentation
;; (use-package highlight-indent-guides
;;   :hook (prog-mode . highlight-indent-guides-mode)
;;   :init
;;   (setq highlight-indent-guides-method 'character)
;;   (setq highlight-indent-guides-auto-enabled nil)
;;   :config
;;   (set-face-foreground 'highlight-indent-guides-character-face "dimgray"))

;; highlight todo
(use-package hl-todo
  :hook (after-init . global-hl-todo-mode))

;; highlight fill-column
;; (use-package fill-column-indicator
;;   :hook ((text-mode . fci-mode)
;;          (prog-mode . fci-mode)))

(use-package goto-line-preview
  :bind ([remap goto-line] . goto-line-preview))

;; indent
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

;; better comment-or-uncomment
;; see: https://stackoverflow.com/questions/9688748/emacs-comment-uncomment-current-line
(defun comment-or-uncomment-region-or-line ()
  (interactive)
  (if (region-active-p)
      (comment-or-uncomment-region (region-beginning) (region-end))
    (comment-or-uncomment-region (line-beginning-position) (line-end-position))))

(global-set-key (kbd "C-c c") 'comment-or-uncomment-region-or-line)

(provide 'init-editing)
