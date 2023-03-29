;;; init-company.el
;;; completaion

(use-package company
  :hook (after-init . global-company-mode)
  :config
  (setq company-minimum-prefix-length 2)
  (setq company-idle-delay 0)
  (setq company-tooltip-align-annotations t)

  (setq company-dabbrev-downcase nil))

(provide 'init-company)
