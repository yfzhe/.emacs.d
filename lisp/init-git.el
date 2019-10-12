;;; init-git.el

(use-package magit
  :bind (("C-x g" . magit-status)
         ("C-x M-g" . magit-dispatch)
         ("C-c M-g" . magit-file-popup))
  :config
  ;; if do not insert `(use-package magit-todos)` here,
  ;; it would open git-grep html manual on Windows
  (use-package magit-todos
    :hook (emacs-startup . magit-todos-mode)))

(use-package git-timemachine)

;; (use-package forge
;;  :after magit)

;; TODO: some useful packages about git
;; - smerge-mode
;; - diff-hl (conflict with flycheck)
;; - git-messenger

(use-package gitattributes-mode)
(use-package gitconfig-mode)
(use-package gitignore-mode)

(provide 'init-git)
