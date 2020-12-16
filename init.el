;;; init.el  -*- lexical-binding: t -*-

;;; adjust gc threshold
(add-hook 'emacs-startup-hook
          (lambda ()
            (setq gc-cons-threshold (* 128 1024 1024))

            (add-function :after after-focus-change-function
              (lambda ()
                (unless (frame-focus-state)
                  (garbage-collect))))))

;;; package initialize
(require 'package)
(setq package-archives
      '(("gnu"   . "http://mirrors.tuna.tsinghua.edu.cn/elpa/gnu/")
        ("melpa" . "http://mirrors.tuna.tsinghua.edu.cn/elpa/melpa/")))
(package-initialize)

(eval-when-compile
  (add-to-list 'load-path (expand-file-name "lisp" user-emacs-directory))
  (add-to-list 'load-path (expand-file-name "site-lisp" user-emacs-directory)))

;;; setup use-package
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(eval-and-compile
  (setq use-package-always-ensure t))

(eval-when-compile
  (require 'use-package))

;;; custom.el
(setq custom-file (expand-file-name "custom.el" user-emacs-directory))
(load custom-file)

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
;; (require 'init-yasnippet)

(require 'init-prog)
(require 'init-lsp)
(require 'init-racket)
(require 'init-frontend)
(require 'init-rust)
(require 'init-apl-j)
(require 'init-haskell)

(require 'init-doc)
(require 'init-spell)
(require 'init-misc)
