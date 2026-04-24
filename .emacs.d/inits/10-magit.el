;; magit
;; http://www.emacswiki.org/emacs/Magit

(use-package magit
  :ensure t
  :defer t
  :bind (("C-x g" . magit-status)))

(use-package git-commit
  :after magit)
