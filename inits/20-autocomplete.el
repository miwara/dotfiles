;; auto-complete
;; last update : 2014/07/13
;; https://github.com/auto-complete/auto-complete


(require 'auto-complete-config)
(require 'ac-dabbrev)

;; ベースとなるソースの指定
(setq-default ac-sources '(
			ac-source-abbrev
			ac-source-dictionary
			ac-source-words-in-same-mode-buffers
			ac-source-yasnippet
			ac-source-variables
			ac-source-symbols
			ac-source-gtags
			ac-source-features
			;; ac-source-filename
			;; ac-source-function
			ac-source-files-in-current-dir
			ac-source-dabbrev
			))

;; (ac-config-default)

(add-to-list 'ac-dictionary-directories "~/.emacs.d/elisp/auto-complete/dict")

(setq ac-use-menu-map t)		;C-n/C-pで候補選択可能

(global-auto-complete-mode t)
