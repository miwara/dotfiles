;; init.el

;; •¶šƒR[ƒh
(setq default-buffer-file-coding-system 'utf-8)
(set-default-coding-systems 'utf-8)
(prefer-coding-system 'utf-8)

;; load-path
;; 
;; (add-to-list 'load-path "~/.emacs.d/elisp/")

;; cask
(require 'cask "~/.cask/cask.el")
(cask-initialize)
(require 'pallet)

;; init-loader
(require 'init-loader)
(init-loader-load "~/dotfiles/inits")
