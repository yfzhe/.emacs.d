;;; Font
;; Avilable fonts:  Operator Mono, Input Mono, IBM Plex Mono
(set-face-attribute 'default nil :font "Iosevka 15")
(dolist (charset '(kana han cjk-misc bopomofo))
  (set-fontset-font (frame-parameter nil 'font)
		    charset
		    (font-spec :family "Source Han Sans SC")))

(use-cjk-char-width-table 'zh_CN)

;; (set-fontset-font t 'unicode "Apple Color Emoji" nil 'prepend)

(provide 'init-font)
