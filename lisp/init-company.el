;;; init-company.el
;;; Company Mode

(use-package company
  :diminish company-mode
  :hook (after-init . global-company-mode)
  ;; :bind (:map company-active-map
  ;;        ("<return>" . nil))
  :config
  (setq company-tooltip-align-annotations t))

;; (use-package company-box
;;   :hook (company-mode . company-box-mode))

(provide 'init-company)
