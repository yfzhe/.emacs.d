;;; early-init.el

;; initial frame size
(add-to-list 'default-frame-alist '(width . 90))
(add-to-list 'default-frame-alist '(height . 36))

;; disable them to get faster setup time
(tool-bar-mode -1)
(scroll-bar-mode -1)

;; transparent background
;; (add-to-list 'default-frame-alist '(alpha . (95 . 0)))

;; titlebar background
(when (featurep 'ns)
  (add-to-list 'default-frame-alist '(ns-transparent-titlebar . t))
  (add-to-list 'default-frame-alist '(ns-appearance . dark)))
