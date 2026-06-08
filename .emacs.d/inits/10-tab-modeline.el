;; centaur-tabs
;; doom-modeline
;; https://github.com/ema2159/centaur-tabs
;; https://github.com/seagle0128/doom-modeline

;; centaur-tabs
(use-package centaur-tabs
  :ensure t
  :demand t
  :config
  (centaur-tabs-mode t)
  (setq centaur-tabs-buffer-groups-function (lambda () (list "All")))
  (dolist (buf '("*Messages*" "*scratch*" "*Completions*"
                 "*Warnings*" "*Backtrace*"
                 "*Async-native-comp-log*" "*Native-compile-Log*"
                 "*helm" " *helm"))
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

(defun +centaur-tabs/refresh-treemacs-a (&rest _)
  (when (fboundp 'treemacs-refresh)
    (treemacs-refresh)))

(with-eval-after-load 'centaur-tabs
  (unless (advice-member-p #'+centaur-tabs/refresh-treemacs-a #'centaur-tabs-forward)
    (advice-add #'centaur-tabs-forward :after #'+centaur-tabs/refresh-treemacs-a))
  (unless (advice-member-p #'+centaur-tabs/refresh-treemacs-a #'centaur-tabs-backward)
    (advice-add #'centaur-tabs-backward :after #'+centaur-tabs/refresh-treemacs-a)))

;; doom-modeline
(use-package doom-modeline
  :ensure t
  :hook (after-init . doom-modeline-mode)
  :custom
  (doom-modeline-height 25)
  (doom-modeline-icon t)
  (doom-modeline-major-mode-icon t)
  (doom-modeline-buffer-file-name-style 'truncate-upto-project))

;; よく使う関数名が長いので別名を設定
(with-eval-after-load 'centaur-tabs
  (alias-command-unless-defined
   'move-tab-left
   #'centaur-tabs-move-current-tab-to-left)

  (alias-command-unless-defined
   'move-tab-right
   #'centaur-tabs-move-current-tab-to-right)
  )
