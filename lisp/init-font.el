;;; init-font.el  -*- lexical-binding: t -*-
;;; Font

(require 'init-util)

(defvar/os font-size
  :windows 11
  :macos 15)

;; other great monospace fonts:
;; SF Mono, IBM Plex Mono, Input Mono
;; Iosevka, Operator Mono, Computer Modern Textwriter
(defvar font-family "SF Mono")

(defvar/os font-sans-family
  :windows "思源黑体" ; what's the hell!
  :default "Source Han Sans SC")

(defvar font-cjk-family font-sans-family)

(defvar/os font-emoji-family
  :macos "Apple Color Emoji"
  :default nil)

(let ((font-string (concat font-family " " (number-to-string font-size))))
  (set-face-attribute 'default nil :font font-string :weight 'semi-light))

;; display emojis
(when font-emoji-family
  (set-fontset-font t 'unicode font-emoji-family nil 'prepend))

;; chinese font
(dolist (charset '(kana han cjk-misc bopomofo))
  (set-fontset-font t charset font-cjk-family))

(use-cjk-char-width-table 'zh_CN)

(provide 'init-font)
