;;; init-elfeed.el
;;; use emacs as rss reader

(use-package elfeed
  :bind (("C-c r" . elfeed))
  :config
  (setq elfeed-db-directory "~/.emacs.d/.elfeed")
  (setq-default elfeed-search-filter "@1-week-ago +unread"))

(use-package elfeed-org
  :config
  (setq rmh-elfeed-org-files '("~/.emacs.d/elfeed.org"))
  (elfeed-org))

(provide 'init-elfeed)
