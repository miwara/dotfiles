;; linux style

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
