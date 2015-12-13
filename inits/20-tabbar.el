;; tabbar
;; http://www.emacswiki.org/emacs/download/tabbar.el

(require 'tabbar)
(tabbar-mode)
(global-set-key [f4] 'tabbar-mode)

;; Google chrome のようなバインド
(global-set-key (kbd "M-]") 'tabbar-forward)
(global-set-key (kbd "M-[") 'tabbar-backward)

;; グループ化を使わない
(setq tabbar-buffer-groups-function nil)

;; ボタンを消す
(dolist (btn '(tabbar-buffer-home-button
	       tabbar-scroll-left-button
	       tabbar-scroll-right-button))
  (set btn (cons (cons "" nil)
		 (cons "" nil))))

;; 色設定
(set-face-attribute ; バー自体の色
 'tabbar-default nil
 :background "#e5e5e5"
 :family "Inconsolata"
 :height 1.0
)
(set-face-attribute ; アクティブなタブ
 'tabbar-selected nil
 :background "#000000"
 :foreground "#e5e5e5"
 :weight 'bold
 :box nil
)
(set-face-attribute ; 非アクティブなタブ
 'tabbar-unselected nil
 :background "#e5e5e5"
 :foreground "#000000"
 :box nil
)
