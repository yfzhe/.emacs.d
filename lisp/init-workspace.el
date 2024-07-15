;;; init-workspace.el
;;; Sometimes, human do things concurrently.

;; to replace `ibuffer'
(use-package bufler
  :bind (("C-x C-b" . bufler)))

;;; use `eyebrowse' to control windows
(use-package eyebrowse
  :hook (after-init . eyebrowse-mode)
  :init
  (setq eyebrowse-keymap-prefix (kbd "C-c w")))

(provide 'init-workspace)
