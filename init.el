;;; Package Initialize
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

;;; Mode Config
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
;;; Company mode
(global-company-mode)

;;; ----------------------------------------
;;; eldoc
;; (use-package eldoc-box
;;   :after eldoc
;;   :hook (((typescript-mode rjsx-mode) . eldoc-box-hover-mode)
;;          (eldoc-box-hover-mode . eldoc-box-hover-at-point-mode))
;;   :config
;;   (set-face-attribute 'eldoc-box-body nil :background "#343645")
;;   (setq eldoc-box-max-pixel-width 500))

