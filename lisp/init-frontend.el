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

;; it seems that tsx-tide is not supported in rjsx-mode,
;; so we have to use web-mode for jsx (and tsx)
(use-package web-mode
  :mode "\\.\\(js\\|jsx\\|tsx\\)\\'"
  :hook (web-mode . tide-setup)
  :config
  (setq web-mode-markup-indent-offset 2)
  (setq web-mode-css-indent-offset 2)
  (setq web-mode-code-indent-offset 2))

(use-package tide
  :after (:all (:any typescript-mode web-mode) company flycheck)
  :hook ((typescript-mode web-mode) . tide-setup)
  :config
  (tide-hl-identifier-mode)
  (flycheck-add-next-checker 'javascript-eslint 'jsx-tide 'append)
  (flycheck-add-next-checker 'javascript-eslint 'tsx-tide 'append)
  (setq tide-format-options
        (list :indentSize 2
              :tabSize 2
              :insertSpaceAfterFunctionKeywordForAnonymousFunctions t
              :placeOpenBraceOnNewLineForFunctions nil)))

;; add node_modules into PATH, necessary for using eslint, etc.
(use-package add-node-modules-path
  :hook (js-mode js2-mode typescript-mode web-mode))

;;; use `eldoc-box' for `tide' displaying signature
(use-package eldoc-box
  :after eldoc
  :hook (((typescript-mode web-mode) . eldoc-box-hover-mode)
         (eldoc-box-hover-mode . eldoc-box-hover-at-point-mode))
  :config
  (set-face-background 'eldoc-box-body "#343645")
  (setq eldoc-box-max-pixel-width 560))

(use-package elm-mode
  :mode "\\.elm\\'")

(provide 'init-frontend)
