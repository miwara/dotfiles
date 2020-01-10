;; multiple-cursors
;; https://github.com/emacsmirror/multiple-cursors

(use-package multiple-cursors
  :defer t

  :bind (("C-^" . mc/edit-lines)
	 ("C-M-a" . mc/mark-all-like-this)
	 ;; windows用のkey-bind
	 ("M-[ 1 ; 6 n" . mc/mark-next-like-this)     ;; "C->" にしたかったがこれでないと動かなかった
	 ("M-[ 1 ; 6 l" . mc/mark-previous-like-this) ;; "C-<" にしたかったがこれでないと動かなかった
	 ;; mac用のkey-bind
	 ("M-." . mc/mark-next-like-this)
	 ("M-," . mc/mark-previous-like-this)
  )
)
