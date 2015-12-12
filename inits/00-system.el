;; Emacs system

;; 簡略化
(defalias 'yes-or-no-p 'y-or-n-p)

;; 分割windwにしたときのカーソル移動設定(Meta-←，↓，↑，→)
(global-set-key (kbd "ESC <left>") 'windmove-left)
(global-set-key (kbd "ESC <right>") 'windmove-right)
(global-set-key (kbd "ESC <up>") 'windmove-up)
(global-set-key (kbd "ESC <down>") 'windmove-down)

;; 1. transient-mark-mode がオンでリージョンが有効のときに M-; すると、コメントアウト、もしくは解除のコマンドになる
;; 2. transient-mark-mode がオンでリージョンが有効のときに C-u 数値 M-; すると、コメント文字列を数値分にする(下に補足説明あり)
;; 3. 何もない行で M-; した場合、コメント文字列を挿入する
;; 4. 何か書かれている行で M-; した場合、行末にコメント文字列を挿入する
;; 5. コメント行で M-; した場合、コメント文までジャンプする
;; 6. コメント行で、引数を与えて M-; した場合(C-u M-; という感じ)、コメント行であれば削除する。
(global-set-key (kbd "C-c t") 'transient-mark-mode)

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

;; バッファの自動再読み込み
(global-auto-revert-mode t)
