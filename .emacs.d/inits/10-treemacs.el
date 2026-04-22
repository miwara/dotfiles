;; --- 10-treemacs.el (File Tree: neotree) ---

;; アイコン表示（要: nerd-fonts インストール済み）
(use-package nerd-icons
  :ensure t
  :config
  ;; Nerd Font が未インストールの場合は自動インストール
  (unless (cl-some (lambda (f) (string-match-p "Nerd Font" f)) (font-family-list))
    (nerd-icons-install-fonts t)))

(use-package neotree
  :ensure t
  :config
  (setq neo-theme 'nerd-icons)  ; アイコン表示
  (setq neo-window-width 25)
  (setq neo-show-hidden-files t)
  (setq neo-smart-open t)       ; 開いているファイルの git root を自動で表示
  :bind
  ("C-c e" . neotree-toggle))

;; 起動時に自動でファイルツリーを開き，メインウィンドウにフォーカスを戻す
(add-hook 'emacs-startup-hook
          (lambda ()
            (neotree-show)
            (other-window 1)))
