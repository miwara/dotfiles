;; JavaScript / TypeScript

(setq js-indent-level 2
      typescript-ts-mode-indent-offset 2)

(when (boundp 'treesit-extra-load-path)
  (add-to-list 'treesit-extra-load-path
               (expand-file-name "~/.config/emacs/.local/etc/tree-sitter")))

(if (fboundp 'tsx-ts-mode)
    (progn
      (add-to-list 'auto-mode-alist '("\\.jsx\\'" . tsx-ts-mode))
      (add-to-list 'auto-mode-alist '("\\.tsx\\'" . tsx-ts-mode)))
  (add-to-list 'auto-mode-alist '("\\.jsx\\'" . js-mode)))

(when (fboundp 'js-ts-mode)
  (add-to-list 'auto-mode-alist '("\\.[mc]?js\\'" . js-ts-mode)))
