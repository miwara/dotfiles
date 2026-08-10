;; Emacs system

;; 簡略化
(defalias 'yes-or-no-p 'y-or-n-p)

(setq read-file-name-completion-ignore-case t)
(setq completion-ignore-case t)

;; マウス操作を有効化（ターミナル）
(xterm-mouse-mode 1)

;; macOSのクリップボードとの連携（pbcopy/pbpasteを使用）
(when (and (eq system-type 'darwin) (not (display-graphic-p)))
  (defun copy-from-osx ()
    (shell-command-to-string "pbpaste"))
  (defun paste-to-osx (text &optional push)
    (let ((process-connection-type nil))
      (let ((proc (start-process "pbcopy" nil "pbcopy")))
        (process-send-string proc text)
        (process-send-eof proc))))
  (setq interprogram-cut-function 'paste-to-osx)
  (setq interprogram-paste-function 'copy-from-osx))

;; リージョンを選択した際に自動でクリップボードにコピー
(setq select-enable-clipboard t)

;; ターミナルでのブラケットペーストモードを有効化（インデント崩れ防止）
(unless (display-graphic-p)
  (when (fboundp 'xterm-paste-mode)
    (xterm-paste-mode 1)))

;; 分割windwにしたときのカーソル移動設定(Meta-←，↓，↑，→)
(global-set-key (kbd "<M-left>") 'windmove-left)
(global-set-key (kbd "<M-right>") 'windmove-right)
(global-set-key (kbd "<M-up>") 'windmove-up)
(global-set-key (kbd "<M-down>") 'windmove-down)

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
(setq-default save-place-mode t)

;; アイコン表示（要: nerd-fonts インストール済み）
(use-package nerd-icons
  :ensure t
  :config
  ;; Nerd Font が未インストールの場合は自動インストール
  (unless (cl-some (lambda (f) (string-match-p "Nerd Font" f)) (font-family-list))
    (nerd-icons-install-fonts t)))

(use-package uniquify
  :ensure nil
  :custom
  (uniquify-buffer-name-style 'post-forward-angle-brackets))

;; C-h をBackspaceにする
(global-set-key "\C-h" 'delete-backward-char)
(setq help-char nil
      help-event-list '(f1))

;; ファイル末尾に改行を加える
(setq require-final-newline t)

;; ビープ音の代わりに画面フラッシュ
(setq visible-bell t)

;; 1行ずつスクロール
(setq scroll-step 1)

;; 過去のマークを C-u C-SPC C-SPC... と C-SPC の連打でたどる
(setq set-mark-command-repeat-pop t)

;; Ctrl-Shift-k でカーソル位置から行頭まで削除
(defun backward-kill-line (arg)
  "Kill chars backward until encoutering the end of a line"
  (interactive "p")
  (kill-line 0))
(global-set-key (kbd "C-M-k") 'backward-kill-line)

;; フレームの透過を手動で切り替える
;; M-x toggle-opacity で切り替え
(defvar is-frame-opacity nil)
(defun toggle-opacity ()
  (interactive)
  (progn
    (if is-frame-opacity
	(set-face-background 'default "black")
      (set-face-background 'default "FF"))
    (setq is-frame-opacity (not is-frame-opacity)))
  )

;; バックスラッシュを打つ
;;(define-key global-map [?\M-¥] [?\\])
(define-key global-map [?¥] [?\\])

;; 変更の自動反映
(setq auto-revert-verbose nil
      global-auto-revert-non-file-buffers t)
;; バッファの自動再読み込み
(global-auto-revert-mode 1)

;; 画面分割のカーソル移動
(global-set-key (kbd "C-c h") #'window-left)
(global-set-key (kbd "C-c j") #'window-down)
(global-set-key (kbd "C-c k") #'window-up)
(global-set-key (kbd "C-c l") #'window-right)
