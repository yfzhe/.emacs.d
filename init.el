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
      '(("gnu"    . "http://mirrors.tuna.tsinghua.edu.cn/elpa/gnu/")
        ("nongnu" . "http://mirrors.tuna.tsinghua.edu.cn/elpa/nongnu/")
        ("melpa"  . "http://mirrors.tuna.tsinghua.edu.cn/elpa/melpa/")))
(package-initialize)

(add-to-list 'load-path (expand-file-name "lisp" user-emacs-directory))
(add-to-list 'load-path (expand-file-name "site-lisp" user-emacs-directory))

(setq custom-file (expand-file-name "custom.el" user-emacs-directory))
(when (file-exists-p custom-file)
  (load custom-file))

;;; setup use-package
(eval-and-compile
  (setq use-package-always-ensure t))

(eval-when-compile
  (require 'use-package))

;;; some third-party packages
(use-package dash)

(require 'init-base)
(require 'init-ui)

(require 'init-edit)
(require 'init-company)
;; (require 'init-ivy)
(require 'init-vertico)

(require 'init-git)
(require 'init-shell)

(require 'init-dired)
(require 'init-flycheck)
(require 'init-project)

(require 'init-dashboard)
(require 'init-desktop)
;; (require 'init-persp)

(require 'init-org)
(require 'init-tex)
(require 'init-biblio)
(require 'init-note)
(require 'init-doc)

(require 'init-prog)
(require 'init-lsp)
(require 'init-racket)
(require 'init-frontend)
(require 'init-rust)
(require 'init-apl-j)
(require 'init-haskell)

(require 'init-spell)
(require 'init-misc)
