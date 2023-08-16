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

;;; --------------------------------------------------
;;; JS / JSX / TS

(use-package typescript-ts-mode
  :ensure nil
  :mode "\\.ts\\'"
  :hook ((typescript-ts-mode . lsp-deferred))
  :init
  (setq typescript-ts-mode-indent-offset 2))

(use-package tsx-ts-mode
  :ensure nil
  :mode "\\.\\(js\\|jsx\\|tsx\\)\\'"
  :hook ((tsx-ts-mode . lsp-deferred)))

;; FIXME: only add eslint checker for JS/TS modes
(add-hook 'lsp-managed-mode-hook
          (lambda ()
            (flycheck-add-next-checker 'lsp 'javascript-eslint)))

;;; --------------------------------------------------
;;; Utility for front-end development
;; add node_modules into PATH, necessary for using eslint, etc.
(use-package add-node-modules-path
  :hook (((typescript-ts-mode tsx-ts-mode) . add-node-modules-path)))

(use-package prettier-js
  :after (:any typescript-ts-mode tsx-ts-mode)
  :bind (:map typescript-ts-mode-map
         ("C-c C-p" . prettier-js)
         :map tsx-ts-mode-map
         ("C-c C-p" . prettier-js)))

;; yarn.lock
(use-package yarn-mode
  :mode "\\^yarn\\.lock\\'")

(provide 'init-frontend)
