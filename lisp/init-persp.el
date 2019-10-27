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
  (setq persp-autokill-buffer-on-remove 'kill)
  (setq persp-common-buffer-filter-functions
        '((lambda (buffer)
            "Ignore temp buffers."
            (let ((name (buffer-name buffer)))
              (and (not (string-equal "*scratch*" name))
                   (string-prefix-p "*" name))))))

  :config
  (add-to-list 'recentf-exclude persp-save-dir)

  ;; integrate with ivy
  ;; (with-eval-after-load 'ivy
  ;;   (add-to-list 'ivy-ignore-buffers
  ;;                #'(lambda (b)
  ;;                    (when persp-mode
  ;;                      (not (persp-contain-buffer-p b (get-current-persp)))))))

  ;; (here was something that) integerate with ibuffer
  ;; see: https://gist.github.com/Bad-ptr/1aca1ec54c3bdb2ee80996eb2b68ad2d
  )

;; integrate with projectile
(use-package persp-mode-projectile-bridge
  :hook ((after-init . persp-mode-projectile-bridge-mode)
         (persp-mode-projectile-bridge-mode
          .
          (lambda ()
            (if persp-mode-projectile-bridge-mode
                (persp-mode-projectile-bridge-find-perspectives-for-all-buffers)
              (persp-mode-projectile-bridge-kill-perspectives))))))

(provide 'init-persp)
