;; --- 10-filetree.el (File Tree: neotree) ---

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
  ;; ルートパスの表示を ~ に省略する
  (advice-add 'neo-buffer--insert-root-entry :around
              (lambda (orig-fn node)
                (funcall orig-fn (abbreviate-file-name node))))
  :hook
  (focus-in . neotree-refresh)
  :bind
  ("C-c e" . neotree-toggle))

;; 起動時に自動でファイルツリーを開き，メインウィンドウにフォーカスを戻す
(add-hook 'emacs-startup-hook
          (lambda ()
            (when (display-graphic-p)
              (neotree-show)
              (other-window 1))))

;; ワークスペースごとのneotreeルートを保存するテーブル
(defvar +neotree/workspace-roots (make-hash-table :test 'equal))

;; ファイル/ディレクトリを開いたとき，git管理下なら.gitのあるフォルダを，それ以外はその場所を表示する
;; 更新後はそのワークスペースのルートとして記憶する
(defun +neotree/sync ()
  "現在のバッファに合わせてneotreeを更新し，ワークスペースのルートとして保存する．"
  ;; Git の一時ファイル（コミット，マージ，リベースなど）は同期から除外する
  (unless (and buffer-file-name
               (string-match-p "\\(COMMIT_EDITMSG\\|MERGE_MSG\\|SQUASH_MSG\\|git-rebase-todo\\)"
                               buffer-file-name))
    (when (neo-global--window-exists-p)
      (save-selected-window
        (let* ((path (or buffer-file-name
                         (and (eq major-mode 'dired-mode) default-directory)))
               (git-root (when path (locate-dominating-file path ".git"))))
          (when path
            (neotree-find path (when git-root (expand-file-name git-root)))
            ;; 更新後のルートをワークスペース名をキーに保存
            (with-current-buffer (neo-global--get-buffer)
              (puthash (persp-name (persp-curr))
                       neo-buffer--start-node
                       +neotree/workspace-roots))))))))

(add-hook 'find-file-hook #'+neotree/sync)
;; diredを開いたとき・dired内でディレクトリを移動したときにneotreeを更新する
(add-hook 'dired-mode-hook #'+neotree/sync)
(add-hook 'dired-after-readin-hook #'+neotree/sync)
