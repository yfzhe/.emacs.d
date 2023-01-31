;;; init-project.el

(use-package project
  :ensure nil
  :init
  ;; copy the code of `project-shell'
  (defun project-vterm ()
    (interactive)
    (let* ((default-directory (project-root (project-current t)))
           (default-project-shell-name (project-prefixed-buffer-name "vterm"))
           (shell-buffer (get-buffer default-project-shell-name)))
      (if (and shell-buffer (not current-prefix-arg))
          (pop-to-buffer-same-window shell-buffer)
        (shell (generate-new-buffer-name default-project-shell-name)))))
  :bind (:map project-prefix-map
         ("t" . project-vterm))
  :config
  (unbind-key "s" project-prefix-map))

(provide 'init-project)
