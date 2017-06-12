;; markdown mode

(require 'markdown-mode)

(add-to-list 'auto-mode-alist '("\\.markdown$" . markdown-mode))

(add-to-list 'auto-mode-alist '("\\.md$" . gfm-mode))
(add-to-list 'auto-mode-alist '("README\\.md$" . gfm-mode))

;; https://github.com/sindresorhus/github-markdown-css
;; ↑ここからgithubに似たCSSをcloneしてきた
(setq markdown-command "pandoc -c ~/.pandoc/github-markdown/github-markdown.css")
