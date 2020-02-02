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
  :windows "Arial"
  :macos "Helvetica Neue")
;; NOTE: macOS's default sans font is "PingFang SC", actually

(defvar/os font-cjk-family
  :windows "思源黑体" ; what's the hell!
  :default "Source Han Sans SC")

(defvar/os font-emoji-family
  :windows "Segoe UI Emoji"
  :macos "Apple Color Emoji"
  :default nil)

(provide 'init-font)
