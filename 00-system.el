;; Emacs system
;; last update : 2014/06/15

;; 簡略化
(defalias 'yes-or-no-p 'y-or-n-p)

;; タイムスタンプを記入する
(require 'time-stamp)
(add-hook 'before-save-hook 'time-stamp)
(setq time-stamp-active t)
(setq time-stamp-start "last update : ")
(setq time-stamp-format "%04y/%02m/%02d")
(setq time-stamp-end " \\|$")

;; 分割windwにしたときのカーソル移動設定(Ctrl-Shift-←，↓，↑，→)
(global-set-key (kbd "C-S-<left>") 'windmove-left)
(global-set-key (kbd "C-S-<right>") 'windmove-right)
(global-set-key (kbd "C-S-<up>") 'windmove-up)
(global-set-key (kbd "C-S-<down>") 'windmove-down)

;; C-; でリージョン選択した行をコメントアウト(コメントされている場合は復帰)
(global-set-key (kbd "C-c c") 'comment-or-uncomment-region)

;; 括弧の補完
(global-set-key (kbd "(") 'skeleton-pair-insert-maybe)
(global-set-key (kbd "{") 'skeleton-pair-insert-maybe)
(global-set-key (kbd "[") 'skeleton-pair-insert-maybe)
(global-set-key (kbd "\"") 'skeleton-pair-insert-maybe)
(setq skeleton-pair t)

;; カーソル位置はそのままでスクロール
(global-set-key (kbd "M-n") (lambda () (interactive) (scroll-up 1)))
(global-set-key (kbd "M-p") (lambda () (interactive) (scroll-up -1)))

;; ファイル内カーソル位置を記憶
(setq-default save-place t)
(require 'saveplace)
