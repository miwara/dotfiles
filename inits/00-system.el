;; Emacs system

;; 簡略化
(defalias 'yes-or-no-p 'y-or-n-p)

;; 分割windwにしたときのカーソル移動設定(Meta-←，↓，↑，→)
(global-set-key (kbd "ESC <left>") 'windmove-left)
(global-set-key (kbd "ESC <right>") 'windmove-right)
(global-set-key (kbd "ESC <up>") 'windmove-up)
(global-set-key (kbd "ESC <down>") 'windmove-down)

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

(require 'uniquify)
(setq uniquify-buffer-name-style 'post-forward-angle-brackets)

;; C-h をBackspaceにする
(global-set-key "\C-h" 'delete-backward-char)

;; ファイル末尾に改行を加える
(setq require-final-newline t)
