;; flycheck
;; https://github.com/flycheck/flycheck

(add-hook 'after-init-hook #'global-flycheck-mode)

;; シンタックスチェックしないもの
(with-eval-after-load 'flycheck
  (setq-default flycheck-disabled-checkers '(emacs-lisp-checkdoc)))

(define-key global-map (kbd "C-c ! n") 'flycheck-next-error)
(define-key global-map (kbd "C-c ! p") 'flycheck-previous-error)
(define-key global-map (kbd "C-c ! l") 'flycheck-list-error)
