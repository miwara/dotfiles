;; js2 mode

(use-package js2-mode
  :defer t
  :mode (("\\.js\\'" . js2-mode)
	 ("\\.json\\'" . js2-mode)
	 ("\\.jsx\\'" . js2-mode))

  :config
  (add-hook 'js2-mode-hook
	    #'(lambda ()
		(setq js2-basic-offset 2
		      indent-tabs-mode nil)
		))
  )
