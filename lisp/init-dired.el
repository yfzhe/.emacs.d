;;; init-dired.el
;;; Dired Mode

(use-package dired
  :commands (dired-jump)
  :bind ("C-C C-j" . dired-jump)
  :config
  (setq dired-recursive-deletes 'always)
  (setq dired-recursive-copies 'top)

  ;; sorting directories first
  ;; macOS: use GNU ls as `gls' from `coreutils' if available.
  ;; https://emacs.stackexchange.com/questions/29096/how-to-sort-directories-first-in-dired
  (when (eq system-type 'darwin)
    (let ((gls (executable-find "gls")))
      (when gls 
	(setq insert-directory-program gls)))

    (setq ls-lisp-use-insert-directory-program t)
    (setq dired-listing-switches "-aBlh --group-directories-first"))

  ;; or use `ls-lisp'
  ;; (use-package ls-lisp
  ;;   :config
  ;;   (setq ls-lisp-use-insert-directory-program nil)
  ;;   (setq ls-lisp-dirs-first t))

  ;; colorize dired-mode
  (use-package diredfl
    :init (diredfl-global-mode 1))

  (use-package wdired
    :bind (:map dired-mode-map
		("C-c C-w" . wdired-change-to-wdired-mode)))

  ;; Reuse the only one buffer for dired mode
  ;; (put 'dired-find-alternate-file 'disabled nil)
  ;; (with-eval-after-load 'dired
  ;;   (define-key dired-mode-map (kbd "RET") 'dired-find-alternate-file))
  )

(provide 'init-dired)
