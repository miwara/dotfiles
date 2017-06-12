;; markdown mode

;;(require 'markdown-mode)

;;(autoload 'markdown-mode "markdown-mode"
;;  "Major mode for editing Markdown files" t)
(add-to-list 'auto-mode-alist '("\\.markdown$" . markdown-mode))

;;(autoload 'gfm-mode "markdown-mode"
;;  "Major mode for editing GitHub Flavored Markdown files" t)
(add-to-list 'auto-mode-alist '("\\.md$" . gfm-mode))
(add-to-list 'auto-mode-alist '("README\\.md$" . gfm-mode))

;; https://github.com/sindresorhus/github-markdown-css
;; ↑ここからgithubに似たCSSをcloneしてきた
(setq markdown-command "pandoc -c ~/.pandoc/github-markdown/github-markdown.css")
