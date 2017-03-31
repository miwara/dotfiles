;; js2 mode

(require 'js2-mode)

(add-hook 'js2-mode-hook
	  #'(lambda ()
	      (setq js2-basic-offset 2
		    indent-tabs-mode nil)
	      ))

(add-to-list 'auto-mode-alist '("\\.js$" . js2-mode))
(add-to-list 'auto-mode-alist '("\\.json$" . js2-mode))
(add-to-list 'auto-mode-alist '("\\.jsx$" . js2-mode))
