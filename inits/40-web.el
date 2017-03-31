;; web mode

(require 'web-mode)

(add-to-list 'auto-mode-alist '("\\.tpl$" . web-mode))
(add-to-list 'auto-mode-alist '("\\.html?$" . web-mode))
(add-to-list 'auto-mode-alist '("\\.css$" . web-mode))

;; インデント数
(defun web-mode-hook ()
  "Hooks for web mode."
  (setq web-mode-markup-indent-offset 2)
  (setq web-mode-css-indent-offset  2))
(add-hook 'web-mode-hook 'web-mode-hook)
