;; doom-modeline
;; https://github.com/seagle0128/doom-modeline

(use-package nerd-icons
  :ensure t)

(use-package doom-modeline
  :ensure t
  :hook (after-init . doom-modeline-mode)
  :custom
  (doom-modeline-height 25)
  (doom-modeline-icon t)
  (doom-modeline-major-mode-icon t)
  (doom-modeline-buffer-file-name-style 'truncate-upto-project))
