;; GNU global
;; last update : 2013/07/01

(when (locate-library "gtags") (require 'gtags))
(global-set-key "\M-t" 'gtags-find-tag)	;関数の定義元へ
(global-set-key "\M-r" 'gtags-find-rtag) ;関数の参照元へ
(global-set-key "\M-s" 'gtags-find-symbol) ;変数の定義元/参照元へ
(global-set-key "\M-v" 'gtags-find-file)   ;ファイルにジャンプ
(global-set-key "\C-t" 'gtags-pop-stack)   ;前のバッファに戻る
(add-hook 'c-mode-common-hook
	  '(lambda ()
	     (gtags-mode 1)
	     (gtags-mode-complete-list)))


