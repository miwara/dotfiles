;; --- 20-fzf.el (Fuzzy Finder: fzf) ---

(unless (executable-find "fzf")
  (message "[Warning] fzf not found. Please install fzf."))

(use-package fzf
  :ensure t
  :bind
  ("C-c f" . fzf)
  ("C-c d" . fzf-directory))

;; --- dired (File Tree) ---

(use-package dired
  :ensure nil
  :custom
  (dired-listing-switches "-alh")
  (dired-kill-when-opening-new-dired-buffer t))
