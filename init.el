;; init.el
;; last update : 2014/07/13

;; ï∂éöÉRÅ[Éh
(setq default-buffer-file-coding-system 'utf-8)
(set-default-coding-systems 'utf-8)
(prefer-coding-system 'utf-8)

;; load-path
;; 
;; (add-to-list 'load-path "~/.emacs.d/elisp/")
;; (add-to-list 'load-path "~/.emacs.d/elisp/ddskk-15.1")
;; (add-to-list 'load-path "~/.emacs.d/elisp/yasnippet")
(defvar ac-dir (expand-file-name "~/.emacs.d/elisp/auto-complete"))
(add-to-list 'load-path ac-dir)
(add-to-list 'load-path (concat ac-dir "/lib/ert"))
(add-to-list 'load-path (concat ac-dir "/lib/fuzzy"))
(add-to-list 'load-path (concat ac-dir "/lib/popup"))
;; (add-to-list 'load-path "~/.emacs.d/elisp/multiple-cursors")

;; cask
(require 'cask "~/.cask/cask.el")
(cask-initialize)
(require 'pallet)

;; init-loader
(require 'init-loader)
(init-loader-load "~/.emacs.d/inits")
