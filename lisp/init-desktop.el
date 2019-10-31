;;; init-desktop.el
;;; Use desktop.el to manage sessions

;;; Some references:
;;; - https://github.com/purcell/emacs.d/blob/master/lisp/init-sessions.el
;;; - https://www.emacswiki.org/emacs/desktop

(use-package desktop
  :hook (kill-emacs . session-save)
  :config
  (defun session-save ()
    "A customized version of `desktop-save'"
    (interactive)
    (if (file-exists-p (expand-file-name desktop-base-file-name desktop-dirname))
        (when (yes-or-no-p "Exists a previous saved desktop session, overwrite it?")
          (desktop-save desktop-dirname))
      (desktop-save desktop-dirname)))

  (setq desktop-restore-frames nil) ; disable restoring frames when initing
  (let ((dir (expand-file-name "desktop" user-emacs-directory)))
    (setq desktop-dirname dir)
    (setq desktop-path (list dir)))
  (setq desktop-buffers-not-to-save "\\(magit\\|tide\\)"))

(provide 'init-desktop)
