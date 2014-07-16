;; Eshell
;; last update : 2014/06/15

(add-hook 'eshell-mode-hook (lambda ()
			      (define-key eshell-mode-map "\C-a" 'eshell-bol)
			      (setq eshell-scroll-show-maximum-output t)
			      (setq eshell-scroll-to-bottom-on-output nil)
			      (setq eshell-save-history-on-exit nil)
			      (setq eshell-cmpl-ignore-case t)
			      ))

;; F6で起動
(global-set-key [f6] 'eshell)

;; eshell clear
(defun eshell/clear ()
  "Clear the current buffer, leaving one prompt at the top."
  (interactive)
  (let (inhibit-read-only t)
    (erase-buffer)))

