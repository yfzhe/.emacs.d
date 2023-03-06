;;; init-font.el  -*- lexical-binding: t -*-

(require 'init-util)

(defconst/os font-size
  :windows 11
  :macos 15)

;; Some good monospace fonts:
;;   SF Mono, IBM Plex Mono, Input Mono
;;   Iosevka, Operator Mono, Computer Modern Textwriter
(defconst font-family "SF Mono")

(defconst/os font-sans-family
  :windows "Arial"
  :macos "Helvetica Neue")
;; NOTE: macOS's default sans font is "PingFang SC", actually

(defconst/os font-cjk-family
  :windows "思源黑体" ; what's the hell!
  :macos "PingFang SC"
  :default "Source Han Sans SC")

(defconst/os font-symbol-family
  :windows "Segoe UI Symbol"
  :macos "Symbol")

(defconst/os font-emoji-family
  :windows "Segoe UI Emoji"
  :macos "Apple Color Emoji"
  :default nil)

(provide 'init-font)
