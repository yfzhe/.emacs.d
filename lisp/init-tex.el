;;; init-tex.el

(use-package tex
  :ensure auctex
  :hook ((LaTeX-mode . turn-on-auto-fill)
         (LaTeX-mode . TeX-source-correlate-mode))
  :config
  (setq TeX-auto-save t)
  (setq TeX-parse-self t)
  (setq-default TeX-master nil)

  (setq TeX-engine 'xetex)
  (setq TeX-save-query nil)

  (when (eq system-type 'windows-nt)
    (if (executable-find "SumatraPDF")
        (add-to-list 'TeX-view-program-selection '(output-pdf "SumatraPDF"))
      (message "Warning: SumatraPDF is not found.")))

  (setq TeX-source-correlate-method 'synctex)
  (setq TeX-source-correlate-start-server t))

(use-package cdlatex
  :hook (LaTeX-mode . turn-on-cdlatex))

(provide 'init-tex)
