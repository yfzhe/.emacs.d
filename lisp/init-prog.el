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
(use-package idris-mode
  :mode "\\.idr\\'")

(use-package rust-mode
  :mode "\\.rs\\'")

(use-package yaml-mode
  :mode "\\.\\(yaml\\|yml\\)\\'")

;;; restclient: a "repl" for http requests
(use-package restclient
  :mode "^request\\'")

(use-package company-restclient
  :config
  (add-to-list 'company-backends 'company-restclient))

(provide 'init-prog)
