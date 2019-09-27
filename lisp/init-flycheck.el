;;; init-flycheck.el
;;; Config on flycheck

(require 'flycheck)

(add-hook 'after-init-hook #'global-flycheck-mode)

(setq-default flycheck-disabled-checkers '(emacs-lisp-checkdoc))

;; only check while saving and opening files
;;(setq flycheck-check-syntax-automatically '(save mode-enabled))

(setq flycheck-indication-mode 'left-fringe)
(when (fboundp 'define-fringe-bitmap)
  (define-fringe-bitmap 'flycheck-fringe-bitmap-double-arrow
    ;; [16 48 112 240 112 48 16] ;; this is right fringe
    [48 56 60 62 60 56 48] nil nil 'center))

(provide 'init-flycheck)

