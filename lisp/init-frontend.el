;;; init-frontend.el
;;; For such many things in front-end development

(use-package js2-mode
  ;; :mode "\\.\\(js\\|json\\)\\'"
  :config
  (setq-default js-indent-level 2)
  (setq-default js2-mode-show-parse-errors nil)
  (setq-default js2-mode-show-strict-warnings nil))

(use-package typescript-mode
  :mode "\\.ts\\'"
  :config
  (setq-default typescript-indent-level 2))

(use-package rjsx-mode
  :mode "\\.\\(js\\|jsx\\|tsx\\)\\'")

(use-package tide
  :after (:all (:any typescript-mode rjsx-mode) company flycheck)
  :hook ((typescript-mode rjsx-mode) . tide-setup)
  :config
  (tide-hl-identifier-mode)
  (setq tide-format-options
        (list :indentSize 2
              :tabSize 2
              :insertSpaceAfterFunctionKeywordForAnonymousFunctions t
              :placeOpenBraceOnNewLineForFunctions nil)))

;; add node_modules into PATH, necessary for using eslint, etc.
(use-package add-node-modules-path
  :hook (js-mode js2-mode typescript-mode rjsx-mode))

;;; use `eldoc-box' for `tide' displaying signature
(use-package eldoc-box
  :after eldoc
  :hook (((typescript-mode rjsx-mode) . eldoc-box-hover-mode)
         (eldoc-box-hover-mode . eldoc-box-hover-at-point-mode))
  :config
  (set-face-attribute 'eldoc-box-body nil :background "#343645")
  (setq eldoc-box-max-pixel-width 560))

(use-package elm-mode
  :mode "\\.elm\\'")

(provide 'init-frontend)
