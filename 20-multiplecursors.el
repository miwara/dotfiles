;; multiple-cursors
;; last update : 2014/06/22
;; https://github.com/emacsmirror/multiple-cursors

(require 'multiple-cursors)

(global-set-key (kbd "C->") 'mc/mark-next-like-this)
(global-set-key (kbd "C-<") 'mc/mark-previous-like-this)
(global-set-key (kbd "C-c C-a") 'mc/mark-all-like-this)
