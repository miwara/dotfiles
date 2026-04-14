;; centaur-tabs
;; doom-modeline
;; https://github.com/ema2159/centaur-tabs
;; https://github.com/seagle0128/doom-modeline

(use-package nerd-icons
  :ensure t)

;; centaur-tabs
(use-package centaur-tabs
  :ensure t
  :demand t
  :config
  (centaur-tabs-mode t)
  (dolist (buf '("*Messages*" "*scratch*" "*Completions*"
                 "*Warnings*" "*Backtrace*"
                 "*Async-native-comp-log*" "*Native-compile-Log*"))
    (add-to-list 'centaur-tabs-excluded-prefixes buf))
  :custom
  ;; airline のように上部に表示
  (centaur-tabs-set-bar 'above)
  ;; モダンなスタイル
  (centaur-tabs-style "bar")
  ;; 高さを調整
  (centaur-tabs-height 32)
  ;; nerd-icons を使ってアイコン表示
  (centaur-tabs-set-icons t)
  ;; バッファのグループ化をオフにする（airline のように全バッファを並べる場合）
  ;; (centaur-tabs-set-close-button nil)
  (centaur-tabs-cycle-scope 'tabs)
  :bind
  ;; Vim のタブ切り替え（gT / gt）に近いイメージか，使いやすいキーを割り当て
  ;; ここでは C-c <left> / <right> に設定
  ("C-c <left>" . centaur-tabs-backward)
  ("C-c <right>" . centaur-tabs-forward))

;; doom-modeline
(use-package doom-modeline
  :ensure t
  :hook (after-init . doom-modeline-mode)
  :custom
  (doom-modeline-height 25)
  (doom-modeline-icon t)
  (doom-modeline-major-mode-icon t)
  (doom-modeline-buffer-file-name-style 'truncate-upto-project))
