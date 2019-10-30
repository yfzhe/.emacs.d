;;; init-desktop.el
;;; Use desktop.el to manage sessions

;;; Some references:
;;; - https://github.com/purcell/emacs.d/blob/master/lisp/init-sessions.el
;;; - https://www.emacswiki.org/emacs/desktop

(use-package desktop
  :config
  (desktop-save-mode 1)

  (setq desktop-restore-frames nil) ; disable restoring frames when initing
  (setq desktop-path
        (list (expand-file-name "desktop" user-emacs-directory)))
  (setq desktop-buffers-not-to-save "\\(magit\\)"))

(provide 'init-desktop)
