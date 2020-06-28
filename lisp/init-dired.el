;;; init-dired.el
;;; Dired Mode

(use-package dired
  :ensure nil
  :bind ("C-x C-j" . dired-jump)
  :config
  (setq dired-recursive-deletes 'always)
  (setq dired-recursive-copies 'top)

  ;; sorting directories first
  ;; use GNU ls as `gls' from `coreutils' if available.
  ;; https://emacs.stackexchange.com/questions/29096/how-to-sort-directories-first-in-dired
  (let ((gls (executable-find "gls")))
    (if gls
        (progn
          (setq insert-directory-program gls)

          (setq ls-lisp-use-insert-directory-program t)
          (setq dired-listing-switches "-aBlh --group-directories-first"))
      ;; another way: use `ls-lisp'
      (progn
        (use-package ls-lisp
          :ensure nil
          :config
          (setq ls-lisp-use-insert-directory-program nil)
          (setq ls-lisp-dirs-first t)))))

  ;; reuse the only one buffer for dired mode
  ;; (put 'dired-find-alternate-file 'disabled nil)
  ;; (define-key dired-mode-map (kbd "RET") 'dired-find-alternate-file)
  )

(use-package dired-filter
  :after dired
  :bind (:map dired-mode-map
         ("C-c f" . dired-filter-mode)))

;; colorize dired-mode
(use-package diredfl
  :init (diredfl-global-mode 1))

(use-package wdired
  :after dired)

(use-package dired-subtree
  :after dired
  :bind (:map dired-mode-map
         ("<tab>" . dired-subtree-toggle)
         ("<backtab>" . dired-subtree-cycle)))

;; nest single files
;; (use-package dired-collapse
;;   :hook (dired-mode . dired-collapse-mode))

(use-package dired-git-info
  :after dired
  :bind (:map dired-mode-map
         (")" . dired-git-info-mode)))

(provide 'init-dired)
