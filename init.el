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
(use-package exec-path-from-shell
  :if (memq system-type '(darwin))
  :init (exec-path-from-shell-initialize))

(require 'init-base)
(require 'init-editing)
(require 'init-ui)

(require 'init-ivy)
(require 'init-desktop)
;; (require 'init-persp)

(require 'init-company)
(require 'init-dired)
(require 'init-git)
(require 'init-flycheck)
(require 'init-projectile)

(require 'init-dashboard)
(require 'init-eshell)
(require 'init-org)
(require 'init-treemacs)
(require 'init-yasnippet)

(require 'init-prog)
(require 'init-lsp)
(require 'init-racket)
(require 'init-frontend)
(require 'init-rust)
(require 'init-apl-j)
(require 'init-haskell)

(require 'init-doc)
(require 'init-elfeed)
(require 'init-spell)
(require 'init-misc)
