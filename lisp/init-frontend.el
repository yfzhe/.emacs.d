;;; init-frontend.el
;;; For such many things in front-end development

;;; --------------------------------------------------
;;; Some functions

(require 'dash)

(defun eslint-disable-error/flycheck ()
  "Disable eslint checking error(s) at position, by inserting
a \"// eslint-disable-next-line\" into the above line."
  (interactive)
  (let* ((pos (point))
         (errors
          (-filter (lambda (err)
                     (equal (flycheck-error-checker err)
                            'javascript-eslint))
                   (flycheck-overlay-errors-at pos))))
    (if (null errors)
        (message "Eslint complains nothing here!")
      (let* ((rules
              (-map (lambda (err)
                      (format "%s" (flycheck-error-id err)))
                    errors))
             (msg (concat "eslint-disable-next-line  "
                          (string-join rules ", ")
                          "\n")))
        (save-excursion
          (beginning-of-line)
          (insert msg)
          (forward-line -1)
          (comment-line 1)
          (indent-region (region-beginning) (region-end))
          (flycheck-buffer))))))

;;; quickly grep filename as component
(defun grep-filename-as-component ()
  "`projectile-grep' occurence of current filename as a component"
  (interactive)
  (let ((filename (file-name-base (buffer-file-name))))
    (projectile-grep
     (concat "<" filename "\\b"))))

;;; --------------------------------------------------
;;; CSS
(use-package css-mode
  :hook (css-mode . lsp-deferred)
  :init (setq css-indent-offset 2))

(use-package counsel-css
  :bind (:map css-mode-map
         ("C-c C-s" . counsel-css)))

;;; --------------------------------------------------
;;; JS / JSX / TS
(use-package js-mode
  :ensure nil
  :mode "\\.\\(js\\|jsx\\|tsx\\)\\'")

(use-package typescript-mode
  :mode "\\.ts\\'"
  :config
  (setq-default typescript-indent-level 2))

;; some "backup" modes:
(use-package js2-mode
  :config
  (setq-default js-indent-level 2)
  (setq-default js2-mode-show-parse-errors nil)
  (setq-default js2-mode-show-strict-warnings nil))

(use-package rjsx-mode)

(use-package web-mode
  :config
  (setq web-mode-markup-indent-offset 2)
  (setq web-mode-css-indent-offset 2)
  (setq web-mode-code-indent-offset 2))

;;; --------------------------------------------------
;;; TS Language Server
(use-package tide
  :hook (((js-mode typescript-mode) . tide-setup)
         (tide-mode . tide-hl-identifier-mode)
         ;; use `eldoc-box' to get "modern-editor"-like document experience
         (tide-mode . eldoc-box-hover-mode))
  :bind (:map tide-mode-map
         ("C-c C-d" . tide-documentation-at-point)
         ("C-c C-f" . tide-fix)
         ("C-c C-l" . tide-references)
         ("C-c C-r" . tide-rename-symbol)
         ("C-c d" . eslint-disable-error/flycheck))
  :config
  ;; make tide ignore case when completing
  (setq tide-completion-ignore-case t)
  ;; TS format settings
  (setq tide-format-options
        (list :indentSize 2
              :tabSize 2
              :insertSpaceAfterFunctionKeywordForAnonymousFunctions t
              :placeOpenBraceOnNewLineForFunctions nil))

  ;; use both typescript typechecker and eslint as flycheck-checker
  (flycheck-add-mode 'tsx-tide 'js-mode)
  (flycheck-add-mode 'tsx-tide 'rjsx-mode)
  (flycheck-add-next-checker 'typescript-tide 'javascript-eslint 'append)
  (flycheck-add-next-checker 'tsx-tide 'javascript-eslint 'append)
  (flycheck-add-next-checker 'javascript-eslint 'jsx-tide 'append))

;;; --------------------------------------------------
;;; Utility for front-end development
;; add node_modules into PATH, necessary for using eslint, etc.
(use-package add-node-modules-path
  :hook (js-mode js2-mode typescript-mode rjsx-mode web-mode))

;; prettier
(use-package prettier-js
  :after (:any js-mode typescript-mode)
  :bind (:map js-mode-map
         ("C-c C-p" . prettier-js)
         :map typescript-mode-map
         ("C-c C-p" . prettier-js)))

;; yarn.lock
(use-package yarn-mode
  :mode "\\^yarn\\.lock\\'")

(provide 'init-frontend)
