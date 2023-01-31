;;; init-ui.el  -*- lexical-binding: t -*-

(require 'init-font)

;;; Fonts
(when (display-graphic-p)
  ;; set default font
  (let ((font-string (concat font-family " " (number-to-string font-size))))
    (set-face-attribute 'default nil :font font-string :weight 'semi-light))

  ;; CJK font
  (dolist (charset '(kana han cjk-misc bopomofo))
    (set-fontset-font t charset font-cjk-family))
  (use-cjk-char-width-table 'zh_CN)

  ;; display emojis
  (when font-emoji-family
    (set-fontset-font t 'emoji font-emoji-family nil 'prepend)))

;;; Modeline
(setq display-time-24hr-format t)
(setq display-time-default-load-average nil)
(display-time-mode 1)

(use-package doom-modeline
  :hook (after-init . doom-modeline-mode)
  :config
  (setq doom-modeline-buffer-file-name-style 'file-name)
  (setq doom-modeline-checker-simple-format nil)
  (setq doom-modeline-time-icon nil))

;;; frame settings
;; frame title
(setq frame-title-format "%b - Emacs")

(setq use-file-dialog nil)
(setq use-dialog-box nil)
;; (setq inhibit-splash-screen 1)

;; when frames are maximized, please spilt windows horizontally
(setq split-width-threshold 100)

;;; theme
;; NOTE: some (not bad) themes
;; - doom-dracula (from `doom-themes')
;; - kaolin-ocean and kaolin-dark (from `kaolin-themes', support terminal)
;; - panda-theme
;; - twillight-bright-theme & twillight-anti-bright-theme
(use-package doom-themes)
(use-package kaolin-themes) ;; better in terminal

(unless (display-graphic-p)
  (load-theme 'kaolin-ocean))

;;; highlight cursor (disabled)
(use-package beacon
  :disabled t
  :init (setq beacon-color "#99d4e8")
  :hook (after-init . beacon-mode))

(provide 'init-ui)
