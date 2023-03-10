;;; init-ivy.el
;;; Ivy, Counsel and Swiper

(use-package ivy
  :hook (after-init . ivy-mode)
  :init
  (setq ivy-count-format "(%d/%d) ")
  (setq ivy-height 8)

  (setq ivy-use-virtual-buffers t)

  ;; enable fuzzy matching
  ;; https://oremacs.com/2016/01/06/ivy-flx/
  ;; or, use `ivy-hydra' "C-o M" to toggle
  ;; (setq ivy-re-builders-alist
  ;;       '((swiper-isearch . ivy--regex-plus)
  ;;         (swiper . ivy--regex-plus)
  ;;         (t . ivy--regex-fuzzy)))
  )

(use-package counsel
  :hook (after-init . counsel-mode)
  :bind (("C-x C-r" . counsel-recentf)
         ("C-c u g" . counsel-git-grep)))

(use-package swiper
  :bind (("s-f" . swiper)
         :map swiper-map
         ("M-s" . swiper-isearch-toggle)
         ("M-%" . swiper-query-replace)
         :map isearch-mode-map
         ("M-s" . swiper-isearch-toggle)))

;; fuzzy matching
(use-package flx)

;;; better interface for ivy
(use-package ivy-rich
  :hook ((ivy-mode . ivy-rich-mode)))

;;; prettier ivy-rich
(use-package all-the-icons-ivy-rich
  :init (all-the-icons-ivy-rich-mode 1))

;;; a portal for tramp
(use-package counsel-tramp
  :after counsel)

(provide 'init-ivy)
