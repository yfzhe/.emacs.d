;;; init-util.el
;;; Make life easier

;; Quick Openning
(defun open-emacs-d ()
  (interactive)
  (find-file "~/.emacs.d/"))


;;; Need dictionary to save my poor english
(use-package youdao-dictionary
  :ensure t
  :bind (("C-c y" . youdao-dictionary-search-at-point)))

(provide 'init-util)
