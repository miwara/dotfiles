;; smartrep

(require 'smartrep)

;; prefix キー(使えない)
(defvar ctl-meta-q-map (make-keymap))
(define-key global-map "\C-\M-q" ctl-shift-q-map)

;; 基本コマンド
(smartrep-define-key
    global-map "C-M-q" '(
		       ;; main-window
		       ("n" . (lambda () (scroll-up 1)))
		       ("p" . (lambda () (scroll-up -1)))
		       ;; 分割画面操作
		       ("j" . (lambda () (scroll-other-window 1)))
		       ("k" . (lambda () (scroll-other-window -1)))
		       ("N" . 'scroll-other-window)
		       ("P" . (lambda () (scroll-other-window '-)))
		       ("a" . (lambda () (beginning-of-buffer-other-window 0)))
		       ("e" . (lambda () (end-of-buffer-other-window 0)))
		       ("o" . (lambda () (other-window 1)))
		       ("O" . (lambda () (other-window -1)))
		       ;; tabbar
		       ("]" . 'tabbar-forward-tab)
		       ("[" . 'tabbar-backward-tab)
		       ;; multiple-cursors
		       ("C-q" . 'mc/mark-next-like-this)
		       ("C-p" . 'mc/mark-previous-like-this)
		       ("C-a" . 'mc/mark-all-like-this)
		       ))

;; org-mode
(eval-after-load "org"
  '(progn
     (smartrep-define-key
	 org-mode-map "C-c" '(
			      ("C-n" . (lambda ()
					 (outline-next-visible-heading 1)))
			      ("C-p" . (lambda ()
					 (outline-previous-visible-heading 1)))
			      ))))
