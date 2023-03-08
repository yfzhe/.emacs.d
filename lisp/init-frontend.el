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

(defun grep-filename-as-component ()
  "Quickly grep filename as a component name,
`project-find-regexp' occurence of current filename as a component"
  (interactive)
  (let ((filename (file-name-base (buffer-file-name))))
    (project-find-regexp
     (concat "<" filename "\\b"))))

;;; --------------------------------------------------
;;; CSS
(use-package css-mode
  :ensure nil
  :hook (css-mode . lsp-deferred)
  :init (setq css-indent-offset 2))

(use-package counsel-css
  :bind (:map css-mode-map
         ("C-c C-s" . counsel-css)))

;;; --------------------------------------------------
;;; JS / JSX / TS
(use-package js-mode
  :ensure nil
  :mode "\\.\\(js\\|jsx\\|tsx\\)\\'"
  :hook ((js-mode . (lambda ()
                      (unbind-key "M-." js-mode-map)
                      (lsp-deferred))))
  :init
  (setq js-indent-level 2))

(use-package typescript-mode
  :mode "\\.ts\\'"
  :hook ((typescript-mode . lsp-deferred))
  :config
  (setq-default typescript-indent-level 2))

;;; --------------------------------------------------
;;; TS Language Server
(use-package tide
  :disabled
  :init
  (defun my-tide-setup ()
    (unless (and (boundp 'restclient-same-buffer-response-name)
                 (equal (buffer-name) restclient-same-buffer-response-name))
      (tide-setup)
      (tide-hl-identifier-mode 1)
      ;; use `eldoc-box' to get "modern-editor"-like experience
      (eldoc-box-hover-mode 1)))
  :hook (((js-mode typescript-mode) . my-tide-setup))
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
  (flycheck-add-next-checker 'typescript-tide 'javascript-eslint 'append)
  (flycheck-add-next-checker 'tsx-tide 'javascript-eslint 'append)
  (flycheck-add-next-checker 'javascript-eslint 'jsx-tide 'append))

;;; --------------------------------------------------
;;; Utility for front-end development
;; add node_modules into PATH, necessary for using eslint, etc.
(use-package add-node-modules-path
  :hook (((js-mode typescript-mode) . add-node-modules-path)))

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
