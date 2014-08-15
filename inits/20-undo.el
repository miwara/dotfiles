;; extension undo
;; last update : 2014/07/13

(require 'undo-tree)
(global-undo-tree-mode t)
(global-set-key (kbd "M-/") 'undo-tree-redo)

(require 'undohist)
(undohist-initialize)
