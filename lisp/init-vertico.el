;;; init-vertico.el

(use-package vertico
  :hook ((after-init . vertico-mode)
         (vertico-mode . vertico-multiform-mode))
  :config
  (setq vertico-cycle t)

  (setq vertico-multiform-categories
        '((consult-grep buffer)
          (consult-xref buffer)))
  (setq vertico-multiform-commands '()))

(use-package orderless
  :init
  (setq completion-styles '(orderless basic))
  (setq orderless-matching-styles '(orderless-regexp
                                    orderless-literal
                                    orderless-prefixes)))

(use-package consult
  :bind (([remap recentf-open-files] . consult-recent-file)
         ([remap goto-line] . consult-goto-line))
  :init
  (setq xref-show-definitions-function #'consult-xref)
  (setq xref-show-xrefs-function #'consult-xref))

(use-package embark
  :bind (("C-." . embark-act)
         ("C-h B" . embark-bindings)))

(use-package embark-consult
  :hook ((embark-collect-mode . consult-preview-at-point-mode)))

(use-package marginalia
  :hook ((after-init . marginalia-mode)))

(provide 'init-vertico)
