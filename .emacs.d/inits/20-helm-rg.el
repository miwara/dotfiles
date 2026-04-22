;; --- 20-helm-rg.el (Project Grep: helm-rg) ---

(unless (executable-find "rg")
  (message "[Warning] rg not found. Please install ripgrep."))

(use-package helm-rg
  :ensure t
  :bind
  ("C-c g" . helm-rg))
