;;; init-desktop.el
;;; Use desktop.el to manage sessions

;;; Some references:
;;; - https://github.com/purcell/emacs.d/blob/master/lisp/init-sessions.el
;;; - https://www.emacswiki.org/emacs/desktop

(use-package desktop
  :ensure nil
  :config
  (setq desktop-restore-frames nil) ; disable restoring frames when initing
  (let ((dir (expand-file-name "desktop" user-emacs-directory)))
    (setq desktop-dirname dir)
    (setq desktop-path (list dir)))
  (setq desktop-buffers-not-to-save "\\(magit\\)"))

(provide 'init-desktop)
