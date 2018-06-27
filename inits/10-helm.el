;; helm

(use-package helm-config
  :init (helm-mode t)

  :bind (("M-x" . helm-M-x)
	 ("C-x C-f" . helm-find-files)
	 ("C-x C-r" . helm-recentf)
	 ("M-y" . helm-show-kill-ring)
	 ("C-x b" . helm-buffers-list))

  :config
  ;; C-hで削除
  (define-key helm-map (kbd "C-h") 'delete-backward-char)
  (define-key helm-find-files-map (kbd "C-h") 'delete-backward-char)

  ;; Tabで補完
  (define-key helm-find-files-map (kbd "TAB") 'helm-execute-persistent-action)
  (define-key helm-read-file-map (kbd "TAB") 'helm-execute-persistent-action)

  ;; find-filesでタブを2回タイプするとバッファを開いてファイルの中身を見られるようにする
  (defadvice helm-ff-kill-or-find-buffer-fname (around execute-only-if-exist activate)
    "Execute command only of CANDIDATE exists"
    (when (file-exists-p candidate)
      ad-do-it))
)
