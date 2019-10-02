;;; init-font.el
;;; Font

;; other great monospave fonts: Operator Mono, Input Mono, IBM Plex Mono
(defvar font-family "Iosevka")

(defvar font-size
  (pcase system-type
    ('windows-nt 11)
    ('darwin 15)))

(defvar font-string (concat font-family " " (number-to-string font-size)))
(set-face-attribute 'default nil :font font-string)

(dolist (charset '(kana han cjk-misc bopomofo))
  (set-fontset-font (frame-parameter nil 'font)
		    charset
		    (font-spec :family "Source Han Sans SC")))

(use-cjk-char-width-table 'zh_CN)

;; (set-fontset-font t 'unicode "Apple Color Emoji" nil 'prepend)

(provide 'init-font)
