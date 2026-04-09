;; markdown mode

(use-package markdown-mode
  :defer t

  ;; https://github.com/sindresorhus/github-markdown-css
  ;; ↑ここからgithubに似たCSSをcloneしてきた
  :init
  (setq markdown-command "pandoc -c ~/.pandoc/github-markdown/github-markdown.css")

  :mode (("\\.markdown\\'" . markdown-mode)
	 ("\\.md\\'" . gfm-mode)
	 ("README\\.md\\'" . gfm-mode))

  :bind(:map gfm-mode-map
	     ("M-p" . nil)
	     ("M-n" . nil)
	     ("M-\S-p" . markdown-previous-link)
	     ("M-\S-n" . markdown-next-link)
	     )
  )
