;; multiple-cursors
;; https://github.com/emacsmirror/multiple-cursors

(use-package multiple-cursors
  :ensure t
  :defer t

  :bind (("C-^" . mc/edit-lines)
	 ("C-M-a" . mc/mark-all-like-this)
	 ;; windows用のkey-bind
	 ("M-[ 1 ; 6 n" . mc/mark-next-like-this)     ;; "C->" にしたかったがこれでないと動かなかった
	 ("M-[ 1 ; 6 l" . mc/mark-previous-like-this) ;; "C-<" にしたかったがこれでないと動かなかった
	 ;; mac用のkey-bind
	 ("C-c m ." . mc/mark-next-like-this)
	 ("C-c m ," . mc/mark-previous-like-this)
	 ("M-<down>" . mc/mark-next-lines)
	 ("M-<up>" . mc/mark-previous-lines)
  )
)
