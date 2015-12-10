;; yasnippet
;; https://github.com/capitaomorte/yasnippet

(require 'yasnippet)
(yas-global-mode 1)

;; 自作スニペットの保存先
(setq yas-snippet-dirs
      '("~/.emacs.d/snippets"))

;; 既存スニペットを挿入する
(define-key yas-minor-mode-map (kbd "C-x i i") 'yas-insert-snippet)
;; 新規スニペットを作成するバッファを用意する
(define-key yas-minor-mode-map (kbd "C-x i n") 'yas-new-snippet)
;; 既存スニペットを閲覧・編集する
(define-key yas-minor-mode-map (kbd "C-x i v") 'yas-visit-snippet-file)
