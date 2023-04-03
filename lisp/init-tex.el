;;; init-tex.el

(use-package tex
  :ensure auctex
  :hook ((LaTeX-mode . turn-on-auto-fill)
         (LaTeX-mode . TeX-source-correlate-mode))
  :config
  (setq TeX-auto-save t)
  (setq TeX-parse-self t)
  (setq-default TeX-master nil)

  (setq-default TeX-engine 'xetex)
  (setq TeX-save-query nil)

  (if (executable-find "SumatraPDF")
      (add-to-list 'TeX-view-program-selection '(output-pdf "SumatraPDF"))
    (message "Warning: SumatraPDF is not found."))

  (setq TeX-source-correlate-method 'synctex)
  (setq TeX-source-correlate-start-server t)

  (setq TeX-electric-math (cons "\\(" "\\)")))

(use-package cdlatex
  :hook (LaTeX-mode . turn-on-cdlatex)
  :config
  (setq cdlatex-paired-parens ""))

(provide 'init-tex)
