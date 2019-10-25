;;; init-ivy.el
;;; Ivy, Counsel and Swiper

(use-package counsel
  :hook ((after-init . ivy-mode)
         (ivy-mode . counsel-mode))
  :bind (("C-s" . swiper-isearch)
         ("C-r" . swiper-isearch-backward)
         ("s-f" . swiper)
         
         ("C-X C-r" . counsel-recentf)
         
         :map swiper-map
         ("M-s" . swiper-isearch-toggle)
         ("M-%" . swiper-query-replace)
         :map isearch-mode-map
         ("M-s" . swiper-isearch-toggle))
  :init
  (setq ivy-use-virtual-buffer t)
  (setq ivy-count-format "(%d/%d) ")
  (setq ivy-height 8))

;;; another way to find files
;; (use-package ivy-explorer
;;   :after ivy
;;   :config (ivy-explorer-mode 1))

(provide 'init-ivy)
