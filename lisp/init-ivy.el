;;; init-ivy.el
;;; Ivy, Counsel and Swiper

(use-package counsel
  :hook ((after-init . ivy-mode)
         (ivy-mode . counsel-mode))
  :bind (("C-s" . swiper-isearch)
         ("C-r" . swiper-isearch-backward)
         ("C-c s" . swiper)
         
         ("C-X C-r" . counsel-recentf))
  :init
  (setq ivy-use-virtual-buffer t)
  (setq ivy-count-format "(%d/%d) ")
  (setq ivy-height 6))

(provide 'init-ivy)
