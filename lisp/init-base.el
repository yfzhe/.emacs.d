;;; init-base.el

;;; Basic settings
(blink-cursor-mode -1)
(setq visible-bell 0)
(setq use-short-answers t)
(delete-selection-mode t)
(show-paren-mode t)

;;; Encoding, and NO CRLF
(prefer-coding-system 'utf-8-unix)

;;; line & column numbers
(add-hook 'prog-mode-hook #'display-line-numbers-mode)
(add-hook 'text-mode-hook #'display-line-numbers-mode)
(column-number-mode t)

;;; better `default-directory' after starting
(setq default-directory
      (pcase system-type
        ('windows-nt "C:/")
        ('darwin "~/Code/")))

;;; recentf
(use-package recentf
  :hook (after-init . recentf-mode)
  :init
  (setq recentf-max-saved-items 1000)
  (setq recentf-exclude '((expand-file-name package-user-dir)
                          "bookmarks"
                          "recentf"
                          ".elfeed/"
                          "elpa/"
                          ".cache/")))

;;; exec-path-from-shell initialize
(use-package exec-path-from-shell
  :if (memq system-type '(darwin))
  :init (exec-path-from-shell-initialize))

;;; ibuffer
(use-package ibuffer
  :bind ("C-x C-b" . ibuffer)
  :config
  (setq ibuffer-show-empty-filter-groups nil))

(use-package all-the-icons-ibuffer
  :init (all-the-icons-ibuffer-mode 1))

;;; which-key: hints key bindings
(use-package which-key
  :hook (after-init . which-key-mode))

;;; link-hint
(use-package link-hint
  :bind (("C-c u l" . link-hint-open-link)))
         ;("C-c u c" . link-hint-copy-link)))

;;; better package-list
(use-package paradox
  :init
  (setq paradox-execute-asynchronously t)
  (setq paradox-display-star-count nil)
  :config
  (paradox-enable))

(provide 'init-base)
