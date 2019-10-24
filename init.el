;;; init.el  -*- lexical-binding: t -*-

;;; adjust gc threshold for speeding up
(let ((normal-gc-cons-threshold (* 128 1024 1024))
      (init-gc-cons-threshold (* 384 1024 1024)))
  (setq gc-cons-threshold init-gc-cons-threshold)
  (add-hook #'emacs-startup-hook
            (lambda () (setq gc-cons-threshold normal-gc-cons-threshold))))

(add-hook 'focus-out-hook #'garbage-collect)

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

;;; exec-path-from-shell initialize
(when (memq system-type '(darwin))
  (use-package exec-path-from-shell
    :init (exec-path-from-shell-initialize)))

(require 'init-base)
(require 'init-custom)
(when (display-graphic-p)
  (require 'init-font))

(require 'init-editing)
(require 'init-ivy)
(require 'init-dired)
(require 'init-org)
(require 'init-eshell)

(require 'init-company)
(require 'init-git)
(require 'init-flycheck)
(require 'init-projectile)

(require 'init-lsp)
(require 'init-racket)
(require 'init-frontend)
(require 'init-haskell)

(require 'init-elfeed)
(require 'init-spell)
(require 'init-misc)

;;; mode config
(use-package idris-mode
  :mode "\\.idr\\'")

(use-package rust-mode
  :mode "\\.rs\\'")

(use-package j-mode
  :bind (:map j-mode-map
         ("C-c C-z" . j-console))
  :config
  (setq j-console-cmd "jconsole")
  ;; FIXME: these faces need better customization
  (setq j-verb-face font-lock-function-name-face)
  (setq j-adverb-face font-lock-builtin-face)
  (setq j-conjunction-face font-lock-keyword-face)
  (setq j-other-face font-lock-constant-face))

(use-package markdown-mode
  :commands (markdown-mode gfm-mode)
  :mode (("README\\.md\\'" . gfm-mode)
         ("\\.md\\'" . markdown-mode)
         ("\\.markdown\\'" . markdown-mode)))

