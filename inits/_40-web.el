;; web mode

(use-package web-mode
  :defer t
  :mode (("\\.tpl\\'" . web-mode)
	 ("\\.html?\\'" . web-mode)
	 ("\\.css\\'" . web-mode))

  ;; インデント数
  :config
  (defun web-mode-hook ()
    "Hooks for web mode."
    (setq web-mode-markup-indent-offset 2)
    (setq web-mode-css-indent-offset  2))
  (add-hook 'web-mode-hook 'web-mode-hook)
  )
