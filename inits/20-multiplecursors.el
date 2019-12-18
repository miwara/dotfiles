;; multiple-cursors
;; https://github.com/emacsmirror/multiple-cursors

(use-package multiple-cursors
  :defer t

  :bind (("C-^" . mc/edit-lines)
	 ("M-[ 1 ; 6 n" . mc/mark-next-like-this)     ;; "C->" にしたかったがこれでないと動かなかった
	 ("M-[ 1 ; 6 l" . mc/mark-previous-like-this) ;; "C-<" にしたかったがこれでないと動かなかった
	 ("C-M-a" . mc/mark-all-like-this)
  )
)
