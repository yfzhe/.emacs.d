;;; init-base.el

;;; Basic settings
(delete-selection-mode t)
(blink-cursor-mode -1)
(show-paren-mode t)
(setq visible-bell 0)
(defalias 'yes-or-no-p 'y-or-n-p)

;; Default encoing use utf-8, and goodbey to CRLF
(prefer-coding-system 'utf-8-unix)

(column-number-mode t)

;;; line numbers
(global-display-line-numbers-mode t)

;;; better `default-directory' after starting
(setq default-directory
      (pcase system-type
        ('windows-nt "C:/")
        ('darwin "~/Code/")))

;;; ibuffer
(use-package ibuffer
  :bind ("C-x C-b" . ibuffer)
  :config
  (setq ibuffer-show-empty-filter-groups nil))

(use-package all-the-icons-ibuffer
  :init (all-the-icons-ibuffer-mode 1))

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
