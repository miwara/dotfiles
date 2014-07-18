;; tabbar
;; last update : 2014/06/15
;; http://www.emacswiki.org/emacs/download/tabbar.el

(require 'tabbar)
(tabbar-mode)
(global-set-key [f4] 'tabbar-mode)

;; Google chrome のようなバインド
(global-set-key [(control tab)] 'tabbar-forward)
(global-set-key [(control shift tab)] 'tabbar-backward)

;; グループ化を使わない
(setq tabbar-buffer-groups-function nil)

;; ボタンを消す
(dolist (btn '(tabbar-buffer-home-button
	       tabbar-scroll-left-button
	       tabbar-scroll-right-button))
  (set btn (cons (cons "" nil)
		 (cons "" nil))))
