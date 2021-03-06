;;; init-company.el
;;; Completaion and company-mode

;; no, please keep the origin case
;; (setq completion-ignore-case t)

(use-package company
  :diminish company-mode
  :hook (after-init . global-company-mode)
  :config
  (setq company-minimum-prefix-length 2)
  (setq company-idle-delay 0.1)
  (setq company-tooltip-align-annotations t))

;; (use-package company-box
;;   :hook (company-mode . company-box-mode))

;; (use-package company-emoji
;;   :after company
;;   :config
;;   (setq company-emoji-insert-unicode nil)
;;   (add-to-list 'company-backends 'company-emoji))

(provide 'init-company)
