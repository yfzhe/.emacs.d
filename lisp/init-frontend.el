;;; init-frontend.el
;;; For such many things in front-end development

(use-package js2-mode
  :mode "\\.\\(js\\|json\\)\\'"
  :config
  (setq-default js-indent-level 2)
  (setq-default js2-mode-show-parse-errors nil)
  (setq-default js2-mode-show-strict-warnings nil))

(use-package elm-mode
  :mode "\\.elm\\'")

(use-package typescript-mode
  :mode ("\\.ts\\'" "\\.tsx\\'"))

(use-package tide
  :after (typescript-mode company flycheck)
  :hook ((typescript-mode . tide-setup)
	 (typescript-mode . tide-hl-identifier-mode)
	 (before-save . tide-format-beforce-save)))

(provide 'init-frontend)
