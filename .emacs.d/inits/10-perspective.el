;; --- 10-perspective.el (Workspace: perspective.el) ---

(use-package perspective
  :ensure t
  :custom
  (persp-mode-prefix-key (kbd "C-c w"))  ; プレフィックスキー
  :config
  (persp-mode)

  ;; 起動時にファイルが指定されている場合，現在のパースペクティブに確実に追加する
  (persp-add-buffer (current-buffer))

  ;; 新規ワークスペース作成時にneotreeを起動ディレクトリにリセットする
  (defvar +neotree/launch-directory default-directory)
  (add-hook 'persp-created-hook
            (lambda ()
              ;; run-at-time nil nil は idle 時に実行されるため，初期表示が乱れる原因になる
              ;; 必要最小限のタイミングで実行するように調整
              (when (neo-global--window-exists-p)
                (neotree-dir +neotree/launch-directory)
                (other-window 1))))

  ;; centaur-tabsを現在のワークスペースのバッファのみ表示するようにする
  (with-eval-after-load 'centaur-tabs
    (setq centaur-tabs-buffer-list-function
          (lambda ()
            (seq-filter
             (lambda (b)
               (and (memq b (persp-current-buffers))
                    ;; centaur-tabs-excluded-prefixesに含まれるバッファを除外する
                    (not (cl-some (lambda (prefix)
                                    (string-prefix-p prefix (buffer-name b)))
                                  centaur-tabs-excluded-prefixes))
                    (or (eq (current-buffer) b)
                        (buffer-file-name b)
                        (and (not (char-equal ?\  (aref (buffer-name b) 0)))
                             (buffer-live-p b)))))
             (buffer-list)))))

  ;; ワークスペース切り替え時にタブと保存済みのneotreeルートを復元する
  (add-hook 'persp-switch-hook
            (lambda ()
              (centaur-tabs-buffer-update-groups)
              (let ((saved-root (gethash (persp-name (persp-curr))
                                         +neotree/workspace-roots)))
                (save-selected-window
                  (if saved-root
                      (neotree-dir saved-root)
                    (+neotree/sync))))))

  ;; diredバッファを現在のワークスペースに自動追加する
  (add-hook 'dired-mode-hook
            (lambda ()
              (persp-add-buffer (current-buffer)))))
