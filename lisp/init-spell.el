;;; init-spell.el
;;; Spell checking

;; some references:
;; - https://www.emacswiki.org/emacs/InteractiveSpell
;; - https://joelkuiper.eu/spellcheck_emacs
;; - https://github.com/redguardtoo/emacs.d/blob/master/lisp/init-spelling.el

(setq ispell-program-name "hunspell")
(setq ispell-local-dictionary "en_US")
(setq ispell-local-dictionary-alist
      '(("en_US" "[[:alpha:]]" "[^[:alpha:]]" "[']" nil ("-d" "en_US") nil utf-8)))
(setq ispell-hunspell-dictionary-alist ispell-local-dictionary-alist)

;; add hooks (flyspell-mode and flyspell-prog-mode)
(defvar text-modes-needing-flyspell
  '(text-mode-hook
    markdown-mode-hook
    git-commit-setup-hook))

(defvar prog-modes-needing-flyspell
  '(js-mode js2-mode rjxs-mode typescript-mode
    racket-mode))

(dolist (hook text-modes-needing-flyspell)
  (add-hook hook (lambda () (flyspell-mode 1))))
(dolist (hook prog-modes-needing-flyspell)
  (add-hook hook 'flyspell-prog-mode))

;; use package "flyspell-correct" for better correcting experience
(require 'flyspell-correct-ivy)
(setq flyspell-correct-interface #'flyspell-correct-ivy)
(define-key flyspell-mode-map (kbd "C-c c") #'flyspell-correct-wrapper)

(provide 'init-spell)
