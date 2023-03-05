;;; init-editing.el
;;; It is for editing to use Emacs, isn't it?

;; disable auto-save and backup
(setq auto-save-default nil)
(setq make-backup-files nil)

;; and no lock files
(setq create-lockfiles nil)

;; use space instead of tab for indentation
(setq-default indent-tabs-mode nil)
(setq-default tab-width 4)

(setq-default tab-always-indent 'complete)

;; automatically reload files was modified elsewhere
(global-auto-revert-mode t)

(use-package whitespace
  :ensure nil
  :hook ((before-save . whitespace-cleanup)))

;; formating is always an important thing
(use-package editorconfig
  :hook (after-init . editorconfig-mode))

;; paren, bracket, brace, I can't leave them
;; even when not writing LISP
(use-package smartparens
  :config (require 'smartparens-config)
  :hook (prog-mode . smartparens-mode))

(use-package paredit
  :hook (emacs-lisp-mode . paredit-mode))

;; rainbow delimiters
(use-package rainbow-delimiters)

;; jump to any character
(use-package avy
  :bind ("M-g a" . avy-goto-char-2))

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

;; auto fill-column
(setq-default fill-column 80)
(global-set-key (kbd "C-c u q") 'auto-fill-mode)

;; highlight fill-column
(add-hook 'prog-mode-hook #'display-fill-column-indicator-mode)
(add-hook 'text-mode-hook #'display-fill-column-indicator-mode)

;; visual line
(setq word-wrap t)
(setq word-wrap-by-category t)

;; even as lispers, we have to meet the camelCase words!
(global-set-key (kbd "C-c u s") 'subword-mode)

;;; lots of highlight
;; highlight current line
(use-package hl-line
  :ensure nil
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

(global-set-key (kbd "C-;") 'comment-or-uncomment-region-or-line)
;; if you are still missing `comment-line', using "C-x C-;"

(provide 'init-editing)
