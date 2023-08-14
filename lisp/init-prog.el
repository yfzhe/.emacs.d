;;; init-prog.el
;;; Packages about programming, and packages about languages

(use-package treesit
  :ensure nil
  :config
  (setq treesit-language-source-alist
        '((c "https://github.com/tree-sitter/tree-sitter-c")
          (cpp "https://github.com/tree-sitter/tree-sitter-cpp")
          (elisp "https://github.com/Wilfred/tree-sitter-elisp")
          (html "https://github.com/tree-sitter/tree-sitter-html")
          (css "https://github.com/tree-sitter/tree-sitter-css")
          (js . ("https://github.com/tree-sitter/tree-sitter-javascript"
                 "master" "src"))
          (typescript . ("https://github.com/tree-sitter/tree-sitter-typescript"
                         "master" "typescript/src"))
          (tsx . ("https://github.com/tree-sitter/tree-sitter-typescript"
                  "master" "tsx/src"))
          (common-lisp "https://github.com/theHamsta/tree-sitter-commonlisp")
          (csharp "https://github.com/tree-sitter/tree-sitter-c-sharp")
          (rust "https://github.com/tree-sitter/tree-sitter-rust")
          (make "https://github.com/alemuller/tree-sitter-make")
          (cmake "https://github.com/uyha/tree-sitter-cmake")
          (json "https://github.com/tree-sitter/tree-sitter-json")
          (toml "https://github.com/tree-sitter/tree-sitter-toml")
          (yaml "https://github.com/ikatyang/tree-sitter-yaml"))))

;;; languages
(use-package elm-mode
  :hook ((elm-mode . lsp-deferred))
  :mode "\\.elm\\'"
  :custom (elm-indent-offset 2))

(use-package idris-mode
  :mode "\\.idr\\'")

(use-package csharp-mode
  :ensure nil
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
