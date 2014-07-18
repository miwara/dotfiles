;; Input Method
;; last update : 2014/06/15
;; http://openlab.ring.gr.jp/skk/ddskk-ja.html

;; ddskk
(require 'skk-autoloads)
(global-set-key "\C-x\C-j" 'skk-mode)
(global-set-key "\C-xj" 'skk-auto-fill-mode)
;(global-set-key "\C-xt" 'skk-tutorial)

(setq skk-large-jisyo "~/.emacs.d/elisp/ddskk-15.1/dic/SKK-JISYO.L")

; imput method をskkにする
(setq default-input-method "japanese-skk")

; 句読点を英語表記にする
(setq-default skk-kutouten-type 'en)
