;;; init-project.el

(use-package project
  :ensure nil
  :config
  (unbind-key "s" project-prefix-map)

  (if (executable-find "rg")
      (setq xref-search-program 'ripgrep)
    (message "can't find executable `ripgrep'")))

(provide 'init-project)
