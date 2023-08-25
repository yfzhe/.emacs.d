;;; init-ui.el  -*- lexical-binding: t -*-

(require 'init-font)

(setq use-file-dialog nil)
(setq use-dialog-box nil)
(setq inhibit-splash-screen t)

(blink-cursor-mode -1)
(setq visible-bell 0)

(setq frame-title-format "%b - Emacs")

;; when frames are maximized, please spilt windows horizontally
(setq split-width-threshold 100)

(use-package time
  :ensure nil
  :hook (after-init . display-time-mode)
  :init
  (setq display-time-24hr-format t)
  (setq display-time-default-load-average nil))

;;; Fonts
(when (display-graphic-p)
  ;; set default font
  (set-face-attribute 'default nil
                      :family font-family
                      :height (* 10 font-size)
                      :weight 'semi-light)

  ;; CJK font
  (dolist (charset '(kana han cjk-misc bopomofo))
    (set-fontset-font t charset (font-spec :family font-cjk-family)))

  ;; symbol font (other unicode characters)
  (set-fontset-font t 'symbol (font-spec :family font-symbol-family) nil 'prepend)

  ;; display emojis
  (set-fontset-font t 'emoji (font-spec :family font-emoji-family) nil 'prepend))

;;; Modeline
(use-package doom-modeline
  :hook (after-init . doom-modeline-mode)
  :config
  (setq doom-modeline-buffer-file-name-style 'file-name)
  (setq doom-modeline-checker-simple-format nil)
  (setq doom-modeline-time-icon nil))

;;; theme
;; NOTE: some (not bad) themes
;; - doom-dracula (from `doom-themes')
;; - kaolin-ocean and kaolin-dark (from `kaolin-themes', support terminal)
;; - leuven (builtin)
;; - panda-theme
;; - twillight-bright-theme & twillight-anti-bright-theme

(cond
 ((display-graphic-p)
  (use-package doom-themes
    :config
    (load-theme 'doom-dracula t)
    (doom-themes-org-config)))
 (t ;; in terminal
  (use-package kaolin-themes
    :config
    (load-theme 'kaolin-ocean t))))

(provide 'init-ui)
