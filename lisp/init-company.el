;;; init-company.el
;;; Company Mode

(use-package company
  :diminish company-mode
  :hook (after-init . global-company-mode)
  :config
  (setq company-minimum-prefix-length 1)
  (setq company-idle-delay 0.1)
  (setq company-tooltip-align-annotations t))

;; (use-package company-box
;;   :hook (company-mode . company-box-mode))

(provide 'init-company)
