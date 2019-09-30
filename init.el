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
(require 'init-dired)
(require 'init-flycheck)
(require 'init-projectile)

(require 'init-org)
(require 'init-shell)

(require 'init-lsp)
(require 'init-racket)
(require 'init-frontend)

(require 'init-spell)
(require 'init-util)

;;; Auto installing packages
(require 'use-package-ensure)
(setq use-package-always-ensure t)

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

;;; ----------------------------------------
;;; Magit
(use-package magit
  :bind (("C-x g" . magit-status)
         ("C-x M-g" . magit-dispatch)))

