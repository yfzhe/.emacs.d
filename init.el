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

(require 'init-base)
(require 'init-custom)

(require 'init-editing)
(require 'init-dired)
(require 'init-flycheck)
(require 'init-projectile)

(require 'init-org)
(require 'init-shell)

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
  :ensure t
  :commands (markdown-mode gfm-mode)
  :mode (("README\\.md\\'" . gfm-mode)
         ("\\.md\\'" . markdown-mode)
         ("\\.markdown\\'" . markdown-mode)))

;;; ----------------------------------------
;;; Company mode
(global-company-mode)

;;; Ivy
(use-package ivy
  :hook (after-init . ivy-mode)
  :config
  (setq ivy-use-virtual-buffer t)
  (setq ivy-count-format "(%d/%d) ")
  (setq ivy-height 6)
  :bind (("C-s" . swiper-isearch)
         ("C-r" . swiper-isearch-backward)))

;;; ----------------------------------------
;;; Magit
(use-package magit
  :bind (("C-x g" . magit-status)
         ("C-x M-g" . magit-dispatch)))

;;; ----------------------------------------
;;; eldoc
;; (use-package eldoc-box
;;   :after eldoc
;;   :hook ((eldoc-mode . eldoc-box-hover-mode)
;;          (eldoc-box-hover-mode . eldoc-box-hover-at-point-mode)))

