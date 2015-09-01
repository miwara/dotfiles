;; Emacs common style
;; last update : 2015/09/01

;; 初期フレームの設定
(setq default-frame-alist
      (append (list '(foreground-color . "white")
		    '(background-color . "black")
		    '(border-color . "black")
		    '(mouse-color . "white")
		    '(cursor-color . "blue")
		    '(width . 100)
		    '(height . 45)
		    '(top . 15)
		    '(left . 650)
		    )
	      default-frame-alist))

;; region の色設定
(setq transient-mark-mode t)
(set-face-foreground 'region' "brightblack")
(set-face-background 'region' "color-84")

;; フレームの透明度
(set-frame-parameter (selected-frame) 'alpha '(0.75))

;; モードラインに時刻を表示
(display-time)

(global-hl-line-mode 1)
(set-face-background 'hl-line "yellow")
(set-face-foreground 'highlight "black")

;; 行番号・桁番号の表示
(line-number-mode 1)
(column-number-mode 1)

;; ツールバー，スクロールバーの非表示
(when window-system
  (tool-bar-mode 0)
  (scroll-bar-mode 0)
)

;; 対応する括弧を強調表示
(show-paren-mode t)
; 色
(setq show-paren-style 'mixed)
;; match したときの設定
(set-face-foreground 'show-paren-match-face "black")
(set-face-background 'show-paren-match-face "green")
;; mismatch したときの設定
(set-face-foreground 'show-paren-mismatch-face "black")
(set-face-background 'show-paren-mismatch-face "light coral")

;; 行末の空白を強調表示
(setq-default show-trailing-whitespace t)
(set-face-background 'trailing-whitespace "peach puff")

;; タイトルバーにファイルのフルパス表示
(setq frame-title-format
      (format "%%f - Emacs@%s" (system-name)))

;; 1行ずつスクロール
(setq scroll-step 1)

;; 矩形選択
(cua-mode t)
(setq cua-enable-cua-key nil)

;; Ctrl-Shift-k でカーソル位置から行頭まで削除
(defun backward-kill-line (arg)
  "Kill chars backward until encoutering the end of a line"
  (interactive "p")
  (kill-line 0))
(global-set-key (kbd "C-S-k") 'backward-kill-line)

;; 指定行へ移動
(global-set-key (kbd "C-c l") 'goto-line)

;; 環境によって設定を切り替え
(if (eq system-type 'cygwin)
    (load "~/dotfiles/inits/windowsstyle.el")
  (load "~/dotfiles/inits/linuxstyle.el")
  )
