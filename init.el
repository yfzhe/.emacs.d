;;; package initialize
(require 'package)
(setq package-archives
      '(("gnu"   . "http://mirrors.tuna.tsinghua.edu.cn/elpa/gnu/")
        ("melpa" . "http://mirrors.tuna.tsinghua.edu.cn/elpa/melpa/")))
(package-initialize) 

(eval-when-compile
  (add-to-list 'load-path (expand-file-name "lisp" user-emacs-directory))
  (add-to-list 'load-path (expand-file-name "site-lisp" user-emacs-directory)))

;;; use-package
;;; and auto-install packages
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(eval-and-compile
  (setq use-package-always-ensure t))

(eval-when-compile
  (require 'use-package))

(setq custom-file (expand-file-name "custom.el" user-emacs-directory))
(load custom-file)

;;; exec-path-from-shell-initialize
(when (memq system-type '(darwin))
  (use-package exec-path-from-shell
    :init (exec-path-from-shell-initialize)))

(require 'init-base)
(require 'init-custom)

(require 'init-editing)
(require 'init-ivy)
(require 'init-dired)
(require 'init-git)
(require 'init-eshell)
(require 'init-org)

(require 'init-flycheck)
(require 'init-projectile)

(require 'init-lsp)
(require 'init-racket)
(require 'init-frontend)
(require 'init-haskell)

(require 'init-elfeed)
(require 'init-spell)
(require 'init-util)

;;; mode config
(use-package idris-mode
  :mode "\\.idr\\'")

(use-package rust-mode
  :mode "\\.rs\\'")

(use-package markdown-mode
  :commands (markdown-mode gfm-mode)
  :mode (("README\\.md\\'" . gfm-mode)
         ("\\.md\\'" . markdown-mode)
         ("\\.markdown\\'" . markdown-mode)))

;;; ----------------------------------------
;;; company mode
(global-company-mode)

(setq company-tooltip-align-annotations t)

;;(define-key company-active-map (kbd "<return>") nil)

