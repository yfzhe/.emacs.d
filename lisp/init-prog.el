;;; init-prog.el
;;; Packages about programming, and packages about languages

;;; languages
(use-package elm-mode
  :hook ((elm-mode . lsp-deferred))
  :mode "\\.elm\\'"
  :custom (elm-indent-offset 2))

(use-package idris-mode
  :mode "\\.idr\\'")

(use-package csharp-mode
  :mode "\\.cs\\'"
  :hook ((csharp-mode . lsp-deferred))
  :config
  (setq lsp-csharp-server-path "/usr/local/bin/omnisharp"))

(use-package csproj-mode)

;; if not using lsp, use `omnisharp-emacs' instead
;; (use-package omnisharp
;;   :hook ((csharp-mode . omnisharp-mode)))

(use-package lsp-pyright
  :hook (python-mode . (lambda ()
                         (require 'lsp-pyright)
                         (lsp-deferred))))

(use-package dockerfile-mode
  :mode "Dockerfile\\'")

(use-package yaml-mode
  :mode "\\.\\(yaml\\|yml\\)\\'")

;; although json is not a programming language,
;; we trivally need tools to read these terrible words
(use-package json-mode
  :mode "\\.json'")

(use-package dotenv-mode
  :mode "\\.env\\b")

;;; --------------------------------------------------
;;; restclient: a playground for HTTP requests
(use-package restclient
  :hook (restclient-mode . display-line-numbers-mode))

(use-package company-restclient
  :after restclient
  :config
  (add-to-list 'company-backends 'company-restclient))

(provide 'init-prog)
