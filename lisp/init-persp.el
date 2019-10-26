;;; init-persp.el  -*- lexical-binding: t -*-
;;; Use persp-mode to manage sessions

(use-package persp-mode
  :defines (recentf-exclude)
  :hook (after-init . persp-mode)
  :init
  (setq persp-keymap-prefix (kbd "C-c x"))
  (setq persp-nil-name "whatever")
  (setq persp-set-last-persp-for-new-frames nil)
  (setq persp-auto-resume-time 0) ; don't auto-resume
  (setq persp-common-buffer-filter-functions
        '((lambda (buffer)
            "Ignore temp buffers."
            (let ((name (buffer-name buffer)))
              (and (not (string-equal "*scratch*" name))
                   (string-prefix-p "*" name))))))

  :config
  (add-to-list 'recentf-exclude persp-save-dir)

  ;; integrate with ivy
  (with-eval-after-load 'ivy
    (add-to-list 'ivy-ignore-buffers
                 #'(lambda (b)
                     (when persp-mode
                       (let ((persp (get-current-persp)))
                         (if persp
                             (not (persp-contain-buffer-p b persp))
                           nil)))))))

;; TODO: integrate with projectile
;; TODO: integrate with ibuffer

(provide 'init-persp)
