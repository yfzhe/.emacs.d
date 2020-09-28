;;; init-flycheck.el
;;; Config on flycheck

(use-package flycheck
  :hook (prog-mode . flycheck-mode)
  :config
  (setq-default flycheck-disabled-checkers '(emacs-lisp-checkdoc))

  (setq flycheck-check-syntax-automatically '(save mode-enabled idle-change))
  (setq flycheck-idle-change-delay 3)

  (setq flycheck-indication-mode 'left-fringe)
  (when (fboundp 'define-fringe-bitmap)
    (define-fringe-bitmap 'flycheck-fringe-bitmap-double-arrow
      [48 56 60 62 60 56 48] nil nil 'center)))

(provide 'init-flycheck)
