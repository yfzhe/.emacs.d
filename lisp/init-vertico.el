;;; init-vertico.el

(setq completion-styles '(basic partial-completion substring))

(use-package vertico
  :hook ((after-init . vertico-mode)
         (vertico-mode . vertico-multiform-mode))
  :config
  (setq vertico-cycle t)

  (setq vertico-multiform-categories
        '((consult-grep buffer)
          (consult-xref buffer)))
  (setq vertico-multiform-commands '()))

(use-package consult
  :bind (([remap switch-to-buffer] . consult-buffer)
         ([remap switch-to-buffer-other-window] . consult-buffer-other-window)
         ([remap switch-to-buffer-other-frame] . consult-buffer-other-frame)
         ([remap project-switch-to-buffer] . consult-project-buffer)
         ([remap bookmark-jump] . consult-bookmark)
         ([remap recentf-open-files] . consult-recent-file)
         ([remap goto-line] . consult-goto-line))
  :init
  (setq xref-show-definitions-function #'consult-xref)
  (setq xref-show-xrefs-function #'consult-xref)
  :config
  (consult-customize
   consult-buffer consult-buffer-other-window consult-buffer-other-frame
   consult-project-buffer :preview-key nil))

(use-package embark
  :bind (("C-." . embark-act)
         ("C-h B" . embark-bindings)))

(use-package embark-consult
  :hook ((embark-collect-mode . consult-preview-at-point-mode)))

(use-package marginalia
  :hook ((after-init . marginalia-mode)))

(provide 'init-vertico)
