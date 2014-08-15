;; debug
;; last update : 2013/06/26

;; 有用なバッファを開くモード
(setq gdb-many-windows t)

;; 変数の上にマウスカーソルを置くと値を表示
(add-hook 'gdb-mode-hook '(lambda () (gud-tooltip-mode t)))

;; I/O バッファを表示
(setq gdb-use-separate-io-buffer t)

;; t にすると mini buffer に値が表示される
(setq gud-tooltip-echo-area nil)
