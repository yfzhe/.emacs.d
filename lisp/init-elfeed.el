;;; init-elfeed.el
;;; use emacs as rss reader

(use-package elfeed
  :bind (("C-c f" . elfeed))
  :config
  (setq elfeed-db-directory (expand-file-name ".elfeed" user-emacs-directory))
  (setq elfeed-feeds
        '("http://planet.emacsen.org/atom.xml"
          "http://www.masteringemacs.org/feed/"
          "https://oremacs.com/atom.xml"
          "https://pinecast.com/feed/emacscast"
          "https://www.reddit.com/r/emacs.rss")))

(provide 'init-elfeed)
