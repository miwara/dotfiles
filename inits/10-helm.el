;; helm

(use-package helm-config
  :init (helm-mode t)

  :bind (("M-x" . helm-M-x)
	 ("C-x C-f" . helm-find-files)
	 ("C-x C-r" . helm-recentf)
	 ("M-y" . helm-show-kill-ring)
	 ("C-x b" . helm-buffers-list)

	 ;; C-hで削除
	 :map helm-map
	 ("C-h" . delete-backward-char)
	 ([?\t] . helm-execute-persistent-action)
	 :map helm-find-files-map
	 ("C-h" . delete-backward-char)
  )

  :config
  ;; find-filesでタブを2回タイプするとバッファを開いてファイルの中身を見られるようにする
  (defadvice helm-ff-kill-or-find-buffer-fname (around execute-only-if-exist activate)
    "Execute command only of CANDIDATE exists"
    (when (file-exists-p candidate)
      ad-do-it))
)
