;; magit
;; http://www.emacswiki.org/emacs/Magit

(use-package magit
  :ensure t
  :defer t
  :bind (("C-x g" . magit-status)))

(use-package git-commit
  :after magit)

(defun +magit/commit-message-clean-windows-h ()
  "Git commit message を開いたとき，前回の window 構成を捨てる．"
  (when (and buffer-file-name
             (string-match-p "COMMIT_EDITMSG\\'" buffer-file-name))
    (delete-other-windows)))

(defun +magit/rebase-todo-clean-windows-h ()
  "git rebase todo 編集時に，前回の diff window を捨てる．"
  (delete-other-windows))

(add-hook 'git-commit-setup-hook #'+magit/commit-message-clean-windows-h)
(add-hook 'git-rebase-mode-hook #'+magit/rebase-todo-clean-windows-h)
