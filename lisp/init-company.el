;;; init-company.el
;;; completaion

(use-package company
  :diminish company-mode
  :hook (after-init . global-company-mode)
  :config
  (setq company-minimum-prefix-length 2)
  (setq company-idle-delay 0.1)
  (setq company-tooltip-align-annotations t)

  (setq company-dabbrev-downcase nil))

(provide 'init-company)
