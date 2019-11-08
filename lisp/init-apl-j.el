;;; init-apl-j.el
;;; APL and J: the legacy of unreadable symbols and arrays

(use-package j-mode
  :bind (:map j-mode-map
         ("C-c C-z" . j-console))
  :config
  (setq j-console-cmd "jconsole")
  ;; FIXME: these faces need better customization
  (setq j-verb-face font-lock-function-name-face)
  (setq j-adverb-face font-lock-builtin-face)
  (setq j-conjunction-face font-lock-keyword-face)
  (setq j-other-face font-lock-constant-face))

(provide 'init-apl-j)
