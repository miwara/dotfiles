;; auto-complete
;; https://github.com/auto-complete/auto-complete


(use-package auto-complete-config
  :config
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
			     ac-source-files-in-current-dir
			     ac-source-dabbrev
			     ))

  (add-to-list 'ac-dictionary-directories "~/.emacs.d/elisp/auto-complete/dict")

  ;; C-n/C-pで候補選択可能
  (setq ac-use-menu-map t)

  (global-auto-complete-mode t)
  )
