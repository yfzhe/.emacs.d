;;; init-prog.el
;;; Packages about programming, and packages about languages

;;; eldoc-box: "modern" document (and type signatures) displaying
(use-package eldoc-box
  :after eldoc
  :hook (eldoc-box-hover-mode . eldoc-box-hover-at-point-mode)
  :config
  (set-face-background 'eldoc-box-body "#343645")
  (setq eldoc-box-max-pixel-width
        (let ((*box-width-base* 600))
          (pcase system-type
            ('windows-nt (* 2 *box-width-base*))
            ('darwin *box-width-base*)))))

;;; --------------------------------------------------
;;; mode config
(use-package elm-mode
  :hook ((elm-mode . lsp-deferred))
  :mode "\\.elm\\'"
  :custom (elm-indent-offset 2))

(use-package idris-mode
  :mode "\\.idr\\'")

(use-package yaml-mode
  :mode "\\.\\(yaml\\|yml\\)\\'")

;; although json is not a programming language,
;; we trivally need tools to read these terrible words
(use-package json-mode
  :mode "\\.json'")

;;; restclient: a "repl" for http requests
(use-package restclient
  :mode ("request\\'" . restclient-mode))

(use-package company-restclient
  :config
  (add-to-list 'company-backends 'company-restclient))

(provide 'init-prog)
