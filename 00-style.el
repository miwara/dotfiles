;; Emacs style
;; last update : 2014/06/15

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

;; フレームの透明度
(set-frame-parameter (selected-frame) 'alpha '(0.75))

;; font
;(add-to-list 'default-frame-alist '(font . "ricty-13.5"))
(set-face-attribute 'default nil
		    :family "Ricty Discord"
		    :height 135)
(set-fontset-font (frame-parameter nil 'font)
		  'japanese-jisx0208
		  (cons "Ricty Discord" "iso10646-1"))
(set-fontset-font (frame-parameter nil 'font)
		  'japanese-jisx0212
		  (cons "Ricty Discord" "iso10646-1"))
(set-fontset-font (frame-parameter nil 'font)
		  'katakana-jisx0201
		  (cons "Ricty Discord" "iso10646-1"))

; THE QUICK BROWN FOX JUMPS OVER LAZY DOG.
; the quick brown fox jumps over lazy dog. 0123456789

;; モードラインの背景，文字の色設定
(set-face-background 'modeline "OrangeRed3")
(set-face-foreground 'modeline "SeaGreen3")

;; モードラインに時刻を表示
(display-time)

;; 行番号・桁番号の表示
(line-number-mode 1)
(column-number-mode 1)

;; ツールバー，スクロールバーの非表示
(tool-bar-mode 0)
(scroll-bar-mode 0)

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
