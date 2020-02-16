;;; init-ivy.el
;;; Ivy, Counsel and Swiper

(use-package ivy
  :hook (after-init . ivy-mode)
  :init
  ;; (setq ivy-use-virtual-buffers t)
  (setq ivy-count-format "(%d/%d) ")
  (setq ivy-height 8))

(use-package counsel
  :hook (after-init . counsel-mode)
  :bind (("C-x C-r" . counsel-recentf)
         ("C-c u g" . counsel-git-grep)))

(use-package swiper
  :bind (("C-s" . swiper-isearch)
         ("C-r" . swiper-isearch-backward)
         ("s-f" . swiper)
         :map swiper-map
         ("M-s" . swiper-isearch-toggle)
         ("M-%" . swiper-query-replace)
         :map isearch-mode-map
         ("M-s" . swiper-isearch-toggle)))

(use-package ivy-hydra)

;;; better interface for ivy
(use-package ivy-rich
  :hook ((ivy-mode . ivy-rich-mode)))

;;; prettier ivy-rich
(use-package all-the-icons-ivy-rich
  :init (all-the-icons-ivy-rich-mode 1))

;;; another way to find files
;; (use-package ivy-explorer
;;   :after ivy
;;   :config (ivy-explorer-mode 1))

(provide 'init-ivy)
