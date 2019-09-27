;;; Package Initialize
(require 'package)
(setq package-archives
      '(("gnu"   . "http://mirrors.tuna.tsinghua.edu.cn/elpa/gnu/")
	("melpa" . "http://mirrors.tuna.tsinghua.edu.cn/elpa/melpa/")))
(package-initialize) 

(eval-when-compile
  (add-to-list 'load-path (expand-file-name "lisp" user-emacs-directory))
  (add-to-list 'load-path (expand-file-name "site-lisp" user-emacs-directory))
  (require 'use-package))

(setq custom-file (expand-file-name "custom.el" user-emacs-directory))
(load custom-file)

(require 'init-base)
(require 'init-custom)
(require 'init-font)

(require 'init-editing)
(require 'init-shell)
(require 'init-org)

;;(require 'init-lsp)
(require 'init-racket)
(require 'init-frontend)

(require 'init-spell)
(require 'init-util)

;;; Auto installing packages
;;(require 'use-package-ensure)
;;(setq use-package-always-ensure t)

;;; Flycheck
(use-package flycheck
  :init (global-flycheck-mode)
  :config
  (setq-default flycheck-disabled-checkers '(emacs-lisp-checkdoc)))

;;; org-mode
(setq org-agenda-files '("~/Documents/Docs/org/todos"))

;;; Mode Config
(use-package haskell-mode
  :mode "\\.hs\\'")

(use-package idris-mode
  :mode "\\.idr\\'")

(use-package rust-mode
  :mode "\\.rs\\'")

(use-package markdown-mode
  :ensure t
  :commands (markdown-mode gfm-mode)
  :mode (("README\\.md\\'" . gfm-mode)
	 ("\\.md\\'" . markdown-mode)
	 ("\\.markdown\\'" . markdown-mode)))

;;; ----------------------------------------
;;; Company mode
(global-company-mode)

;;; Ivy
(ivy-mode 1)

(setq ivy-use-virtual-buffer t)
(setq ivy-count-format "(%d/%d) ")
(setq ivy-height 6)

;;(counsel-mode 1)

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

