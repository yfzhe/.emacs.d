;;; init-doc.el

(use-package markdown-mode
  :commands (markdown-mode gfm-mode)
  :mode (("README\\.md\\'" . gfm-mode)
         ("\\.\\(md\\|mkd\\|markdown\\)\\'" . markdown-mode)))

(provide 'init-doc)
