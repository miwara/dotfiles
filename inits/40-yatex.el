;; yatex mode

(setq auto-mode-alist
      (append '(("\\.tex$" . yatex-mode)
		("\\.ltx$" . yatex-mode)
		("\\.cls$" . yatex-mode)
		("\\.sty$" . yatex-mode)
		("\\.clo$" . yatex-mode)
		("\\.bbl$" . yatex-mode)) auto-mode-alist))
(autoload 'yatex-mode "yatex" "Yet Another LaTeX mode" t)

;; YaTeXの文字コード設定
;; nil=YaTeX-kanji-code が nil なら coding-system に感知しない．
;; 0=no-conversion -> Emacs内部で使用されている文字コード(Emacs23 では utf-8-emacs)
;; 1=Shift JIS (Shift_JIS)
;; 2=JIS (ISO-2022-JP)
;; 3=EUC (EUC-JP)
;; 4=UTF-8
(setq YaTeX-kanji-code 4)

;; skk対策
(add-hook 'skk-mode-hook
	  (lambda ()
	    (if (eq major-mode 'yatex-mode)
		(progn
		  (define-key skk-j-mode-map "\\" 'self-insert-command)
		  (define-key skk-j-mode-map "$" 'YaTeX-insert-dollar)
		  ))
	    ))

;; 自動改行off
(add-hook 'yatex-mode-hook '(lambda () (auto-fill-mode -1)))

;; メッセージは utf-8 にする
(setq YaTeX-latex-message-code 'utf-8)

;; tex関連のファイルを開くと文字コードを utf-8 にする
(modify-coding-system-alist 'file "\\.tex\\'" 'utf-8)
(modify-coding-system-alist 'file "\\.cls\\'" 'utf-8)
(modify-coding-system-alist 'file "\\.sty\\'" 'utf-8)
