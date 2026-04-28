;; --- 10-perspective.el (Workspace: perspective.el) ---

(use-package perspective
  :ensure t
  :custom
  (persp-mode-prefix-key (kbd "C-c w"))  ; プレフィックスキー
  :config
  (persp-mode)

  ;; 起動時にファイルが指定されている場合，現在のパースペクティブに確実に追加する
  (persp-add-buffer (current-buffer))

  ;; centaur-tabsを現在のワークスペースのバッファのみ表示するようにする（安全版）
  (with-eval-after-load 'centaur-tabs
    (setq centaur-tabs-buffer-list-function
          (lambda ()
            (condition-case nil
                (let ((persp-bufs (persp-current-buffers)))
                  (seq-filter
                   (lambda (b)
                     (and (buffer-live-p b)
                          (memq b persp-bufs)
                          ;; centaur-tabs-excluded-prefixesに含まれるバッファを除外する
                          (not (cl-some (lambda (prefix)
                                          (string-prefix-p prefix (buffer-name b)))
                                        centaur-tabs-excluded-prefixes))))
                   (buffer-list)))
              (error (buffer-list))))))

  ;; ワークスペース切り替え時にタブを更新
  (add-hook 'persp-switch-hook
            (lambda ()
              (when (fboundp 'centaur-tabs-buffer-update-groups)
                (centaur-tabs-buffer-update-groups))))

  ;; diredバッファを現在のワークスペースに自動追加する
  (add-hook 'dired-mode-hook
            (lambda ()
              (persp-add-buffer (current-buffer)))))
