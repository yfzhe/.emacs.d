;;; init-frontend.el
;;; For such many things in front-end development

(use-package js2-mode
  :mode "\\.\\(js\\|json\\)\\'"
  :config
  (setq-default js-indent-level 2)
  (setq-default js2-mode-show-parse-errors nil)
  (setq-default js2-mode-show-strict-warnings nil))


(use-package typescript-mode
  :mode ("\\.ts\\'" "\\.tsx\\'")
  :config
  (setq-default typescript-indent-level 2))

(use-package tide
  :after (typescript-mode company flycheck)
  :hook ((typescript-mode . tide-setup)
	 (typescript-mode . tide-hl-identifier-mode)
	 (before-save . tide-format-beforce-save))
  :config
  (setq company-tooltip-align-annotations t)
  (setq tide-format-options
	(list :indentSize 2
	      :tabSize 2
	      :insertSpaceAfterFunctionKeywordForAnonymousFunctions t
	      :placeOpenBraceOnNewLineForFunctions nil)))

(use-package elm-mode
  :mode "\\.elm\\'")

(provide 'init-frontend)
