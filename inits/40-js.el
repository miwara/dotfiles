;; js2 mode

(require 'js2-mode)

(add-to-list 'auto-mode-alist '
	     ("\\.js$" . js2-mode)
	     ("\\.json$" . js2-mode)))
