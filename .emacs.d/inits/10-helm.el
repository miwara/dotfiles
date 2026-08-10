;; --- 10-helm.el (Completion UI: helm) ---

(use-package helm
  :ensure t
  :init
  (helm-mode t)
  :bind
  (("M-x"     . helm-M-x)
   ("C-x C-f" . helm-find-files)
   ("C-x b"   . helm-buffers-list)
   :map helm-map
   ("C-h" . delete-backward-char)
   ([?\t] . helm-execute-persistent-action)))
