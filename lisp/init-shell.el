;;; init-shell.el

(when (memq window-system '(max ns x))
  (exec-path-from-shell-initialize))

(provide 'init-shell)
