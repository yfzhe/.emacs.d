;;; init-font.el  -*- lexical-binding: t -*-

(require 'dash)
(require 'init-util)

(defun font-installed-p (font-name)
  (find-font (font-spec :name font-name)))

(defun from-fonts (&rest font-names)
  (-first #'font-installed-p font-names))

(defconst/os font-size
  :windows 11
  :macos 15)

;; Some good monospace fonts:
;;   SF Mono, IBM Plex Mono, Input Mono,
;;   Iosevka, Operator Mono, Computer Modern Textwriter
(defconst font-family
  (from-fonts "SF Mono" "IBM Plex Mono"))

(defconst font-sans-family
  (from-fonts "Helvetica Neue" "Arial"))

(defconst font-cjk-family
  (from-fonts "PingFang SC"
              "思源黑体" ; what's the hell!
              "Source Han Sans SC"))

(defconst font-symbol-family
  (from-fonts "Segoe UI Symbol" "Symbol" "Symbola"))

(defconst font-emoji-family
  (from-fonts "Segoe UI Emoji" "Apple Color Emoji"))

(provide 'init-font)
