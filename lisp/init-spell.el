;;; init-spell.el
;;; Spell checking

;; some references:
;; - https://www.emacswiki.org/emacs/InteractiveSpell
;; - https://joelkuiper.eu/spellcheck_emacs
;; - https://github.com/redguardtoo/emacs.d/blob/master/lisp/init-spelling.el

(use-package flyspell
  :if (executable-find "hunspell")
  :hook (((text-mode org-mode markdown-mode git-commit-setup) . flyspell-mode)
         ((js-mode js2-mode rjxs-mode typescript-mode) . flyspell-prog-mode))
  :config
  (setq ispell-program-name "hunspell")
  (setq ispell-local-dictionary "en_US")
  (setq ispell-local-dictionary-alist
        '(("en_US" "[[:alpha:]]" "[^[:alpha:]]" "[']" nil ("-d" "en_US") nil utf-8)))
  (setq ispell-hunspell-dictionary-alist ispell-local-dictionary-alist))

;; for better correcting experience
(use-package flyspell-correct-ivy
  :bind (;;:map flyspell-mode
         ("C-c c" .  flyspell-correct-wrapper))
  :init
  (setq flyspell-correct-interface #'flyspell-correct-ivy))

(provide 'init-spell)
