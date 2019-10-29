;;; init-frontend.el
;;; For such many things in front-end development

;;; CSS
(use-package css-mode
  :init (setq css-indent-offset 2))

(use-package counsel-css
  :bind (:map css-mode-map
         ("C-c C-s" . counsel-css)))

;;; JS / JSX / TS
(use-package js2-mode
  ;; :mode "\\.json\\'"
  :config
  (setq-default js-indent-level 2)
  (setq-default js2-mode-show-parse-errors nil)
  (setq-default js2-mode-show-strict-warnings nil))

(use-package typescript-mode
  :mode "\\.ts\\'"
  :config
  (setq-default typescript-indent-level 2))

;; use rjsx-mode for jsx
;; (indentation in web-mode is too weird)
(use-package rjsx-mode
  :mode "\\.\\(js\\|jsx\\|tsx\\)\\'"
  :bind (:map rjsx-mode-map
         ("C-c M-r" . rjsx-rename-tag-at-point))
  :hook (rjsx-mode . tide-setup))

(use-package web-mode
  :hook (web-mode . tide-setup)
  :config
  (setq web-mode-markup-indent-offset 2)
  (setq web-mode-css-indent-offset 2)
  (setq web-mode-code-indent-offset 2))

(use-package tide
  :after (:all (:any typescript-mode rjsx-mode web-mode) company flycheck)
  :hook (((typescript-mode rjsx-mode web-mode) . tide-setup)
         ((typescript-mode rjsx-mode web-mode) . tide-hl-identifier-mode))
  :bind (:map tide-mode-map
         ("C-c C-d" . tide-documentation-at-point)
         ;; not sure whether this key is good
         ("C-c C-r" . tide-rename-symbol)
         ("C-c C-l" . tide-references))
  :config
  ;; TS format settings
  (setq tide-format-options
        (list :indentSize 2
              :tabSize 2
              :insertSpaceAfterFunctionKeywordForAnonymousFunctions t
              :placeOpenBraceOnNewLineForFunctions nil))

  ;; use both typescript typechecker and eslint as flycheck-checker
  (flycheck-add-next-checker 'typescript-tide 'javascript-eslint 'append)
  (flycheck-add-next-checker 'javascript-eslint 'jsx-tide 'append)
  (flycheck-add-next-checker 'javascript-eslint 'tsx-tide 'append)

  ;; the flycheck-er `tsx-tide` does not support `rjsx-mode',
  ;; so we have to make our one.
  (flycheck-define-generic-checker 'tsx-tide/rjsx-mode
    "A JSX syntax checker using tsserver, for `rjsx-mode'"
    :start #'tide-flycheck-start
    :verify #'tide-flycheck-verify
    :modes '(rjsx-mode)
    :predicate #'tide-flycheck-predicate)
  (add-to-list 'flycheck-checkers 'tsx-tide/rjsx-mode t)
  (flycheck-add-next-checker 'javascript-eslint 'tsx-tide/rjsx-mode 'append))

;; add node_modules into PATH, necessary for using eslint, etc.
(use-package add-node-modules-path
  :hook (js-mode js2-mode typescript-mode rjsx-mode web-mode))

;; prettier
(use-package prettier-js)

;;; use `eldoc-box' for `tide' displaying signature
(use-package eldoc-box
  :after eldoc
  :hook (((typescript-mode rjsx-mode web-mode) . eldoc-box-hover-mode)
         (eldoc-box-hover-mode . eldoc-box-hover-at-point-mode))
  :config
  (set-face-background 'eldoc-box-body "#343645")
  (setq eldoc-box-max-pixel-width 600))

(use-package yarn-mode
  :mode "\\^yarn\\.lock\\'")

(use-package elm-mode
  :mode "\\.elm\\'")

(provide 'init-frontend)
