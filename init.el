;; 文字コード
(setq default-buffer-file-coding-system 'utf-8)
(set-default-coding-systems 'utf-8)
(prefer-coding-system 'utf-8)

;; package.elの設定
(require 'package)
(package-initialize)

(setq package-archives
      '(("gnu" . "http://elpa.gnu.org/packages/")
	("melpa" . "http://melpa.org/packages/")
	("org" . "http://orgmode.org/elpa")))

(unless package-archive-contents
  (package-refresh-contents))

(setq custom-file (expand-file-name "custom.el" user-emacs-directory))
(when (file-exists-p custom-file)
  (load custom-file))

(load "~/dotfiles/inits/00-style.el")

(load "~/dotfiles/inits/00-system.el")

;; -----------------------------------------------------------------------------

;; Eshell
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


;; yasnippet
;; https://github.com/capitaomorte/yasnippet
(use-package yasnippet
  :ensure t
  :init
  (yas-global-mode t)

  ;; 自作スニペットの保存先
  (setq yas-snippet-dirs
      '("~/.emacs.d/snippets"))

  :bind (:map yas-minor-mode-map
	 ;; 既存スニペットを挿入する
	 ("C-x i i" . yas-insert-snippet)
	 ;; 新規スニペットを作成するバッファを用意する
	 ("C-x i n" . yas-new-snippet)
	 ;; 既存スニペットを閲覧・編集する
	 ("C-x i v" . yas-visit-snippet-file)
	)
  )


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
	 ("M-." . mc/mark-next-like-this)
	 ("M-," . mc/mark-previous-like-this)
  )
)
