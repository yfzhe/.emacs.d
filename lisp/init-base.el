;;; init-base.el

(setq use-short-answers t)
(setq delete-by-moving-to-trash t)

(set-charset-priority 'unicode)
(prefer-coding-system 'utf-8-unix) ;; no CRLF
(setq system-time-locale "C") ;; see: https://emacs-china.org/t/topic/1551/16

(use-package exec-path-from-shell
  :when (memq system-type '(darwin))
  :init (exec-path-from-shell-initialize))

(use-package simple
  :ensure nil
  :init
  (setq line-number-mode t)
  (setq column-number-mode t))

(use-package display-line-numbers
  :ensure nil
  :hook (((prog-mode text-mode conf-mode) . display-line-numbers-mode)))

;;; recentf
(use-package recentf
  :ensure nil
  :hook (after-init . recentf-mode)
  :bind (("C-x C-r" . recentf-open-files))
  :init
  (setq recentf-max-saved-items 1000)
  (setq recentf-exclude '((expand-file-name package-user-dir)
                          "bookmarks"
                          "recentf"
                          ".elfeed/"
                          "elpa/"
                          ".cache/")))

(use-package saveplace
  :ensure nil
  :hook (after-init . save-place-mode))

;;; minibuffer history
(use-package savehist
  :ensure nil
  :hook (after-init . savehist-mode))

;;; ibuffer
(use-package ibuffer
  :ensure nil
  :bind ("C-x C-b" . ibuffer))

(use-package all-the-icons-ibuffer
  :hook (ibuffer-mode . all-the-icons-ibuffer-mode))

(use-package browse-url
  :ensure nil
  :bind (("C-c u l" . browse-url-at-point)))

;;; which-key: hints key bindings
(use-package which-key
  :hook (after-init . which-key-mode))

(provide 'init-base)
