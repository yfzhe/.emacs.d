;;; init-desktop.el
;;; Use desktop.el to manage sessions

;;; Some references:
;;; - https://github.com/purcell/emacs.d/blob/master/lisp/init-sessions.el
;;; - https://www.emacswiki.org/emacs/desktop

(use-package desktop
  :hook (after-init . desktop-save-mode)
  :config
  (setq desktop-restore-frames nil) ; disable restoring frames when initing
  (let ((dir (expand-file-name "desktop" user-emacs-directory)))
    (setq desktop-dirname dir)
    (setq desktop-path (list dir)))
  (setq desktop-buffers-not-to-save "\\(magit\\|tide\\)"))

;;; use `eyebrowse' to control windows
(use-package eyebrowse
  :hook (after-init . eyebrowse-mode)
  :init
  (setq eyebrowse-keymap-prefix (kbd "C-c w")))

(provide 'init-desktop)
