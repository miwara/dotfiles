;; Emacs common style

;; 画面設定
(custom-set-faces
  '(default ((t (:background "#000000" :foreground "#ffffff"))))
)

;; region の色設定
(setq transient-mark-mode t)
(set-face-foreground 'region' "#7f7f7f")
(set-face-background 'region' "#5fff87")

;; フレームの透明度
(set-frame-parameter (selected-frame) 'alpha '(0.75))

;; モードラインに時刻を表示
(display-time)

(global-hl-line-mode 1)
(set-face-background 'hl-line "#5f5fff")
(set-face-foreground 'highlight "#d0d0d0")

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
(set-face-foreground 'show-paren-match "#000000")
(set-face-background 'show-paren-match "#00cd00")
;; mismatch したときの設定
(set-face-foreground 'show-paren-mismatch "#000000")
(set-face-background 'show-paren-mismatch "#d70000")

;; 行末の空白を強調表示
(require 'whitespace)
(setq whitespace-style '(face
                         trailing
                         tabs
                         spaces
                         empty
                         space-mark
                         ))
; 全角スペースは□ (U+25A1)をで表示する
; タブのシンボルは設定しない（コピペが面倒になる）
(setq whitespace-display-mappings
      '((space-mark ?\u3000 [?\u25a1])))
; 可視化は全角スペースのみ
(setq whitespace-space-regexp "\\(\u3000+\\)")

(global-whitespace-mode 1)
; スペースの色設定
(set-face-attribute 'whitespace-trailing nil
                    :background "#ff00ff")
(set-face-attribute 'whitespace-tab nil
                    :background "#5c5cff")
(set-face-attribute 'whitespace-space nil
                    :foreground "#00ff00"
                    :weight 'bold)
(set-face-attribute 'whitespace-empty nil
                    :background "#00ffff")

;; タイトルバーにファイルのフルパス表示
(setq frame-title-format
      (format "%%f - Emacs@%s" (system-name)))

;; 環境によって設定を切り替え
(if (eq system-type 'cygwin)
    (load "~/dotfiles/inits/windowsstyle.el")
  (load "~/dotfiles/inits/linuxstyle.el")
  )
